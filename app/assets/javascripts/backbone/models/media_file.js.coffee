class MediamedoiV2.Models.MediaFile extends Backbone.Model
  paramRoot: 'media_file'

  defaults:
    media_path: null

class MediamedoiV2.Collections.MediaFilesCollection extends Backbone.Collection
  model: MediamedoiV2.Models.MediaFile
  url: '/media_files'
