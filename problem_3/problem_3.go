package main

import (
  "fmt"
  "math"
  "time"
)

func main() {
  t0 := time.Now()
  var N float64
  // N = 600851475143
  N = 13195
  // Largest prime factor of 13195: 29
  fmt.Println(largest_prime(N))
  t1 := time.Now()
  fmt.Println("Finished in", t1.Sub(t0))
}

func generate(c chan <- float64) {
  var i float64
  for i = 2; ; i++ {
    c <- i
  }
}

func prime_sieve(in <- chan float64, out chan <- float64, prime float64) {
  var i float64
  for {
    i = <- in
    if math.Mod(i, prime) != 0 {
      out <- i
    }
  }
}

func largest_prime(N float64) (float64) {
  c1 := make(chan float64)
  var i, prime, result float64
  go generate(c1)
  for i = 2; i < math.Ceil(math.Sqrt(N)); i++ {
    prime = <- c1
    c2 := make(chan float64)
    go prime_sieve(c1, c2, prime)
    c1 = c2
    if math.Mod(N, prime) == 0 {
      result = prime
    }
  }
  return result
}


