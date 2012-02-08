class MediaFile < Pathname

  include ActiveModel::Serialization
  include ActiveModel::Serializers::JSON 
  self.include_root_in_json = false

  def id
    media_path.hash
  end

  def media_path
    realpath.to_s
  end

  def attributes
    {
      :id         => id,
      :media_path => media_path
    }
  end
end