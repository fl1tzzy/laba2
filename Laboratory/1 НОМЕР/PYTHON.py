import math

# Чтение целого числа из стандартного ввода
N = int(input())

left = 0
right = 0

# Поиск ближайшего правого простого числа
i = N
while True:
    is_prime = True
    # Поиск делителей
    for j in range(2, math.isqrt(i) + 1):
        if i % j == 0:
            is_prime = False
            break
    if is_prime:
        right = i
        break
    i += 1

# Является ли введённое число N простым числом
if right == N:
    print(0)
else:
    # Поиск ближайшего левого простого числа
    i = N
    while i > 1:
        is_prime = True
        # Поиск делителей
        for j in range(2, math.isqrt(i) + 1):
            if i % j == 0:
                is_prime = False
                break
        if is_prime:
            left = i
            break
        i -= 1

    # Вывод наименьшей разности по модулю
    print(min(abs(N - left), abs(N - right)))