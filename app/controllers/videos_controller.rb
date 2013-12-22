class VideosController < ApplicationController
  require 'aws/s3'
  load_and_authorize_resource
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  def download
    @video = Video.find(params[:id])
    AWS::S3::Base.establish_connection!( :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'])
    s3File = AWS::S3::S3Object.find @video.video_url, ENV['AWS_VIDEO_BUCKET']
    redirect_to s3File.url(:expires_in => 30, :response_content_disposition => 'attachment;')
    # @video = Video.find(params[:id])
    # data = open(@video.video_url.url)
    # send_data data.read, type: data.content_type,
    #                 filename: @video.name
    #                 disposition: 'attachment',
    #                 stream: 'true',
    #                 buffer_size: '4096'
  end

  # POST /videos
  # POST /videos.json
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

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
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

  # DELETE /videos/1
  # DELETE /videos/1.json
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
      params.require(:video).permit(:name, :description, :video_url, :filename)
    end
end
