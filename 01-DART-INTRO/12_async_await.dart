void main() async {
  print('Program Start');

  try {
    final value = await httpGet('oubweofubwef');
    print(value);
  } catch (err) {
    print('Tenemos un error: $err');
  }

  print('Program End');
}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 1));
  throw 'Error en la pet';
  //return 'Tenemos un value';
}
