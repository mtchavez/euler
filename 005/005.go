// Problem 5
// 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
//
// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
package main

import ()

func main() {
	smallest := 1
	even := true
	for {
		even = true
		for i := 1; i <= 20; i++ {
			if smallest%i != 0 {
				even = false
				break
			}
		}
		if even {
			goto DONE
		}
		smallest += 1
	}
DONE:
	println(smallest)
}
