class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def minorfall
    event = Event.create name: "Fall detected: Grandma says she is okay"
    render status: 200, inline: "success"
  end

  def majorfall
    event = Event.create name: "Fall detected: Grandma says she needs help"
    render status: 200, inline: "success"
  end
  
  # called from events#index and updates to the table #events-table
  def refresh
    @events = Event.where("id > ?", params[:last_event_id])
    render "refresh.js"
  end
  
  # GET /events
  def index
    @events = Event.order("created_at DESC").limit(12)
    @followers = Follower.all
  end

  # GET /events/1
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:name, :lat, :lng)
    end
end
