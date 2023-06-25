void main() {
  print('Program Start');

  httpGet('url').then((value) {
    print(value);
  }).catchError((err) {
    print('Error: $err');
  });

  print('Program End');
}

Future<String> httpGet(String url) {
  return Future.delayed(const Duration(seconds: 1), () {
    throw 'Error en la pet';
    //return 'Future response'; // Prints after 1 second.
  });
}
