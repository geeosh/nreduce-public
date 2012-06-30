class RelationshipsController < ApplicationController
  around_filter :record_user_action
  before_filter :login_required
  before_filter :current_startup_required

  def index
    @startups = @current_startup.connected_to
    @pending_relationships = @current_startup.pending_relationships
    @current_checkin = @current_startup.current_checkin
    @checkins_by_startup = Checkin.current_checkin_for_startups(@startups + [@current_startup])
    # Sort by startups who have the most recent completed checkins first
    long_ago = Time.now - 100.years
    @startups.sort! do |a,b|
      a_time, b_time = long_ago, long_ago
      if !@checkins_by_startup[a.id].blank?
        if @checkins_by_startup[a.id].completed?
          a_time = @checkins_by_startup[a.id].completed_at
        elsif @checkins_by_startup[a.id].submitted?
          a_time = @checkins_by_startup[a.id].submitted_at
        end
      end
      if !@checkins_by_startup[b.id].blank?
        if @checkins_by_startup[b.id].completed?
          b_time = @checkins_by_startup[b.id].completed_at
        elsif @checkins_by_startup[b.id].submitted?
          b_time = @checkins_by_startup[b.id].submitted_at
        end
      end
      a_time <=> b_time
    end
    # Add user's startup to the beginning, and then sort by reverse chrono order
    @startups = [@current_startup] + @startups.reverse
    @commented_on_checkin_ids = current_user.commented_on_checkin_ids
  end

  def create
    @relationship = Relationship.start_from_params(params[:relationship])
    if @relationship.blank? # TODO: NOT REALLY THE CORRECT CONCLUSION
      flash[:alert] = "You aren't allowed to connect with yourself, silly!"
    elsif @relationship.pending?
      flash[:notice] = "Your connection has been requested with #{@relationship.connected_with.name}."
    elsif @relationship.approved?
      flash[:notice] = "You are already connected to #{@relationship.connected_with.name}."
    elsif @relationship.rejected?
      flash[:alert] = "Sorry, but #{@relationship.connected_with.name} has ignored your connection request."
    end
    respond_to do |format|
      format.html { redirect_to '/' }
      format.js
    end
  end

  def approve
    relationship = Relationship.find(params[:id])
    if relationship.approve!
      flash[:notice] = "You are now connected to #{relationship.entity.name}."
    else
      flash[:alert] = "Sorry but the relationship couldn't be approved at this time."
    end
    redirect_to relationships_path
  end

  def reject
    relationship = Relationship.find(params[:id])
    if relationship.reject!
      flash[:notice] = "You have removed #{relationship.connected_with.name} from your group."
    else
      flash[:alert] = "Sorry but the relationship couldn't be removed at this time."
    end
    redirect_to relationships_path
  end
end
