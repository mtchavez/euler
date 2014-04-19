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
			tmp := list[idx]
			list[idx] = list[i]
			list[i] = tmp

			permutations(list, idx+1)

			tmp = list[idx]
			list[idx] = list[i]
			list[i] = tmp
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
