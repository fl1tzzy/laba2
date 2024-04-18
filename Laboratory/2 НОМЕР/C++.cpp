#include <iostream>
#include <string> 
#include <unordered_map> 
#include <unordered_set> 

using namespace std; 

// Функция для подсчета полных кольцев
int countFullPegs(const string& rings) {
    // Создаем ассоциативный массив, где ключ - это кольцо, а значение - это множество цветов, которые находятся на этом кольце
    unordered_map<char, unordered_set<char>> pegs;

    // Проходим по каждому символу в строке с шагом 2 (т.е. цвет и кольцо)
    for (size_t i = 0; i < rings.length(); i += 2) {
        char color = rings[i]; // цвет
        char peg = rings[i + 1]; // кольцо

        // Добавляем цвет в множество на соответствующем кольце
        pegs[peg].insert(color);
    }

    // счетчик полных колец
    int fullPegCount = 0;
    // Проходим по всем кольцам в ассоциативном массиве
    for (const auto& p : pegs) {
        // Если на кольце находятся все три цвета, увеличиваем счетчик полных колец
        if (p.second.size() == 3) {
            ++fullPegCount;
        }
    }

    // Возвращаем количество полных колец
    return fullPegCount;
}

int main() {
    string rings; // Объявляем строку для хранения конфигурации колец
    cout << "Enter the rings configuration: "; 
    cin >> rings; 
   
    cout << "Number of full pegs: " << countFullPegs(rings) << endl;

    return 0;
}