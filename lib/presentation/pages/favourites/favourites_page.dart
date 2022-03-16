import 'package:country_info_app/presentation/pages/base_page.dart';
import 'package:country_info_app/presentation/pages/favourites/favourites_scoped_model.dart';
import 'package:country_info_app/presentation/pages/view_state.dart';
import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage<FavouritesScopedModel>(
        initialState: ViewState.ready,
        builder: (context, child, scopedModel) =>
            Scaffold(
              body: Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: Column(
                      children: [
                        const SizedBox(height: 1.0),
                        if (scopedModel.state == ViewState.loading)
                          const CircularProgressIndicator()
                        else
                          if (scopedModel.state == ViewState.ready)
                            const Text('test')
                            //scopedModel.onFavouritesLoad()
                      ])),
            )
    );
  }
}
/*StreamBuilder(
stream: locator<LoadFavouritesUseCase>().execute(),
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
),*/