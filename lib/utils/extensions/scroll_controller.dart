import 'package:flutter/material.dart';

extension ScrollControllerExtension on ScrollController {
  void onScrollEndsListner(
    final void Function() callback, {
    double offSet = 0,
  }) {
    addListener(() {
      final maxScroll = position.maxScrollExtent;
      final currentScroll = position.pixels;
      if (currentScroll == maxScroll) {
        callback();
      }
    });
  }
}
