class MediaFilesController < ApplicationController
  respond_to :html, :json

  def index
    @media_file = MediaFile.new_from_media_path(params[:path] || "")
    respond_to do |format|
      format.html
      format.json { render :json => { :media_file => @media_file, :children => @media_file.children } }
    end
  end
  
end
