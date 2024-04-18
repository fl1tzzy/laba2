const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

let size = 0;
let numbers = [];

rl.question('', (answer) => {
    size = parseInt(answer);
    rl.setPrompt('Enter number: ');
    rl.prompt();
});

rl.on('line', (line) => {
    if (numbers.length < size) {
        numbers.push(parseInt(line));
        if (numbers.length === size) {
            numbers.forEach(number => {
                let reversed = 0;
                let lastDigit;
                let tempNumber = number;

                while (tempNumber !== 0) {
                    lastDigit = tempNumber % 10; // Получаем последнюю цифру
                    reversed = reversed * 10 + lastDigit; // Добавляем её к перевернутому числу
                    tempNumber = Math.floor(tempNumber / 10); // Удаляем последнюю цифру из исходного числа
                }
                process.stdout.write(reversed + ' ');
            });
            rl.close();
        } else {
            rl.prompt();
        }
    }
});