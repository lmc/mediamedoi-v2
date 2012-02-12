class MediamedoiV2.Routers.MediaFilesRouter extends Backbone.Router
  initialize: (options) ->
    @media_files = new MediamedoiV2.Collections.MediaFilesCollection()

  routes:
    "/*path"    : "index"
    ".*"        : "index"

  index: (path) ->
    path = path ? ""
    console.log("#index path="+path)
    $.getJSON('/media_files?path='+path).
      success( (data) =>
        console.log("#index success")
        @media_files.reset data
        @view = new MediamedoiV2.Views.MediaFiles.IndexView(collection: @media_files)
        $("#media_files").html(@view.render().el)
      )
