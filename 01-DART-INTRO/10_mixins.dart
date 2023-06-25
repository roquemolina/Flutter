void main() {
  final flipper = Delfin();
  flipper.nadar();

  final batman = Murcielago();
  batman.volar();
  batman.caminar();

  final lucas = Pato();
  lucas.volar();
  lucas.caminar();
  lucas.nadar();
}

abstract class Animal {}

abstract class Mamifero extends Animal {}

abstract class Ave extends Animal {}

abstract class Pez extends Animal {}

mixin Volador {
  void volar() => print('Volando!');
}
mixin Caminante {
  void caminar() => print('Caminando!');
}
mixin Nadador {
  void nadar() => print('Nadando!');
}

class Delfin extends Mamifero with Nadador {}

class Murcielago extends Mamifero with Caminante, Volador {}

class Gato extends Mamifero with Caminante {}

class Paloma extends Ave with Caminante, Volador {}

class Pato extends Ave with Nadador, Caminante, Volador {}

class Tiburon extends Pez with Nadador {}

class PezVolador extends Pez with Nadador, Volador {}
