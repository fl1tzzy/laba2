package main

import (
	"fmt"
)

// Функция для подсчета полных кольцев
func countFullPegs(rings string) int {
	// Создаем ассоциативный массив, где ключ - это кольцо, а значение - это множество цветов, которые находятся на этом кольце
	pegs := make(map[rune]map[rune]bool)

	// Проходим по каждому символу в строке с шагом 2 (т.е. цвет и кольцо)
	for i := 0; i < len(rings); i += 2 {
		color := rune(rings[i])   // цвет
		peg := rune(rings[i+1]) // кольцо

		// Добавляем цвет в множество на соответствующем кольце
		if _, exists := pegs[peg]; !exists {
			pegs[peg] = make(map[rune]bool)
		}
		pegs[peg][color] = true
	}

	// счетчик полных колец
	fullPegCount := 0
	// Проходим по всем кольцам в ассоциативном массиве
	for _, colors := range pegs {
		// Если на кольце находятся все три цвета, увеличиваем счетчик полных колец
		if len(colors) == 3 {
			fullPegCount++
		}
	}

	// Возвращаем количество полных колец
	return fullPegCount
}

func main() {
	var rings string
	fmt.Print("Enter the rings configuration: ")
	fmt.Scanln(&rings)

	fmt.Println("Number of full pegs:", countFullPegs(rings))
}