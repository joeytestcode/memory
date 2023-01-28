import 'dart:async';

import 'package:flutter/material.dart';
import 'item.dart';

class ItemAdapter with ChangeNotifier {
  final List<Item> _list = [];
  Item get currentItem => _list.first;

  Future<void> modifyOrders() {
    Completer<void> _completer = Completer<void>();

    return _completer.future;
  }

  Future<void> loadItems() async {
    // todo : complete the method
    notifyListeners();
  }
}
