/*
* transient list of leg scores for a certain player
*/

App.LegScores = Ember.Object.extend({
  player: null,
  leg: null,
  scores: [],

  isCheckoutPossible: function() {
    var rs = this.get('requiredScore');
    if (rs<162) {
      return true;
    }
    if (rs===170 || rs===167 || rs===164) {
      return true;
    }
    return false;
  }.property('requiredScore'),
 
  requiredScore: function() {
    var rs = this.get('leg.match.startScore');

    this.get('scores').forEach(function(score) {
      rs-=score;
    });
    return rs;
  }.property('scores.@each')

});

