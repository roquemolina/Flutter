void main() async {
  print('Program Start');

  try {
    final value = await httpGet('edwefewfwef');
    print('Exito: $value');
  } on Exception catch (err) {
    print('Tenemos una exception: $err');
  } catch (err) {
    print('Tenemos un error: $err');
  } finally {
    print('Finally');
  }

  print('Program End');
}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 1));
  //throw 'Error en la pet';
  throw Exception('No url parameter');
  //return 'Tenemos un value';
}
