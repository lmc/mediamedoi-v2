class MediaFile < Pathname

  include ActiveModel::Serialization
  include ActiveModel::Serializers::JSON 
  self.include_root_in_json = false

  MEDIA_ROOT = Rails.root.to_s

  def id
    self.media_path.hash
  end

  def label
    self.basename.to_s
  end

  def media_path
    self.realpath.to_s
  end

  def attributes
    {
      :id         => id,
      :label      => label,
      :media_path => media_path 
    }
  end
end