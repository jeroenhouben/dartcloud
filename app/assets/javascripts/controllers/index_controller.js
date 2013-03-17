App.IndexController = Ember.Controller.extend({

  newMatch: function() {
    m = App.Match.createRecord();
    this.set('content', m);
    this.transitionToRoute('match.setup', m)
  }

});