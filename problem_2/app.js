var fib = require('./fibonacci'),
    sum = fib.sequence(4000000, {even: true, sum: true});

console.log('Solution for even fibonacci numbers up to 4 mil summed is: ' + sum);
