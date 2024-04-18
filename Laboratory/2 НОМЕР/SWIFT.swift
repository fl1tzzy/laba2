import Foundation

// Функция для подсчета полных кольцев
func countFullPegs(rings: String) -> Int {
    // Создаем словарь, где ключ - это кольцо, а значение - это множество цветов, которые находятся на этом кольце
    var pegs: [Character: Set<Character>] = [:]

    // Проходим по каждому символу в строке с шагом 2 (т.е. цвет и кольцо)
    for i in stride(from: 0, to: rings.count, by: 2) {
        let color = rings[rings.index(rings.startIndex, offsetBy: i)] // цвет
        let peg = rings[rings.index(rings.startIndex, offsetBy: i + 1)] // кольцо

        // Добавляем цвет в множество на соответствующем кольце
        if let colors = pegs[peg] {
            var updatedColors = colors
            updatedColors.insert(color)
            pegs[peg] = updatedColors
        } else {
            pegs[peg] = [color]
        }
    }

    // счетчик полных колец
    var fullPegCount = 0
    // Проходим по всем кольцам в словаре
    for (_, colors) in pegs {
        // Если на кольце находятся все три цвета, увеличиваем счетчик полных колец
        if colors.count == 3 {
            fullPegCount += 1
        }
    }

    // Возвращаем количество полных колец
    return fullPegCount
}

func main() {
    print("Enter the rings configuration: ")
    if let rings = readLine() {
        print("Number of full pegs: \(countFullPegs(rings: rings))")
    }
}

main()