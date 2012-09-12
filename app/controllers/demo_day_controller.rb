class DemoDayController < ApplicationController
  #before_filter :only_allow_in_staging
  before_filter :login_required, :only => [:attend]
  before_filter :load_and_validate_demo_day

  def index
    if @before
      render :action => :before if @before
      #render :action => :after if @after
      return
    end
    @question_count = Question.group('startup_id').unanswered.count
  end

    # Show a specific company
  def show
    if @demo_day.startup_ids[params[:id].to_i].present?
      @startup = Startup.find(@demo_day.startup_ids[params[:id].to_i])
      # Load all checkins made before demo day
      @checkins = @startup.checkins.where(['created_at < ?', "#{@demo_day.day} 00:00:00"]).ordered.includes(:before_video, :after_video)
    else
      redirect_to :action => :index
      return
    end
    
    initialize_tokbox_session(@startup)

    load_questions_for_startup(@startup)
    
    @num_checkins = @startup.checkins.count
    @num_awesomes = @startup.awesomes.count
    @screenshots = @startup.screenshots.ordered

    @video = @demo_day.video_for_startup(@startup)
  end

  # Register that you've attended demo day
  def attend
    @demo_day.add_attendee!(current_user)
    redirect_to :action => :index
  end
end
