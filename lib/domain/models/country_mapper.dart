import 'package:country_info_app/data/local/models/country_entity.dart';
import 'package:country_info_app/data/remote/models/country_dto.dart';
import 'package:country_info_app/domain/models/country.dart';

class CountryMapper {
  static Country fromEntity(CountryEntity entity) {
    return Country(
        entity.name,
        entity.abbreviation,
        entity.capital,
        entity.currency,
        entity.phone,
        entity.population,
        entity.flag,
        entity.emblem,
        entity.orthographic,
        entity.id);
  }

  static CountryEntity toEntity(Country country) {
    return CountryEntity(
        id: country.id,
        name: country.name,
        abbreviation: country.abbreviation,
        capital: country.capital,
        currency: country.currency,
        phone: country.phone,
        population: country.population,
        flag: country.flag,
        emblem: country.emblem,
        orthographic: country.orthographic);
  }

  static Country fromDTO(CountryDTO dto) {
    return Country(
        dto.countryModel.name,
        dto.countryModel.abbreviation,
        dto.countryModel.capital,
        dto.countryModel.currency,
        dto.countryModel.phone,
        dto.countryModel.population,
        dto.countryModel.flag,
        dto.countryModel.emblem,
        dto.countryModel.orthographic,
        dto.countryModel.id);
  }

  static CountryDTO toDTO(Country country) {
    return CountryDTO(
        countryModel: CountryModel(
            name: country.name,
            abbreviation: country.abbreviation,
            capital: country.capital,
            currency: country.currency,
            phone: country.phone,
            population: country.population,
            flag: country.flag,
            emblem: country.emblem,
            orthographic: country.orthographic,
            id: country.id));
  }
}
