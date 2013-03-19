App.IndexController = Ember.Controller.extend({

  newMatch: function() {
    var m = App.Match.createRecord({});
    this.set('content', m);
    this.transitionToRoute('match.setup', m)
  }

});