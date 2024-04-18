size = int(input())

for _ in range(size):
    number = int(input())
    reversed_number = 0

    while number != 0:
        last_digit = number % 10  # Получаем последнюю цифру
        reversed_number = reversed_number * 10 + last_digit  # Добавляем её к перевернутому числу
        number //= 10  # Удаляем последнюю цифру из исходного числа

    print(reversed_number, end=' ')