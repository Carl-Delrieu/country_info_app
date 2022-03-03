
import 'package:country_info_app/domain/models/country.dart';
import 'package:flutter/material.dart';

class CountryInfo extends StatelessWidget {
  const CountryInfo(this._country, {Key? key}) : super(key: key);

  final Country _country;

  @override
  Widget build(BuildContext context) {
    return _countryInfo(_country);
  }

  _countryInfo(Country country) {
    return Scaffold(
      appBar: AppBar(title: const Text('Info')),
      body: Column(children: [
        Row(children: [
          Expanded(child:
          (Uri.parse(country.flag).isAbsolute)
              ? Row(children: [
            Image.network(country.flag.toString(), width: 150.0),
            Column(children: [
              Text(country.name),
              Text(country.capital)]),
            IconButton(icon: const Icon(Icons.star_border),
                onPressed: () {
                  //FavouriteButton(country);
                })])

              : Row(children: [
            const Icon(Icons.error_outline, size: 95.0),
            Column(children: [
              Text(country.name),
              Text(country.capital)]),
            IconButton(icon: const Icon(Icons.star_border),
                onPressed: () {
                  //FavouriteButton(country);
                })])
          )
        ]),
        const SizedBox(height: 50.0),
        Align(
            alignment: Alignment.bottomLeft,
            child: Column(children: [
              Text('Abbreviation : ${country.abbreviation}'),
              Text('Currency : ${country.currency}'),
              Text('Phone indicator : ${country.phone}'),
              Text('Population : ${country.population}'),
            ],)
        ),
      ],
      ),
    );
  }
}
