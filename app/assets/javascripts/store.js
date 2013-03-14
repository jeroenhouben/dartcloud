App.Adapter = DS.RESTAdapter.extend({
  namespace: 'api/v1',
  bulkCommit: false,
  generateIdForRecord: function(store, record) {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
      var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
      return v.toString(16);
    });
  }
});

App.Adapter.configure("plurals", {
  match: "matches"
});

App.Adapter.map('App.Leg', {
  players: {embedded: 'always'}
});

App.Adapter.map('App.Match', {
  players: {embedded: 'always'},
  legs: {embedded: 'always'}
});


App.Store = DS.Store.extend({
  revision: 11,
  adapter:  App.Adapter.create()
});
