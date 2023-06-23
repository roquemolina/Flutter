void main() {
  final String pokemon = 'Ditto';
  final int hp = 100;
  final isAlive = true;
  final List<String> abilities = ['impostor'];
  final sprites = <String>['ditto/front.png', 'ditto/back.png'];

// dynamic == null   dynamic por defecto es nulo PUEDE VENIR NULO
// SABER DONDE USAR!
  dynamic errorMessage = 'Hola';
  errorMessage = true;
  errorMessage = [1, 2, 3, 4, 5, 6, 6];
  errorMessage = {1, 2, 3, 4, 5, 6};
  errorMessage = () => true;
  errorMessage = null;

  print("""
$pokemon
$hp
$isAlive
$abilities
$sprites
$errorMessage

""");
}
