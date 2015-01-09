class Api::TracksController < ApplicationController
  def index
    @tracks = Track.includes(:uploader)
    render :index
  end

  def show
    @track = Track.includes(:uploader).find(params[:id])
    render :show
  end

  def create
    @track = current_user.tracks.new(track_params)
    if @track.save
      render :show
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = current_user.tracks.find(params[:id])
  end

  def update
    @track = current_user.tracks.find(params[:id])
    if @track.update(track_params)
      render :show
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def destroy
    @track = current_user.tracks.find(params[:id])
    @track.destroy
    render :index
  end

  private

  def track_params
    params.require(:track).permit([:title, :cover_art_url])
  end

end