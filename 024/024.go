// Problem 24
// A permutation is an ordered arrangement of objects.
// For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
// If all of the permutations are listed numerically or alphabetically, we call
// it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
//
// 012   021   102   120   201   210
//
// What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
package main

import (
	"fmt"
	"sort"
)

var perm []string

func addPerm(list []int) {
	stringVal := ""
	copied := make([]int, len(list))
	copy(copied, list)
	for _, val := range copied {
		stringVal += fmt.Sprintf("%d", val)
	}
	perm = append(perm, stringVal)
}

func permutations(list []int, idx int) {
	if (len(list) - idx) == 1 {
		addPerm(list)
	} else {
		for i := idx; i < len(list); i++ {
			list[idx], list[i] = list[i], list[idx]
			permutations(list, idx+1)
			list[idx], list[i] = list[i], list[idx]
		}
	}
}

func main() {
	list := []int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
	fmt.Println("Finding permutations...")
	permutations(list, 0)
	fmt.Println("Sorting...")
	sort.Sort(sort.StringSlice(perm))
	fmt.Printf("%+v\n", perm[999999])
}
