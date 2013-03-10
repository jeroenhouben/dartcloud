App.Store = DS.Store.extend({
  revision: 11,
  adapter: 'DS.FixtureAdapter'
});


// App.Store = DS.Store.extend({
//   revision: 11,
//   adapter: DS.RESTAdapter.extend({
//     namespace: 'dartmeister/api/v1',
//     bulkCommit: true
//   })
// });
