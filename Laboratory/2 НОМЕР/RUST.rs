use std::collections::HashMap;
use std::collections::HashSet;
use std::io::{self, Write};

fn count_full_pegs(rings: &str) -> i32 {
    // Создаем ассоциативный массив, где ключ - это кольцо, а значение - это множество цветов, которые находятся на этом кольце
    let mut pegs: HashMap<char, HashSet<char>> = HashMap::new();

    // Проходим по каждому символу в строке с шагом 2 (т.е. цвет и кольцо)
    for i in (0..rings.len()).step_by(2) {
        let color = rings.chars().nth(i).unwrap(); // цвет
        let peg = rings.chars().nth(i + 1).unwrap(); // кольцо

        // Добавляем цвет в множество на соответствующем кольце
        pegs.entry(peg).or_insert_with(HashSet::new).insert(color);
    }

    // счетчик полных колец
    let mut full_peg_count = 0;
    // Проходим по всем кольцам в ассоциативном массиве
    for colors in pegs.values() {
        // Если на кольце находятся все три цвета, увеличиваем счетчик полных колец
        if colors.len() == 3 {
            full_peg_count += 1;
        }
    }

    // Возвращаем количество полных колец
    full_peg_count
}

fn main() {
    println!("Enter the rings configuration: ");
    let mut rings = String::new();
    io::stdin().read_line(&mut rings).unwrap();
    let rings = rings.trim().to_string();

    println!("Number of full pegs: {}", count_full_pegs(&rings));
}