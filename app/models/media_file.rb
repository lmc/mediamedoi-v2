class MediaFile < Pathname

  include ActiveModel::Serialization
  include ActiveModel::Serializers::JSON 
  self.include_root_in_json = false

  MEDIA_ROOT = Rails.root.to_s

  def self.new_from_media_path(media_path)
    media_path = sanitize_media_path(media_path)
    new( File.join(MEDIA_ROOT,media_path) )
  end

  def self.sanitize_media_path(media_path)
    media_path
  end

  def id
    self.media_path.hash
  end

  def label
    self.basename.to_s
  end

  def media_path
    self.realpath.to_s[MEDIA_ROOT.size..-1]
  end

  def attributes
    {
      :id         => id,
      :label      => label,
      :media_path => media_path 
    }
  end
end