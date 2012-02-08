MediamedoiV2.Views.MediaFiles ||= {}

class MediamedoiV2.Views.MediaFiles.IndexView extends Backbone.View
  template: JST["backbone/templates/media_files/index"]

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (mediaFile) =>
    view = new MediamedoiV2.Views.MediaFiles.MediaFileView({model : mediaFile})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(mediaFiles: @collection.toJSON() ))
    @addAll()

    return this
