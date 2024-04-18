using System;

class Program
{
    static void Main()
    {
        int size = int.Parse(Console.ReadLine());

        for (int i = 0; i < size; i++)
        {
            int number = int.Parse(Console.ReadLine());
            int reversed = 0;
            int last_digit;

            while (number != 0)
            {
                last_digit = number % 10; // Получаем последнюю цифру
                reversed = reversed * 10 + last_digit; // Добавляем её к перевернутому числу
                number /= 10; // Удаляем последнюю цифру из исходного числа
            }
            Console.Write(reversed + " ");
        }
    }
}