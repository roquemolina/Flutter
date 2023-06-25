void main() {
  final numbers = [1, 2, 3, 4, 4, 5, 6, 7, 7, 8];

  print('Lista original: $numbers');
  print('Length: ${numbers.length}');
  print('Lista index 0: ${numbers[0]}');
  print('First: ${numbers.first}');
  print('Last: ${numbers.last}');
  print('Reverse: ${numbers.reversed}');

  final reversedNumbers = numbers.reversed;

  print('Iterable: $reversedNumbers');
  //recuperar de la lista reversed del iterable
  //sirve para limpiar el listado
  print('List: ${reversedNumbers.toList()}');
  //set es una lista con valores unicos, me elimina los duplicados

  print('Set: ${reversedNumbers.toSet()}');

  final numbersGreaterThan5 = numbers.where((int num) {
    return num > 5; //true or false
  });

  print('>5: $numbersGreaterThan5');
  print('>5: ${numbersGreaterThan5.toSet()}');
}
