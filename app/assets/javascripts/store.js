// App.Store = DS.Store.extend({
//   revision: 11,
//   adapter: 'DS.FixtureAdapter'
// });
// 

DS.RESTAdapter.configure("plurals", {
  match: "matches"
});

App.Store = DS.Store.extend({
  revision: 11,
  adapter: DS.RESTAdapter.extend({
    namespace: 'api/v1',
    bulkCommit: false,
    generateIdForRecord: function(store, record) {
      return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
        return v.toString(16);
      });
    }
  })
});
