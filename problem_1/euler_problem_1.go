package main

import (
  "fmt"
  "math"
)

func main() {
  var N, N1, N2, N3, i, sum float64
  N = 1000
  N1 = math.Ceil(N/3.0)
  N2 = math.Ceil(N/5.0)
  N3 = math.Ceil(N/15.0)
  sum = 0
  i = 1
  for i < N1 {
    sum += 3*i
    i++
  }
  i = 1
  for i < N2 {
    sum += 5*i
    i++
  }
  // Subtracting double counted numbers (multiples of 15)
  i = 1
  for i < N3 {
    sum -= 15*i
    i++
  }
  fmt.Println(sum)
}
