import 'dart:async';

import 'package:flutter/material.dart';
import 'item.dart';

class ItemAdapter with ChangeNotifier {
  final List<Item> _list = [];
  Item get currentItem => _list.first;

  ItemAdapter() {
    loadItems();
  }

  void modifyOrders() {
    _list.add(_list.removeAt(0));
    notifyListeners();
  }

  void loadItems() async {
    _testItem();
    // todo : complete the method
    notifyListeners();
  }

  void _testItem() {
    _list.add(Item('School', '학교'));
    _list.add(Item('test', '시험'));
    _list.add(Item('TV', '테레비'));
  }
}
