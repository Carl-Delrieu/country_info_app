import 'package:country_info_app/presentation/pages/base_page.dart';
import 'package:country_info_app/presentation/pages/countries/countries_scoped_model.dart';
import 'package:country_info_app/presentation/pages/country_info/country_info_page.dart';
import 'package:country_info_app/presentation/pages/view_state.dart';
import 'package:country_info_app/presentation/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({Key? key}) : super(key: key);

  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage>
    with AutomaticKeepAliveClientMixin<CountriesPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BasePage<CountriesScopedModel>(
        initialState: ViewState.loading,
        builder: (context, child, scopedModel) =>
            Scaffold(
                floatingActionButton: FloatingActionButton(
                    child: const Icon(Icons.refresh),
                    onPressed: () => scopedModel.onRetry()),
                body: Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (scopedModel.state == ViewState.loading)
                          const Center(child: CircularProgressIndicator())
                        else
                          if (scopedModel.state == ViewState.empty)
                            Center(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                        AppLocalizations.of(context)!
                                            .noCountry)))
                          else
                            if (scopedModel.state == ViewState.ready)
                              Expanded(
                                  child: GridView.builder(
                                      physics: const ScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: scopedModel.countriesList
                                          .length,
                                      gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          childAspectRatio: 45 / 60),
                                      itemBuilder: (context, i) {
                                        return InkWell(
                                            onTap: () =>
                                                NavigationUtil.navigateTo(
                                                    context,
                                                    CountryInfoPage(
                                                        scopedModel
                                                            .countriesList[i])),
                                            child: Card(
                                              color: Colors.white60,
                                              shape: (scopedModel
                                                  .countriesList[i].isFavourite)
                                                  ? RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      color: Colors.amberAccent,
                                                      width: 2.0),
                                                  borderRadius:
                                                  BorderRadius.circular(4.0))
                                                  : null,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                      child: ClipRRect(
                                                          borderRadius: const BorderRadius
                                                              .vertical(
                                                              top:
                                                              Radius.circular(
                                                                  4.0)),
                                                          child: (Uri
                                                              .parse(scopedModel
                                                              .countriesList[i]
                                                              .flag)
                                                              .isAbsolute)
                                                              ? SizedBox(
                                                              child: Image
                                                                  .network(
                                                                  scopedModel
                                                                      .countriesList[i]
                                                                      .flag,
                                                                  errorBuilder: (
                                                                      c,
                                                                      e, s) =>
                                                                  const Icon(
                                                                      Icons
                                                                          .error_outline,
                                                                      size:
                                                                      100.0)))
                                                              : const Icon(
                                                              Icons
                                                                  .error_outline,
                                                              size: 100.0))),
                                                  Expanded(
                                                      child: SizedBox(
                                                          child: Center(
                                                              child: Text(
                                                                  scopedModel
                                                                      .countriesList[i]
                                                                      .name,
                                                                  textAlign: TextAlign
                                                                      .center,
                                                                  style:
                                                                  const TextStyle(
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                      fontSize:
                                                                      20.0)))))
                                                ],
                                              ),
                                            ));
                                      }))
                      ]),
                )));
  }
}
