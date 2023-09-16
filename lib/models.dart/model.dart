class InputData {
  int period;
  int Car;
  int Bus;
  int Subway;
  int Airplane;
  int Intercity;
  int Electricity;
  int Natural;
  int Water;
  int Dairy;
  int Meat;
  int Fruit;
  int Wine;
  int Others;
  int Clothing;
  int Restaurant;
  int Hotel;

  InputData({
    this.period = 0,
    this.Car = 0,
    this.Bus = 0,
    this.Subway = 0,
    this.Airplane = 0,
    this.Intercity = 0,
    this.Electricity = 0,
    this.Natural = 0,
    this.Water = 0,
    this.Dairy = 0,
    this.Meat = 0,
    this.Fruit = 0,
    this.Wine = 0,
    this.Others = 0,
    this.Clothing = 0,
    this.Restaurant = 0,
    this.Hotel = 0, 
  });

  // Create a factory method to deserialize from JSON
  factory InputData.fromJson(Map<String, dynamic> json) {
    return InputData(
      period: json['period'] as int ?? 0,
      Car: json['Car'] as int ?? 0,
      Bus: json['Bus'] as int ?? 0,
      Subway: json['Subway'] as int ?? 0,
      Airplane: json['Airplane'] as int ?? 0,
      Intercity: json['Intercity'] as int ?? 0,
      Electricity: json['Electricity'] as int ?? 0,
      Natural: json['Natural'] as int ?? 0,
      Water: json['Water'] as int ?? 0,
      Dairy: json['Dairy'] as int ?? 0,
      Meat: json['Meat'] as int ?? 0,
      Fruit: json['Fruit'] as int ?? 0,
      Wine: json['Wine'] as int ?? 0,
      Others: json['Others'] as int ?? 0,
      Clothing: json['Clothing'] as int ?? 0,
      Restaurant: json['Restaurant'] as int ?? 0,
      Hotel: json['Hotel'] as int ?? 0,
      // Add more fields here
    );
  }

  // Create a method to serialize to JSON
  Map<String, dynamic> toJson() {
    return {
      'period': period,
      'Car': Car,
      'Bus': Bus,
      'Subway': Subway,
      'Airplane': Airplane,
      'Intercity': Intercity,
      'Electricity': Electricity,
      'Natural': Natural,
      'Water': Water,
      'Dairy': Dairy,
      'Meat': Meat,
      'Fruit': Fruit,
      'Wine': Wine,
      'Others': Others,
      'Clothing': Clothing,
      'Restaurant': Restaurant,
      'Hotel': Hotel,
      // Add more fields here
    };
  }
}
