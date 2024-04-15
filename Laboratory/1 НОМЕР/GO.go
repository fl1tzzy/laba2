package main

import (
	"fmt"
	"math"
)

func isPrime(n int) bool {
	if n <= 1 {
		return false
	}
	if n <= 3 {
		return true
	}
	if n%2 == 0 || n%3 == 0 {
		return false
	}
	i := 5
	for i*i <= n {
		if n%i == 0 || n%(i+2) == 0 {
			return false
		}
		i += 6
	}
	return true
}

func main() {
	var N int
	fmt.Scan(&N)

	left, right := 0, 0

	// Поиск ближайшего правого простого числа
	for i := N; ; i++ {
		if isPrime(i) {
			right = i
			break
		}
	}
	// Является ли введённое число N простым числом
	if right == N {
		fmt.Println(0)
		return
	}

	// Поиск ближайшего левого простого числа
	for i := N; i > 0; i-- {
		if isPrime(i) {
			left = i
			break
		}
	}

	// Вывод наименьшей разности по модулю
	fmt.Println(math.Min(math.Abs(float64(N-left)), math.Abs(float64(N-right))))
}