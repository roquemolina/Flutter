void main() {
  print(greetEveryone());
  print(greetEveryoneArrow());
  print('Suma: ${addTwoNumbers(2, 20)}');
  print('Suma: ${addTwoNumbersArrow(2, 20)}');
  print('Suma: ${addTwoNumbersOp(2)}');
  print('Suma: ${addTwoNumbersArrow(2, 20)}');
  print('Saludo: ${greetPerson(name: 'Roque')}');
}

String greetEveryone() {
  return 'Hello everyone!';
}

String greetEveryoneArrow() => 'Hello everyone!';

int addTwoNumbers(int a, int b) {
  return a + b;
}

int addTwoNumbersArrow(int a, int b) => a + b;

int addTwoNumbersOp(int a, [int b = 0]) {
  //con el [int? b] arriba ^^^^^^ sino como está
  //vvvvvvvsi el valor de b no está b es igual a 0
  //b = b ?? 0;
  //b ??=0;
  //yo lo uso como arriba [int b = 0] si int b no esta, vale 0

  return a + b;
}

String greetPerson({required String name, String message = 'Hola,'}) {
  return '$message $name';
}
