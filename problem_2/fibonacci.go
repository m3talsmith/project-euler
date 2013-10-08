package main

import "fmt"

// fibonacci is a function that returns
// a function that returns an int.
func fibonacci() func() int {
    n := 0
    f_prev_2 := 1
    f_prev_1 := 1
     
    return func() int {
        var result int
        if n == 0 {
            n++ 
            result = f_prev_2
        } else if n == 1 {
            n++
            result = f_prev_1
        } else {
            result = f_prev_1 + f_prev_2
            f_prev_2 = f_prev_1
            f_prev_1 = result
        }
        return result
        
    }
}

func main() {
    f := fibonacci()
    for i := 0; i < 10; i++ {
        fmt.Println(f())
    }

}