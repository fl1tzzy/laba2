import java.util.*

fun main() {
    val scanner = Scanner(System.`in`)
    val size = scanner.nextInt()

    for (i in 0 until size) {
        var number = scanner.nextInt()
        var reversed = 0
        var lastDigit: Int

        while (number != 0) {
            lastDigit = number % 10 // Получаем последнюю цифру
            reversed = reversed * 10 + lastDigit // Добавляем её к перевернутому числу
            number /= 10 // Удаляем последнюю цифру из исходного числа
        }
        print("$reversed ")
    }
    scanner.close()
}