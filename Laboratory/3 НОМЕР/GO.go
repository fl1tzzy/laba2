package main

import (
	"fmt"
	"bufio"
	"os"
	"strconv"
	"strings"
)

func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Scan()
	size, _ := strconv.Atoi(scanner.Text())

	for i := 0; i < size; i++ {
		scanner.Scan()
		number, _ := strconv.Atoi(strings.TrimSpace(scanner.Text()))
		reversed := 0

		for number != 0 {
			lastDigit := number % 10 // Получаем последнюю цифру
			reversed = reversed*10 + lastDigit // Добавляем её к перевернутому числу
			number /= 10 // Удаляем последнюю цифру из исходного числа
		}
		fmt.Print(reversed, " ")
	}
}