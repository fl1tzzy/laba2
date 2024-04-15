#include <iostream>
#include <cmath>

using namespace std;

int main() {
    int N;
    cin >> N;

    int left = 0, right;

    // Поиск ближайшего правого простого числа
    for(int i = N;;i++) {
        bool isPrime = true;
        // Поиск делителей
        for(int j = 2; j <= sqrt(i); j ++) {
            if(i % j == 0) {
                isPrime = false;
                break;
            }
        }
        if(isPrime) {
            right = i;
            break;
        }
    }
    // Является ли введённое число N простым числом
    if(right == N) {
        cout << 0 << endl;
        return 0;
    }

    // Поиск ближайшего левого простого числа
    for(int i = N;i > 0;i--) {
        bool isPrime = true;
        // Поиск делителей
        for(int j = 2; j <= sqrt(i); j ++) {
            if(i % j == 0) {
                isPrime = false;
                break;
            }
        }
        if(isPrime) {
            left = i;
            break;
        }
    }

    // Вывод наименьшей разности по модулю
    cout << min(abs(N - left), abs(N - right)) << endl;

    return 0;
}