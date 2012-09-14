myApp.models.note = Backbone.Model.extend({
  urlRoot: '/notes'
})

myApp.collections.notes = Backbone.Collection.extend({
  model: myApp.models.note
})
