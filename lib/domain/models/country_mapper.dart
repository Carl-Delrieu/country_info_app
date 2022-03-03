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

  static List<Country>? fromEntityList(List<CountryEntity> entityList) {
    List<Country>? countries;
    for (var entity in entityList) {
      countries?.add(fromEntity(entity));
    }
    return countries;
  }

  static List<CountryEntity>? toEntityList(List<Country> countryList) {
    List<CountryEntity>? entityList;
    for (var country in countryList) {
      entityList?.add(toEntity(country));
    }
    return entityList;
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

  static List<Country>? fromDTOList(List<CountryDTO> dtoList) {
    List<Country>? countries;
    for (var dto in dtoList) {
      countries?.add(fromDTO(dto));
    }
    return countries;
  }

  static List<CountryDTO>? toDTOList(List<Country> countriesList) {
    List<CountryDTO>? dtoList;
    for (var country in countriesList) {
      dtoList?.add(toDTO(country));
    }
    return dtoList;
  }
}
