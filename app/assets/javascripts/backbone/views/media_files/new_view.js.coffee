MediamedoiV2.Views.MediaFiles ||= {}

class MediamedoiV2.Views.MediaFiles.NewView extends Backbone.View
  template: JST["backbone/templates/media_files/new"]

  events:
    "submit #new-media_file": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (media_file) =>
        @model = media_file
        window.location.hash = "/#{@model.id}"

      error: (media_file, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
