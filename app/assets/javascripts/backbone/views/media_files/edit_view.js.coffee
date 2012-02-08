MediamedoiV2.Views.MediaFiles ||= {}

class MediamedoiV2.Views.MediaFiles.EditView extends Backbone.View
  template : JST["backbone/templates/media_files/edit"]

  events :
    "submit #edit-media_file" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (media_file) =>
        @model = media_file
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
