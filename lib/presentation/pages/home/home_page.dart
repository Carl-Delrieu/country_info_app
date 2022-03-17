import 'package:country_info_app/presentation/pages/countries/countries_page.dart';
import 'package:country_info_app/presentation/pages/favourites/favourites_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('Country Info App')),
            bottom: TabBar(tabs: [
              Tab(
                icon: const Icon(Icons.public),
                text: AppLocalizations.of(context)!.countries,
              ),
              Tab(
                icon: const Icon(Icons.star),
                text: AppLocalizations.of(context)!.favourites,
              ),
            ]),
          ),
          body: const TabBarView(children: [
            CountriesPage(),
            FavouritesPage(),
          ]),
        ));
  }
}
