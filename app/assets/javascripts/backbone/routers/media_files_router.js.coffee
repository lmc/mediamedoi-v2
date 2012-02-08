class MediamedoiV2.Routers.MediaFilesRouter extends Backbone.Router
  initialize: (options) ->
    @media_files = new MediamedoiV2.Collections.MediaFilesCollection()
    @media_files.reset options.media_files

  routes:
    "/new"      : "newMediaFile"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newMediaFile: ->
    @view = new MediamedoiV2.Views.MediaFiles.NewView(collection: @media_files)
    $("#media_files").html(@view.render().el)

  index: ->
    @view = new MediamedoiV2.Views.MediaFiles.IndexView(collection: @media_files)
    $("#media_files").html(@view.render().el)

  show: (id) ->
    media_file = @media_files.get(id)

    @view = new MediamedoiV2.Views.MediaFiles.ShowView(model: media_file)
    $("#media_files").html(@view.render().el)

  edit: (id) ->
    media_file = @media_files.get(id)

    @view = new MediamedoiV2.Views.MediaFiles.EditView(model: media_file)
    $("#media_files").html(@view.render().el)
