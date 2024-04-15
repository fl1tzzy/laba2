import java.util.Scanner;

public class Main {

public static void main(String[] args) {

Scanner in = new Scanner(System.in);

int N = in.nextInt();

int left = 0, right;

// Поиск ближайшего правого простого числа
loop1:
for(int i = N;;i++) {

  // Поиск делителей
  for(int j = 2; j <= Math.sqrt(i); j ++) {
    if(i % j == 0) {
      continue loop1; // Если чисто имеет 3 делитель - начать новую итерацию
    }
  }
  right = i;
  break;
}
// Является ли введённое число N простым числом
if(right == N) {
  System.out.println(0);
  return;
}

// Поиск ближайшего левого простого числа
loop2:
for(int i = N;i > 0;i--) {

  // Поиск делителей
  for(int j = 2; j <= Math.sqrt(i); j ++) {
    if(i % j == 0) {
      continue loop2; // Если чисто имеет 3 делитель - начать новую итерацию
    }
  }
  left = i;
  break;
}

// Вывод наименьшей разности по модулю
System.out.println(Math.min(Math.abs(N - left), Math.abs(N - right)));
}
}