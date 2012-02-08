MediamedoiV2.Views.MediaFiles ||= {}

class MediamedoiV2.Views.MediaFiles.MediaFileView extends Backbone.View
  template: JST["backbone/templates/media_files/media_file"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
