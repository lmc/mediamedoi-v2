class MediamedoiV2.Routers.MediaFilesRouter extends Backbone.Router
  initialize: (options) ->
    @media_file  = new MediamedoiV2.Models.MediaFile()
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

        @media_file  = new MediamedoiV2.Models.MediaFile(data.media_file)
        @media_files.reset data.children

        @view = new MediamedoiV2.Views.MediaFiles.IndexView(model: @media_file, collection: @media_files)
        $("#media_files").html(@view.render().el)
      ).
      error( (a1,a2,a3,a4) =>
        console.log("#index error")
        alert("Whoops, failed to load :(")
      )
