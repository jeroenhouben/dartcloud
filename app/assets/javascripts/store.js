App.Adapter = DS.RESTAdapter.extend({
  namespace: 'api/v1',
  bulkCommit: false,
  generateIdForRecord: function(store, record) {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
      var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
      return v.toString(16);
    });
  },
});

App.Adapter.configure("plurals", {
  match: "matches"
});
App.Adapter.configure("App.LegPlayer", {
  sideloadAs: 'leg_players'
});

App.Adapter.configure("App.Player", {
  sideloadAs: 'players'
});
App.Adapter.configure("App.Leg", {
  sideloadAs: 'legs'
});

App.Adapter.configure("App.Match", {
  sideloadAs: 'matches'
});


App.Adapter.map('App.Leg', {
  legPlayers: {embedded: 'always'}
});

App.Adapter.map('App.Match', {
  players: {embedded: 'always'},
  legs: {embedded: 'always'}
});

App.Adapter.map('App.LegPlayer', {
  // winner: {embedded: 'always'}
});



App.Store = DS.Store.extend({
  revision: 12,
  adapter:  App.Adapter.create()
});
