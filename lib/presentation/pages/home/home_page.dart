import 'package:country_info_app/presentation/pages/countries/countries_page.dart';
import 'package:country_info_app/presentation/pages/favourites/favourites_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Info Monde'),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.public),
                text: 'Countries',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favourites',
              ),
            ]),
          ),
          body: TabBarView(
              children: [
                CountriesPage(),
                FavouritesPage(),
              ]),
        )
    );
  }
}