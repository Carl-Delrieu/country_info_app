import 'package:country_info_app/presentation/pages/base_page.dart';
import 'package:country_info_app/presentation/pages/country_info/country_info_page.dart';
import 'package:country_info_app/presentation/pages/favourites/favourites_scoped_model.dart';
import 'package:country_info_app/presentation/pages/view_state.dart';
import 'package:country_info_app/presentation/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage<FavouritesScopedModel>(
        initialState: ViewState.ready,
        builder: (context, child, scopedModel) => Scaffold(
                body: Container(
              padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    if (scopedModel.state == ViewState.loading)
                      const Center(child: CircularProgressIndicator())
                    else if (scopedModel.state == ViewState.empty)
                       Center(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(AppLocalizations.of(context)!.noFavourite)))
                    else if (scopedModel.state == ViewState.ready)
                      Expanded(
                          child: GridView.builder(
                              itemCount: scopedModel.countriesList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0,
                                      childAspectRatio: 45 / 60),
                              itemBuilder: (context, i) {
                                return InkWell(
                                    onTap: () => NavigationUtil.navigateTo(
                                        context,
                                        CountryInfoPage(
                                            scopedModel.countriesList[i])),
                                    child: Card(
                                      color: Colors.white60,
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(color: Colors.amberAccent, width: 2.0),
                                          borderRadius: BorderRadius.circular(4.0)),
                                      child: Column(
                                        children: <Widget>[
                                          ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                      top:
                                                          Radius.circular(4.0)),
                                              child: (Uri.parse(scopedModel
                                                          .countriesList[i]
                                                          .flag)
                                                      .isAbsolute)
                                                  ? Column(children: [
                                                      Image.network(
                                                          scopedModel
                                                              .countriesList[i]
                                                              .flag,
                                                          errorBuilder: (c, e,
                                                                  s) =>
                                                              const Icon(
                                                                  Icons
                                                                      .error_outline,
                                                                  size: 100.0)),
                                                      Text(scopedModel
                                                          .countriesList[i]
                                                          .name)
                                                    ])
                                                  : Column(children: [
                                                      const Icon(
                                                          Icons.error_outline,
                                                          size: 100.0),
                                                      Text(scopedModel
                                                          .countriesList[i]
                                                          .name)
                                                    ])),
                                        ],
                                      ),
                                    ));
                              }))
                  ]
                      //scopedModel.onFavouritesLoad()
                      )),
            )));
  }
}
