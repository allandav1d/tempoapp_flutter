class Climate {
  final double temperature;
  final double temperatureMax;
  final double temperatureMin;
  final String description;
  final String icon;
  final int humidity;

  Climate({
    this.temperature = 0,
    this.temperatureMax = 0,
    this.temperatureMin = 0,
    this.description = '',
    this.icon = '',
    this.humidity = 0,
  });

  factory Climate.fromJson(Map<String, dynamic> json){
    String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

    return Climate(
      temperature: json['main']['temp'],
      temperatureMax: json['main']['temp_max'],
      temperatureMin: json['main']['temp_min'],
      description: capitalize(json['weather'][0]['description']),
      icon: json['weather'][0]['icon'],
      humidity: json['main']['humidity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'temperatureMax': temperatureMax,
      'temperatureMin': temperatureMin,
      'description': description,
      'icon': icon,
      'humidity': humidity,
    };
  }
}