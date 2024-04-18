def count_full_pegs(rings):
    # Создаем словарь, где ключ - это кольцо, а значение - это множество цветов, которые находятся на этом кольце
    pegs = {}

    # Проходим по каждому символу в строке с шагом 2 (т.е. цвет и кольцо)
    for i in range(0, len(rings), 2):
        color = rings[i]  # цвет
        peg = rings[i + 1]  # кольцо

        # Добавляем цвет в множество на соответствующем кольце
        if peg not in pegs:
            pegs[peg] = set()
        pegs[peg].add(color)

    # счетчик полных колец
    full_peg_count = 0
    # Проходим по всем кольцам в словаре
    for colors in pegs.values():
        # Если на кольце находятся все три цвета, увеличиваем счетчик полных колец
        if len(colors) == 3:
            full_peg_count += 1

    # Возвращаем количество полных колец
    return full_peg_count


def main():
    rings = input("Enter the rings configuration: ")
    print("Number of full pegs:", count_full_pegs(rings))


if __name__ == "__main__":
    main()