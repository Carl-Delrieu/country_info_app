import 'package:country_info_app/domain/features/load_countries.dart';
import 'package:country_info_app/presentation/pages/country_info/country_info_page.dart';
import 'package:country_info_app/presentation/utils/navigation_util.dart';
import 'package:country_info_app/service_locator.dart';
import 'package:flutter/material.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: locator<LoadCountriesUseCase>().execute(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: snapshot.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 45 / 60),
                itemBuilder: (context, i) {
                  return InkWell(
                      onTap: () => NavigationUtil.navigateTo(
                          context, CountryInfoPage(snapshot.data[i])),
                      child: Card(
                        color: Colors.white60,
                        child: Column(
                          children: <Widget>[
                            ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(4.0)),
                                child: (Uri.parse(snapshot.data[i].flag)
                                        .isAbsolute)
                                    ? Column(children: [
                                        Image.network(snapshot.data[i].flag,
                                            errorBuilder: (c, e, s) =>
                                                const Icon(Icons.error_outline,
                                                    size: 100.0)),
                                        Text(snapshot.data[i].name)
                                      ])
                                    : Column(children: [
                                        const Icon(Icons.error_outline,
                                            size: 100.0),
                                        Text(snapshot.data[i].name)
                                      ])),
                          ],
                        ),
                      ));
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
