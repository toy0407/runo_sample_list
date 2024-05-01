import 'dart:math';

import 'package:runo_sample_list/item.model.dart';

class BackendSimulator {
  Future<ItemModel?> simulateBackend(ItemModel item) async {
    // Simulating backend response
    await Future.delayed(Duration(seconds: 10)); // Simulating delay
    // Simulating successful response
    if (Random().nextBool()) {
      item.id = Random().nextInt(100) + 1000;
      item.name = "${item.name} BACKEND";
      return item;
    }

    // Simulating failed response
    else {
      return null;
    }
  }
}
