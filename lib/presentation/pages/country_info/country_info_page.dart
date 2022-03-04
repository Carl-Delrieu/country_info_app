import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_info_app/domain/models/country.dart';
import 'package:country_info_app/presentation/pages/base_page.dart';
import 'package:country_info_app/presentation/pages/country_info/country_info_scoped_model.dart';
import 'package:country_info_app/presentation/pages/country_info/widgets/favourite_button.dart';
import 'package:country_info_app/presentation/pages/view_state.dart';
import 'package:flutter/material.dart';

class CountryInfoPage extends StatefulWidget {
  const CountryInfoPage(this.country, {Key? key}) : super(key: key);

  final Country country;

  @override
  _CountryInfoPageState createState() => _CountryInfoPageState();
}

class _CountryInfoPageState extends State<CountryInfoPage> {
  @override
  Widget build(BuildContext context) {
    return _countryInfo(widget.country);
  }

  _countryInfo(Country country) {
    return BasePage<CountryInfoScopedModel>(
      initialState: ViewState.ready,
      builder: (context, child, scopedModel) => Scaffold(
        appBar: AppBar(title: const Text('Info')),
        body: Container(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: Column(
            children: [
              Row(children: [
                Expanded(
                    child: (Uri.parse(country.flag).isAbsolute)
                        ? Row(children: [
                            Image.network(country.flag,
                                width: 150.0,
                                errorBuilder: (c, e, s) => const Icon(
                                    Icons.error_outline,
                                    size: 95.0)),
                            const SizedBox(width: 10.0),
                            Column(children: [
                              SizedBox(
                                  width: 110.0,
                                  height: 40.0,
                                  child: AutoSizeText(country.name)),
                              Text(country.capital)
                            ]),
                            const SizedBox(width: 10.0),
                            FavouriteButton(country)
                          ])
                        : Row(children: [
                            const Icon(Icons.error_outline, size: 95.0),
                            const SizedBox(width: 10.0),
                            Column(children: [
                              SizedBox(
                                  width: 110.0,
                                  height: 40.0,
                                  child: AutoSizeText(country.name)),
                              Text(country.capital)
                            ]),
                            const SizedBox(width: 10.0),
                            FavouriteButton(country)
                          ]))
              ]),
              const SizedBox(height: 50.0),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: [
                      Text('Abbreviation : ${country.abbreviation}'),
                      Text('Currency : ${country.currency}'),
                      Text('Phone indicator : ${country.phone}'),
                      Text('Population : ${country.population}'),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
