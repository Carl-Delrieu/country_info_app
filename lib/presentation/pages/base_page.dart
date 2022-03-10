import 'package:country_info_app/presentation/pages/base_scoped_model.dart';
import 'package:country_info_app/presentation/pages/view_state.dart';
import 'package:country_info_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class BasePage<T extends BaseScopedModel> extends StatefulWidget {
  final ScopedModelDescendantBuilder<T> _builder;
  final Function(T)? onScopedModelReady;
  final ViewState? _initialState;

  const BasePage(
      {Key? key,
      required ScopedModelDescendantBuilder<T> builder,
      this.onScopedModelReady,
      ViewState? initialState})
      : _builder = builder,
        _initialState = initialState,
        super(key: key);

  @override
  _BasePageState<T> createState() => _BasePageState<T>();
}

class _BasePageState<T extends BaseScopedModel> extends State<BasePage<T>> {
  final T _scopedModel = locator<T>();

  @override
  void initState() {
    if (widget.onScopedModelReady != null) {
      widget.onScopedModelReady!(_scopedModel);
    }
    if (widget._initialState != null) {
      _scopedModel.setState(widget._initialState!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<T>(
        model: _scopedModel,
        child: ScopedModelDescendant<T>(builder: widget._builder));
  }
}
