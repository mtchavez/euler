// Problem 12
// The sequence of triangle numbers is generated by adding the natural numbers.
// So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
//
// 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
//
// Let us list the factors of the first seven triangle numbers:
//
//  1: 1
//  3: 1,3
//  6: 1,2,3,6
// 10: 1,2,5,10
// 15: 1,3,5,15
// 21: 1,3,7,21
// 28: 1,2,4,7,14,28
// We can see that 28 is the first triangle number to have over five divisors.
//
// What is the value of the first triangle number to have over five hundred divisors?
package main

import (
	"fmt"
	"math"
)

func isPrime(n int64) bool {
	if n < 2 {
		return false
	}
	if n <= 3 {
		return true
	}
	if (n%2 == 0) || (n%3 == 0) {
		return false
	}

	maxDiv := int64(math.Sqrt(float64(n)))
	var div int64
	for div = 5; div <= maxDiv; div += 6 {
		if n%div == 0 || n%(div+2) == 0 {
			return false
		}
	}
	return true
}

// Brute force
func divisorsOf(n int64) []int64 {
	max := math.Floor(math.Sqrt(float64(n)))
	var i int64
	var nums = make(map[int64]int64)
	for i = 1; i <= int64(max); i++ {
		factor := (n / i)
		if int64(math.Floor(float64(factor)))*i == n {
			nums[i] = i
			if factor != n {
				nums[factor] = factor
			}
		}
	}
	var keys []int64
	for k := range nums {
		keys = append(keys, k)
	}
	return keys
}

func triangleNum(n int64) (triangle int64) {
	var i int64
	for i = 1; i <= n; i++ {
		triangle += i
	}
	return
}

// Prime factorized approach

type Div struct {
	Num          int64
	Tri          int64
	PrimeFactors []int64
	MaxDiv       int64
	Result       int64
}

func initDiv(num int64) *Div {
	d := &Div{Num: num}
	d.MaxDiv = int64(math.Floor(math.Sqrt(float64(d.Num))))
	d.setTriangle()
	d.setPrimeFactors()
	return d
}

func (d *Div) setTriangle() *Div {
	var i int64
	for i = 1; i <= d.Num; i++ {
		d.Tri += i
	}
	return d
}

func (d *Div) setPrimeFactors() *Div {
	if d.Tri <= 0 {
		return d
	}
	var num int64 = 1
	for num = 1; num <= d.MaxDiv; num++ {
		if isPrime(num) && d.Num%num == 0 {
			d.PrimeFactors = append(d.PrimeFactors, num)
		}
	}
	return d
}

// Table
// (2^1 * 3^1)  (2^2 * 3^1)
// (2^1 * 3^2)  (2^2 * 3^2)
// (2^1 * 3^3)  (2^2 * 3^3)

func (d *Div) calcDivisors() {
	var largestDim int64 = 0
	maxes := make([]int64, len(d.PrimeFactors))
	for i, num := range d.PrimeFactors {
		maxes[i] = int64(math.Floor(math.Pow(float64(d.Num), float64(1/float64(num)))))
		if maxes[i] > largestDim {
			largestDim = maxes[i]
		}
	}
	table := make([][]int64, largestDim)
	for i := range table {
		table[i] = make([]int64, largestDim)
	}
	var i, j int64

	for i = 0; i < largestDim; i++ {
		for j = 0; j < largestDim; j++ {
			var prod int64 = 1
			var total int64 = (i + 1) + (j + 1)
			for x, prime := range d.PrimeFactors {
				pow := j + 1
				if x == 0 {
					pow = i + 1
				}
				prod = prod * int64(math.Pow(float64(prime), float64(pow)))
			}
			table[i][j] = prod
			if prod == d.Num {
				d.Result = total
				return
			}
		}
	}
	d.Result = d.MaxDiv
	return
}

func main() {
	var maxDivisors int64 = 500
	var i int64
	var tri int64
	for {
		tri = triangleNum(i)
		if len(divisorsOf(tri)) >= int(maxDivisors) {
			fmt.Println(tri)
			return
		}
		i++
	}
}