import 'dart:math';

abstract class Methods {
  static bool checkPrime(int num) {
    if (num <= 1) return false;
    for (int i = 2; i * i <= num; i++) {
      if (num % i == 0) return false;
    }
    return true;
  }

  static bool checkFibonacci(int num) {
    int a = 0, b = 1;
    while (b < num) {
      int next = a + b;
      a = b;
      b = next;
    }
    return num == b || num == 0;
  }
}
