class RequestsController < ApplicationController
  before_filter :login_required
  before_filter :load_requested_or_users_startup
  load_and_authorize_resource 

  def new
    # hardcode only request type available for now - and have to initialize or else price isn't set
    num = params[:num].present? ? params[:num].to_i : 1
    num = 10 if num > 10
    @request = Request.new(:startup => current_user.startup, :request_type => :retweet, :num => num)
  end

  def create
    @request.user = current_user
    @request.startup = current_user.startup
    if @request.save
      redirect_to '/'
    else
      logger.info "REQUEST ERRORS: #{@request.errors.inspect}"
      render :action => :edit
    end
  end

  def edit

  end

  def update
    if @request.save
      redirect_to @request
    else
      render :action => :edit
    end
  end
end