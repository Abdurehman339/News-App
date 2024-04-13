import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<S, T> extends Cubit<S> {
  final T _data;
  bool _isBusy = false;

  BaseCubit(super.initialState, this._data);

  @protected
  T get data => _data;

  bool get isBusy => _isBusy;

  @protected
  run(Future<void> Function() process) async {
    if (!_isBusy) {
      _isBusy = true;
      await process();
      _isBusy = false;
    }
  }
}
