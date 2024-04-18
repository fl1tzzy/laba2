use std::io;

fn main() {
    let mut size_str = String::new();
    io::stdin().read_line(&mut size_str).unwrap();
    let size = size_str.trim().parse::<i32>().unwrap();

    for _ in 0..size {
        let mut number_str = String::new();
        io::stdin().read_line(&mut number_str).unwrap();
        let mut number = number_str.trim().parse::<i32>().unwrap();

        let mut reversed = 0;
        while number != 0 {
            let last_digit = number % 10; // Получаем последнюю цифру
            reversed = reversed * 10 + last_digit; // Добавляем её к перевернутому числу
            number /= 10; // Удаляем последнюю цифру из исходного числа
        }
        println!("{} ", reversed);
    }
}