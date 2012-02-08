class MediaFilesController < ApplicationController
  respond_to :html, :json

  def index
    @media_files = MediaFile.new(Rails.root).entries
    respond_with(@media_files)
  end
  
end
