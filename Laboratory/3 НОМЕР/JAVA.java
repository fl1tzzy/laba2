import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int size = scanner.nextInt();

        for (int i = 0; i < size; i++) {
            int number = scanner.nextInt();
            int reversed = 0;
            int last_digit;

            while (number != 0) {
                last_digit = number % 10; // Получаем последнюю цифру
                reversed = reversed * 10 + last_digit; // Добавляем её к перевернутому числу
                number /= 10; // Удаляем последнюю цифру из исходного числа
            }
            System.out.print(reversed + " ");
        }
        scanner.close();
    }
}