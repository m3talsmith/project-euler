class Array
  def sum
    self.inject(0) {|n, total| total + n}
  end
end

def sequence max=0, options={}
  return [0] if max == 0
  results = sequence_up_to(0, 1, max, [0], options)
  return options[:sum] ? results.sum : results
end

def sequence_up_to current_value=0, next_value=1, upto=0, sequences=[0], options={}
  n = current_value + next_value
  return sequences if n > upto
  return sequence_up_to(next_value, n, upto, sequences, options) if options[:even] && n.even?
  return sequence_up_to(next_value, n, upto, sequences, options) if options[:odd]  && n.odd?
  return sequence_up_to(next_value, n, upto, sequences + [n], options)
end

max = 400000

puts "Sequences up to 4 mil: #{sequence(max)}"
puts "Sequences up to 4 mil summed: #{sequence(max, {sum: true})}"
puts "Sequences up to 4 mil even selected and summed: #{sequence(max, {even: true, sum: true})}"
puts "Sequences up to 4 mil odd selected and summed: #{sequence(max, {odd: true, sum: true})}"
