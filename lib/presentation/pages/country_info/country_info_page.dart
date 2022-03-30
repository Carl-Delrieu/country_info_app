import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_info_app/domain/models/country.dart';
import 'package:country_info_app/presentation/pages/base_page.dart';
import 'package:country_info_app/presentation/pages/country_info/country_info_scoped_model.dart';
import 'package:country_info_app/presentation/pages/country_info/widgets/favourite_button.dart';
import 'package:country_info_app/presentation/pages/view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      onScopedModelReady: (s) {
        s.country = country;
        s.isFavourite = country.isFavourite;
      },
      builder: (context, child, scopedModel) => Scaffold(
        appBar: AppBar(title: const Text('Info')),
        body: Container(
          padding: const EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 25.0),
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
                            const SizedBox(width: 20.0),
                            Column(children: [
                              const SizedBox(height: 15.0),
                              SizedBox(
                                  width: 110.0,
                                  height: 30.0,
                                  child: AutoSizeText(country.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40.0))),
                              SizedBox(
                                  width: 110.0,
                                  height: 30.0,
                                  child: AutoSizeText(country.capital))
                            ]),
                            const SizedBox(width: 10.0),
                            FavouriteButton(country, scopedModel)
                          ])
                        : Row(children: [
                            const Icon(Icons.error_outline, size: 95.0),
                            const SizedBox(width: 10.0),
                            Column(children: [
                              SizedBox(
                                  width: 110.0,
                                  height: 30.0,
                                  child: AutoSizeText(country.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40.0))),
                              SizedBox(
                                  width: 110.0,
                                  height: 30.0,
                                  child: AutoSizeText(country.capital))
                            ]),
                            const SizedBox(width: 10.0),
                            FavouriteButton(country, scopedModel)
                          ]))
              ]),
              const SizedBox(height: 25.0),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: [
                      Container(color: Colors.grey, height: 1.0),
                      const SizedBox(height: 20.0),
                      Row(children: [
                        const Icon(Icons.public, size: 30.0),
                        const SizedBox(width: 40.0),
                        Text(AppLocalizations.of(context)!.abbreviation +
                            country.abbreviation)
                      ]),
                      const SizedBox(height: 20.0),
                      Row(children: [
                        const Icon(Icons.monetization_on, size: 30.0),
                        const SizedBox(width: 40.0),
                        Text(AppLocalizations.of(context)!.currency +
                            country.currency)
                      ]),
                      const SizedBox(height: 20.0),
                      (country.phone != "")
                          ? Row(children: [
                              const Icon(Icons.phone, size: 30.0),
                              const SizedBox(width: 40.0),
                              Text(AppLocalizations.of(context)!.callingCode +
                                  "+" +
                                  country.phone)
                            ])
                          : Row(children: [
                              const Icon(Icons.phone, size: 30.0),
                              const SizedBox(width: 40.0),
                              Text(AppLocalizations.of(context)!.callingCode +
                                  AppLocalizations.of(context)!.none)
                            ]),
                      const SizedBox(height: 20.0),
                      (country.population != null)
                          ? Row(children: [
                              const Icon(Icons.groups, size: 30.0),
                              const SizedBox(width: 40.0),
                              Text(AppLocalizations.of(context)!.population +
                                  '${country.population}')
                            ])
                          : Row(children: [
                              const Icon(Icons.groups, size: 30.0),
                              const SizedBox(width: 40.0),
                              Text(AppLocalizations.of(context)!.population +
                                  AppLocalizations.of(context)!.none)
                            ])
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
