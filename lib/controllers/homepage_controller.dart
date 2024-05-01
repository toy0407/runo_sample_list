import 'dart:math';
import 'package:get/state_manager.dart';
import 'package:runo_sample_list/data/backend_simulator.dart';
import 'package:runo_sample_list/models/item.model.dart';

class HomePageController extends GetxController {
  RxList<ItemModel> itemList = <ItemModel>[].obs;
  late ItemModel tempItem;

  addElement(ItemModel item) async {
    var tempItemId = Random().nextInt(100);
    tempItem = ItemModel(name: item.name, id: tempItemId);

    itemList.add(tempItem);

    // Simulate backend call
    var result = await BackendSimulator().simulateBackend(item);
    // Simulate success
    if (result != null) {
      updateElement(tempItemId, result);
    }
    // Simulate failure
    else {
      removeElement(tempItemId);
    }
  }

  updateElement(int oldId, ItemModel newItem) {
    var itemIndex = itemList.indexWhere((element) => element.id == oldId);

    itemList[itemIndex].id = newItem.id;
    itemList[itemIndex].name = newItem.name;

    itemList.refresh();
  }

  removeElement(int id) {
    var itemIndex = itemList.indexWhere((element) => element.id == id);
    itemList.removeAt(itemIndex);
  }
}
