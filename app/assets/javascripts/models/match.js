App.Match = DS.Model.extend({
  startScore: DS.attr('number', {defaultValue: 501}),
  players: DS.hasMany('App.Player'),
  legs: DS.hasMany('App.Leg'),

  // create a new Leg and enroll all players known in this match
  createNewLeg: function() {
    var t   = this.transaction,
        leg = t.createRecord(App.Leg, {match: this})

  
    // enroll players in leg by creating the join model
    this.get('players').forEach(function(player) {
      t.createRecord(App.LegPlayer, {player: player, leg: leg})
    });
    return leg;
  },

  is301: function() {
    return (this.get('startScore') == 301)
  }.property('startScore'),
 
  is501: function() {
    return (this.get('startScore') == 501)
  }.property('startScore')
  
});