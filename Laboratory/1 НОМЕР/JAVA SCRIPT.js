const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('', (N) => {
    N = parseInt(N);

    let left = 0, right;

    // Поиск ближайшего правого простого числа
    for(let i = N;;i++) {
        let isPrime = true;
        // Поиск делителей
        for(let j = 2; j <= Math.sqrt(i); j ++) {
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
        console.log(0);
        rl.close();
        return;
    }

    // Поиск ближайшего левого простого числа
    for(let i = N;i > 0;i--) {
        let isPrime = true;
        // Поиск делителей
        for(let j = 2; j <= Math.sqrt(i); j ++) {
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
    console.log(Math.min(Math.abs(N - left), Math.abs(N - right)));

    rl.close();
});