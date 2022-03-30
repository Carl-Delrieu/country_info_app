import 'package:country_info_app/domain/models/country.dart';
import 'package:country_info_app/presentation/pages/country_info/country_info_scoped_model.dart';
import 'package:flutter/material.dart';

class FavouriteButton extends StatefulWidget {
  const FavouriteButton(this.country, this.scopedModel, {Key? key})
      : super(key: key);

  final Country country;
  final CountryInfoScopedModel scopedModel;

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  @override
  Widget build(BuildContext context) {
    return _favouriteButton(widget.country, widget.scopedModel);
  }

  _favouriteButton(Country country, CountryInfoScopedModel scopedModel) {
    return IconButton(
      icon: (scopedModel.isFavourite) ? const Icon(Icons.star) : const Icon(Icons.star_outline),
      color: (scopedModel.isFavourite) ? Colors.yellow : Colors.grey,
      onPressed: scopedModel.onFavouriteButtonClick,
    );
  }
}
