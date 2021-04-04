class Api::V1::TracksController < Api::V1::ApiController
  before_action :set_track, only: [:show, :update, :destroy]
  before_action :require_authorization!, only: [:show, :update, :destroy]
 
  # GET /api/v1/tracks

  def index
    @tracks = current_user.tracks
    render json: @tracks
  end

  # GET /api/v1/tracks/1 

  def show
    render json: @track
  end

  # POST /api/v1/tracks

  def create
    @track = Track.new(track_params.merge(user: current_user))
    if @track.save
      render json: @track, status: :created
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /api/v1/tracks/1
  
  def update
    if @track.update(track_params)
      render json: @track
    else
      render json: @track.errors, status: :unsprocessable_entity
    end
  end

  # DELETE /api/v1/tracks/1
  
  def destroy
    @track.destroy
  end

  # Support methods
  private
    def set_track
      @track = Track.find(params[:id])
    end

    def track_params
      params.require(:track).permit(:name, :artist, :genre, :file)
    end

    def require_authorization!
      unless current_user == @track.user
        render json: {}, status: :forbidden
      end
    end
end
