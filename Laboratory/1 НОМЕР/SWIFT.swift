import Foundation

func isPrime(_ n: Int) -> Bool {
    if n <= 1 {
        return false
    }
    if n <= 3 {
        return true
    }
    if n % 2 == 0 || n % 3 == 0 {
        return false
    }
    var i = 5
    while i * i <= n {
        if n % i == 0 || n % (i + 2) == 0 {
            return false
        }
        i += 6
    }
    return true
}

func main() {
    let N = Int(readLine()!)!

    var left = 0, right = 0

    // Поиск ближайшего правого простого числа
    var i = N
    while true {
        if isPrime(i) {
            right = i
            break
        }
        i += 1
    }
    // Является ли введённое число N простым числом
    if right == N {
        print(0)
        return
    }

    // Поиск ближайшего левого простого числа
    i = N
    while i > 0 {
        if isPrime(i) {
            left = i
            break
        }
        i -= 1
    }

    // Вывод наименьшей разности по модулю
    print(min(abs(N - left), abs(N - right)))
}

main()