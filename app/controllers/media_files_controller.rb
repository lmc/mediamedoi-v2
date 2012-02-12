class MediaFilesController < ApplicationController
  respond_to :html, :json

  def index
    @media_files = MediaFile.new_from_media_path(params[:path] || "").children
    respond_with(@media_files)
  end
  
end
