App.IndexController = Ember.Controller.extend({

  newMatch: function() {
    var transaction = this.get('store').transaction();
    var m = transaction.createRecord(App.Match, {});
    transaction.commit();
    this.set('content', m);
    this.transitionToRoute('match.setup', m)
  }

});