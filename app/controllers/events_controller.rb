class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def medications
    event = Event.create name: "Grandma took her medications",
      lat: params[:lat], lng: params[:lng], color: "info", notify: false
    render status: 200, inline: "success"
  end

  def minorfall
    event = Event.create name: "Fall Detected: Grandma says she is okay",
      lat: params[:lat], lng: params[:lng], color: "warning"
    render status: 200, inline: "success"
  end

  def majorfall
    event = Event.create name: "Fall Detected: Grandma says she needs help",
      lat: params[:lat], lng: params[:lng], color: "danger"
    render status: 200, inline: "success"
  end
  
  def panic
    event = Event.create name: "Panic Button",
      lat: params[:lat], lng: params[:lng], color: "danger"
    render status: 200, inline: "success"
  end
  
  def weight
    event = Event.create name: "New Weight: #{params[:weight]} lbs", color: 'info', notify: false
    render status: 200, inline: "Success"
  end
    
  # called from events#index and updates to the table #events-table
  def refresh
    @events = Event.where("id > ?", params[:last_event_id])
    render "refresh.js"
  end
  
  # GET /events
  def index
    @events = Event.order("created_at DESC").limit(8)
    @followers = Follower.all
    
    @meds = [
      {name: 'Simvastatin', indication: "Lowers cholesterol", dose: '20mg at bedtime', doses: [nil, true, nil, nil], missed: 1},
      {name: 'Lisinopril', indication: "Lowers blood pressure", dose: '40mg daily', doses: [true, nil, false, nil], missed: 4},
      {name: 'Metformin', indication: "Controls diabetes", dose: '1000mg twice daily', doses: [true, true, false, nil], missed: 4},
      {name: 'Aspirin', indication: "Prevents heart attacks & strokes", dose: '81mg daily', doses: [true, true, false, nil], missed: 2},
      {name: 'Furosemide', indication: "Lowers blood pressure", dose: '40mg daily', doses: [true, true, false, nil], missed: 4},
      {name: 'Levetiracetam', indication: "Prevents Seizures", dose: '1000mg twice daily', doses: [true, true, false, nil], missed: 4}
      
      ]
    
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
