import 'package:country_info_app/domain/features/add_favourite.dart';
import 'package:country_info_app/domain/features/delete_favourite.dart';
import 'package:country_info_app/domain/models/country.dart';
import 'package:country_info_app/service_locator.dart';
import 'package:flutter/material.dart';

class FavouriteButton extends StatefulWidget {
  const FavouriteButton(this.country, {Key? key}) : super(key: key);

  final Country country;

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {

  @override
  Widget build(BuildContext context) {
    return _favouriteButton(widget.country);
  }

  _favouriteButton(Country country) {
    final List<bool> _selections = List.generate(1, (_) => country.isFavourite);
    return ToggleButtons(
        children: const [Icon(Icons.star)],
        color: Colors.grey,
        selectedColor: Colors.yellow,
        fillColor: Colors.transparent,
        renderBorder: false,
        borderRadius: BorderRadius.circular(25.0),
        isSelected: _selections,
        onPressed: (int i) {
          setState(() {
            _selections[i] = !_selections[i];
            if (_selections[i]) {
              locator<AddFavouriteUseCase>().execute(country);
            } else {
              locator<DeleteFavouriteUseCase>().execute(country);
            }
          });
        });
  }
}
