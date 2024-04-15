use std::io; // Импорт модуля ввода-вывода

// Функция для проверки, является ли число простым
fn is_prime(n: i32) -> bool {
    if n <= 1 {
        return false; // Числа меньше или равные 1 не являются простыми
    }
    if n <= 3 {
        return true; // Числа 2 и 3 являются простыми
    }
    if n % 2 == 0 || n % 3 == 0 {
        return false; // Если число делится на 2 или 3, то оно не является простым
    }
    let mut i = 5;
    while i * i <= n {
        if n % i == 0 || n % (i + 2) == 0 {
            return false; // Если число делится на i или i + 2, то оно не является простым
        }
        i += 6; // Переходим к следующему возможному делителю
    }
    true // Если мы дошли до этой точки, число является простым
}

// Функция для поиска ближайшего простого числа начиная с заданного числа и шагом
fn find_prime(n: i32, step: i32) -> i32 {
    let mut i = n;
    loop {
        if is_prime(i) {
            return i; // Если число простое, возвращаем его
        }
        i += step; // Увеличиваем число на шаг и продолжаем поиск
    }
}

fn main() {
    // Чтение целого числа из стандартного ввода
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let n: i32 = input.trim().parse().unwrap();

    // Поиск ближайшего правого простого числа
    let right = find_prime(n, 1);

    // Если введенное число n является простым, выводим "0"
    if right == n {
        println!("0");
        return;
    }

    // Иначе, ищем ближайшее левое простое число
    let left = find_prime(n, -1);

    // Выводим минимальную разницу по модулю между n и найденными простыми числами
    println!("{}", std::cmp::min((n - left).abs(), (n - right).abs()));
}