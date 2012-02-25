MediamedoiV2.Views.MediaFiles ||= {}

class MediamedoiV2.Views.MediaFiles.IndexView extends Backbone.View
  template: JST["backbone/templates/media_files/index"]

  events:
    'click tr'         : 'navigate'
    'click a.navigate' : 'navigate'

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (mediaFile) =>
    view = new MediamedoiV2.Views.MediaFiles.MediaFileView({model : mediaFile})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(media_file: @model.toJSON() ))
    @addAll()

    return this

  navigate: (event) =>
    url = $(event.target).closest('tr').find('a.navigate').attr('href')
    Backbone.history.navigate(url, true)
