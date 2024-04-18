// Функция для подсчета полных кольцев
function countFullPegs(rings) {
    // Создаем ассоциативный массив, где ключ - это кольцо, а значение - это множество цветов, которые находятся на этом кольце
    let pegs = new Map();

    // Проходим по каждому символу в строке с шагом 2 (т.е. цвет и кольцо)
    for (let i = 0; i < rings.length; i += 2) {
        let color = rings[i]; // цвет
        let peg = rings[i + 1]; // кольцо

        // Добавляем цвет в множество на соответствующем кольце
        if (!pegs.has(peg)) {
            pegs.set(peg, new Set());
        }
        pegs.get(peg).add(color);
    }

    // счетчик полных колец
    let fullPegCount = 0;
    // Проходим по всем кольцам в ассоциативном массиве
    for (let colors of pegs.values()) {
        // Если на кольце находятся все три цвета, увеличиваем счетчик полных колец
        if (colors.size === 3) {
            fullPegCount++;
        }
    }

    // Возвращаем количество полных колец
    return fullPegCount;
}

function main() {
    let rings = prompt("Enter the rings configuration: ");
    console.log("Number of full pegs: " + countFullPegs(rings));
}

main();