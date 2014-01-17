class VideosController < ApplicationController
  require 'aws/s3'
  load_and_authorize_resource
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.all
    @uploader = Video.new.video_url
    @uploader.success_action_redirect = new_video_url
  end

  def show
  end

  def new
    @video = Video.new(key: params[:key])
  end

  def edit
  end

  def download
     @media = Video.find(params[:id])
     redirect_to @media.download_url
  end

  def download_url
    binding.pry
    @video = Video.find(params[:video_id])
    @url = @video.download_url(params[:expiration].to_i)
    @url_data = {
      url: @url
    }
    respond_to do |format|
      format.json { render :json => @url_data }
    end
  end

  def create
    @video = Video.new(video_params)
    @video.filename = @video.video_url.filename
    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render action: 'show', status: :created, location: @video }
      else
        format.html { render action: 'new' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @video.update(video_params)
        @video.filename = @video.video_url.filename
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:name, :description, :video_url, :filename, :key)
    end
end
