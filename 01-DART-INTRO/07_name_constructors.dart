void main() {
  final Map<String, dynamic> rawJson = {
    'name': 'Tony',
    'power': 'Money',
    'isAlive': true
  };

  final Hero ironman = Hero.fromJson(rawJson);

  print(ironman);
}

class Hero {
  String name;
  String power;
  bool isAlive;

  Hero({required this.name, required this.power, required this.isAlive});

  Hero.fromJson(Map<String, dynamic> json)
      //siempre en un json hacer la validacion del null
      : name = json['name'] ?? 'No name found',
        power = json['power'] ?? 'No power found',
        isAlive = json['isAlive'] ?? 'No data found';

  @override
  String toString() {
    return '$name, $power, Is alive:${isAlive ? 'YES!' : 'nope'}';
  }
}
