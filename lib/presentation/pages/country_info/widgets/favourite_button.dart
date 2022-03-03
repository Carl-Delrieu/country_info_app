import 'package:country_info_app/data/local/dao/country_dao.dart';
import 'package:country_info_app/data/local/db_service.dart';
import 'package:country_info_app/domain/models/country.dart';
import 'package:country_info_app/domain/repositories/country_repository.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;

class FavouriteButton extends StatefulWidget {
  const FavouriteButton(this._country, {Key? key}) : super(key: key);

  final Country _country;

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  late CountryRepository _repository;
  var dao;
  var endpoint;

  @override
  void initState() {
    super.initState();
    _repository = CountryRepository(dao, endpoint);
  }

  @override
  void dispose() {
    super.dispose();;
  }


  @override
  Widget build(BuildContext context) {
    return _favButton(widget._country);
  }

  _favButton(Country _country) {
    return IconButton(
        onPressed: () {
          final entity = CountriesEntityCompanion(
              name: drift.Value(_country.name),
              abbreviation: drift.Value(_country.abbreviation),
              capital: drift.Value(_country.capital),
              currency: drift.Value(_country.currency),
              phone: drift.Value(_country.phone),
              population: drift.Value(_country.population!),
              flag: drift.Value(_country.flag),
              emblem: drift.Value(_country.emblem),
              orthographic: drift.Value(_country.orthographic),
              id: drift.Value(_country.id)
          );
          /*_repository.insert(entity).then((value) => ScaffoldMessenger.of(context)
              .showMaterialBanner(
              MaterialBanner(
                  content: Text('Country added $value'),
                  actions: [
                    TextButton(
                        onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                        child: const Text('Close'))
                  ])
          )
          );*/
        },
        icon: const Icon(Icons.star_outline));
  }
}