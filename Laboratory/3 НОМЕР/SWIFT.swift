import Foundation

let size = Int(readLine()!)!

for _ in 0..<size {
    let number = Int(readLine()!)!
    var reversed = 0
    var lastDigit: Int
    var tempNumber = number

    while tempNumber != 0 {
        lastDigit = tempNumber % 10 // Получаем последнюю цифру
        reversed = reversed * 10 + lastDigit // Добавляем её к перевернутому числу
        tempNumber /= 10 // Удаляем последнюю цифру из исходного числа
    }
    print("\(reversed)", terminator: " ")
}