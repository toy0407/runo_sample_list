import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:runo_sample_list/controllers/homepage_controller.dart';

Widget listItem(int index) {
  HomePageController homePageController = Get.find();

  return Padding(
    padding: const EdgeInsets.only(top: 4, bottom: 4),
    child: ListTile(
      title: Text(homePageController.itemList.elementAt(index).name!),
      subtitle: Text("id: ${homePageController.itemList.elementAt(index).id}"),
      tileColor: Colors.green[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
  );
}
