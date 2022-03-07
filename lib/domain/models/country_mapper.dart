import 'package:country_info_app/data/local/db_service.dart';
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
        entity.id,
        false);
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
        dto.name,
        dto.abbreviation,
        dto.capital,
        dto.currency,
        dto.phone,
        dto.population,
        dto.flag,
        dto.emblem,
        dto.orthographic,
        dto.id,
        false);
  }

  static CountryDTO toDTO(Country country) {
    return CountryDTO(
        name: country.name,
        abbreviation: country.abbreviation,
        capital: country.capital,
        currency: country.currency,
        phone: country.phone,
        population: country.population,
        flag: country.flag,
        emblem: country.emblem,
        orthographic: country.orthographic,
        id: country.id);
  }
}
