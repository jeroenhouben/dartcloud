/*
* A Leg, belonging to a Match has a bunch of enrolled PLayers/Profiles (=LegPlayer)
*
*/
App.Leg = DS.Model.extend({
  match: DS.belongsTo('App.Match'),
  players: DS.hasMany('App.Player'),
  turns: DS.hasMany('App.Turn'),
  winner: DS.belongsTo('App.Player')
});
