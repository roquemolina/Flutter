void main() {
  //     constructor       vvvvv
  //final wolverine = new Hero();
  // new opcional
  final Hero wolverine = Hero(name:'Logan', power:'Regeneracion');

  print(wolverine);
  print(wolverine.name);
  print(wolverine.power);
}

class Hero {
  String name;
  String power;

  //constructor
  //Hero(String pName, String pPower)
  // vvvvv al momento de crear la instancia, acá hago la
  // vvvvv asignacion con los dos puntos
  //  : name = pName,
  //    power = pPower;
  // vvvvv tmb lo puedo hacer así
  //y le puedo poner required si quiero
  Hero({required this.name,
        this.power = 'Sin poder'
        });
  //an JS sería así vvvvvvv PERO NO FUNCIONA
  /*{
    name = pName;
    power = pPower;
  }*/
  
  
  //sobreescribo el comportamiento nativo de toString()
  @override
  String toString() {
    return '$name - $power';
  }
}