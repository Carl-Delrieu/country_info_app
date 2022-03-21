class CountryDTO {
  final String name;
  final String abbreviation;
  final String capital;
  final String currency;
  final String phone;
  final int? population;
  final String flag;
  final String emblem;
  final String orthographic;
  final int id;

  CountryDTO(
      {required this.name,
      required this.abbreviation,
      required this.capital,
      required this.currency,
      required this.phone,
      this.population,
      required this.flag,
      required this.emblem,
      required this.orthographic,
      required this.id});

  factory CountryDTO.fromJson(Map<String, dynamic> json) => CountryDTO(
      name: json['name'],
      abbreviation: json['abbreviation'],
      capital: json['capital'],
      currency: json['currency'],
      phone: json['phone'],
      population: json.containsKey('population') ? json['population'] : null,
      flag: json['media'].containsKey('flag') ? json['media']['flag'] : "",
      emblem:
          json['media'].containsKey('emblem') ? json['media']['emblem'] : "",
      orthographic: json['media'].containsKey('orthographic')
          ? json['media']['orthographic']
          : "",
      id: json['id']);

  Map<String, dynamic> toJson() => {
        "name": name,
        "abbreviation": abbreviation,
        "capital": capital,
        "currency": currency,
        "phone": phone,
        "population": population,
        "flag": flag,
        "emblem": emblem,
        "orthographic": orthographic,
        "id": id
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountryDTO &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          abbreviation == other.abbreviation &&
          capital == other.capital &&
          currency == other.currency &&
          phone == other.phone &&
          population == other.population &&
          flag == other.flag &&
          emblem == other.emblem &&
          orthographic == other.orthographic &&
          id == other.id);

  @override
  int get hashCode => Object.hash(id, name, abbreviation, capital, currency,
  phone, population, flag, emblem, orthographic);
}
