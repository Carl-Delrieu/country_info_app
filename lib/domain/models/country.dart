class Country {
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

  Country(this.name, this.abbreviation, this.capital, this.currency, this.phone,
      this.population, this.flag, this.emblem, this.orthographic, this.id);

  @override
  String toString() {
    return 'CountryEntity {id: $id, name: $name, abbreviation: $abbreviation, capital: $capital, population: $population}';
  }
}
