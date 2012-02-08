MediamedoiV2.Views.MediaFiles ||= {}

class MediamedoiV2.Views.MediaFiles.ShowView extends Backbone.View
  template: JST["backbone/templates/media_files/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
