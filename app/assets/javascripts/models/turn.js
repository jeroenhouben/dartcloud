/*
* Turn
*
*/
App.Turn = DS.Model.extend({
  legPlayer: DS.belongsTo('App.LegPlayer'),
  dart1: DS.attr('number'),
  dart2: DS.attr('number'),
  dart3: DS.attr('number'),
  completed: DS.attr('boolean'),
  simpleScore: DS.attr('number'), // if they chose to register the summed score at once, not using the individual dart scores.
  leg: Em.computed.alias('legPlayer.leg'),

  score: function() {
    var score;
    if (this.get('simpleScore') == null) {
      var d1 = this.get('dart1'), d2 = this.get('dart2'), d3 = this.get('dart3');
      score = (d1 ? d1 : 0) + (d2 ? d2 : 0) + (d3 ? d3 : 0);
    } else {
      score = this.get('simpleScore');
    }
    return score;
  }.property('dart1','dart2','dart3', 'simpleScore'),
  
  
  isCompleted: function() {
    return this.get('completed');
  }.property('completed')
  
});
