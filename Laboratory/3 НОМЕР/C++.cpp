#include <iostream>

using namespace std;

int main() {
    int size = 0;
    int number = 0;

    cin >> size;
    
    for (int i = 0; i < size; i++){
        cin >> number;

        int reversed = 0;
        int last_digit;

        while (number != 0) {
            last_digit = number % 10; // Получаем последнюю цифру
            reversed = reversed * 10 + last_digit; // Добавляем её к перевернутому числу
            number /= 10; // Удаляем последнюю цифру из исходного числа
        }
        cout << reversed << " ";
    }

}
