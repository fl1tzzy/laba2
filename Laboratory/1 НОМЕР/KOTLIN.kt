import kotlin.math.sqrt

fun isPrime(n: Int): Boolean {
    if (n <= 1) return false
    if (n <= 3) return true
    if (n % 2 == 0 || n % 3 == 0) return false
    var i = 5
    while (i * i <= n) {
        if (n % i == 0 || n % (i + 2) == 0) return false
        i += 6
    }
    return true
}

fun findPrime(n: Int, step: Int): Int {
    var i = n
    while (true) {
        if (isPrime(i)) return i
        i += step
    }
}

fun main() {
    val N = readLine()!!.toInt() // Чтение целого числа из стандартного ввода

    val right = findPrime(N, 1) // Поиск ближайшего правого простого числа

    if (right == N) {
        println(0) // Если введенное число N является простым, выводим "0"
        return
    }

    val left = findPrime(N, -1) // Иначе, ищем ближайшее левое простое число

    // Вывод наименьшей разности по модулю между N и найденными простыми числами
    println(kotlin.math.min(kotlin.math.abs(N - left), kotlin.math.abs(N - right)))
}