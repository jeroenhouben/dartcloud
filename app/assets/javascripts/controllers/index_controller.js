App.IndexController = Ember.Controller.extend({

  newMatch: function() {
    var t = this.get('store').transaction(),
        m = t.createRecord(App.Match, {});

    this.set('content', m);
    this.transitionToRoute('match.setup', m)
  }

});