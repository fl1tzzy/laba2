using System;

class Program
{
    static void Main()
    {
        int N = int.Parse(Console.ReadLine());

        int left = 0, right = 0;

        // Поиск ближайшего правого простого числа
        for (int i = N; ; i++)
        {
            bool isPrime = true;
            // Поиск делителей
            for (int j = 2; j <= Math.Sqrt(i); j++)
            {
                if (i % j == 0)
                {
                    isPrime = false;
                    break;
                }
            }
            if (isPrime)
            {
                right = i;
                break;
            }
        }
        // Является ли введённое число N простым числом
        if (right == N)
        {
            Console.WriteLine(0);
            return;
        }

        // Поиск ближайшего левого простого числа
        for (int i = N; i > 0; i--)
        {
            bool isPrime = true;
            // Поиск делителей
            for (int j = 2; j <= Math.Sqrt(i); j++)
            {
                if (i % j == 0)
                {
                    isPrime = false;
                    break;
                }
            }
            if (isPrime)
            {
                left = i;
                break;
            }
        }

        // Вывод наименьшей разности по модулю
        Console.WriteLine(Math.Min(Math.Abs(N - left), Math.Abs(N - right)));
    }
}