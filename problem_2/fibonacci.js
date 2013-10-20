Array.prototype._sum = function(total){
  if(total === undefined){ total = 0; }

  if(this.length === 0) { return total; }
  if(this.length > 0)   { var n = this.pop(); return this._sum(total + n); }
};

var sequence = function(max, options){
  if(max     === undefined){ return [0]; }
  if(options === undefined){ options = {}; }

  var results = sequenceUpto(0, 1, max, [0], options);
  return options.sum ? results._sum() : results;
};

var sequenceUpto = function(current, next, upto, sequences, options){
  var n = current + next;
  var s = sequences;
      s.push(n);

  if(n > upto)                            { sequences.pop(); return sequences; }
  else if( options.even && (n % 2) === 1) { sequences.pop(); return sequenceUpto(next, n, upto, sequences, options); }
  else if( options.odd  && (n % 2) === 0) { sequences.pop(); return sequenceUpto(next, n, upto, sequences, options); }
  else                                    { return sequenceUpto(next, n, upto, s, options); }
};

module.exports = {sequence: sequence};
