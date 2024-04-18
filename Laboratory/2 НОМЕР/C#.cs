using System;
using System.Collections.Generic;

class Program
{
    static void Main(string[] args)
    {
        Console.Write("Enter the rings configuration: ");
        string rings = Console.ReadLine();
        Console.WriteLine("Number of full pegs: " + CountFullPegs(rings));
    }

    static int CountFullPegs(string rings)
    {
        // Создаем словарь, где ключ - это кольцо, а значение - это множество цветов, которые находятся на этом кольце
        Dictionary<char, HashSet<char>> pegs = new Dictionary<char, HashSet<char>>();

        // Проходим по каждому символу в строке с шагом 2 (т.е. цвет и кольцо)
        for (int i = 0; i < rings.Length; i += 2)
        {
            char color = rings[i]; // цвет
            char peg = rings[i + 1]; // кольцо

            // Добавляем цвет в множество на соответствующем кольце
            if (!pegs.ContainsKey(peg))
            {
                pegs[peg] = new HashSet<char>();
            }
            pegs[peg].Add(color);
        }

        // счетчик полных колец
        int fullPegCount = 0;
        // Проходим по всем кольцам в словаре
        foreach (var p in pegs)
        {
            // Если на кольце находятся все три цвета, увеличиваем счетчик полных колец
            if (p.Value.Count == 3)
            {
                fullPegCount++;
            }
        }

        // Возвращаем количество полных колец
        return fullPegCount;
    }
}