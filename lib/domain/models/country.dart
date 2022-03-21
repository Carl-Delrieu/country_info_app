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
  bool isFavourite;

  Country(
      this.name,
      this.abbreviation,
      this.capital,
      this.currency,
      this.phone,
      this.population,
      this.flag,
      this.emblem,
      this.orthographic,
      this.id,
      this.isFavourite);

  Country copyWith(
      {String? name,
      String? abbreviation,
      String? capital,
      String? currency,
      String? phone,
      int? population,
      String? flag,
      String? emblem,
      String? orthographic,
      int? id,
      bool? isFavourite}) {
    return Country(
        name ?? this.name,
        abbreviation ?? this.abbreviation,
        capital ?? this.capital,
        currency ?? this.currency,
        phone ?? this.phone,
        population ?? this.population,
        flag ?? this.flag,
        emblem ?? this.emblem,
        orthographic ?? this.orthographic,
        id ?? this.id,
        isFavourite ?? this.isFavourite);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Country &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          abbreviation == other.abbreviation &&
          capital == other.capital &&
          currency == other.currency &&
          phone == other.phone &&
          population == other.population &&
          flag == other.flag &&
          emblem == other.emblem &&
          orthographic == other.orthographic &&
          isFavourite == other.isFavourite);

  @override
  int get hashCode => Object.hash(id, name, abbreviation, capital, currency,
      phone, population, flag, emblem, orthographic, isFavourite);

  @override
  String toString() {
    return 'CountryEntity {id: $id, name: $name, abbreviation: $abbreviation, capital: $capital, population: $population, favourite: $isFavourite}';
  }
}
