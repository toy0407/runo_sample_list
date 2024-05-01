import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:runo_sample_list/homepage_controller.dart';
import 'package:runo_sample_list/item.model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController _homePageController = Get.put(HomePageController());
  late TextEditingController _nameTextEditingController;

  @override
  void initState() {
    super.initState();
    _nameTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animated List"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => ListView.builder(
              itemBuilder: (context, index) {
                return _listItem(index);
              },
              itemCount: _homePageController.itemList.length,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              constraints: const BoxConstraints(minHeight: 800),
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    constraints: const BoxConstraints(
                        maxHeight: double.infinity, minWidth: double.infinity),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Enter name",
                            style: TextStyle(fontSize: 24)),
                        const SizedBox(height: 32),
                        CupertinoTextField(
                            controller: _nameTextEditingController),
                        const SizedBox(height: 12),
                        OutlinedButton(
                            onPressed: () {
                              _homePageController.addElement(ItemModel(
                                  name: _nameTextEditingController.text));
                              Navigator.pop(context);
                              _nameTextEditingController.clear();
                            },
                            child: const Text("SUBMIT"))
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
  }

  Widget _listItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: ListTile(
        title: Text(_homePageController.itemList.elementAt(index).name!),
        subtitle:
            Text("id: ${_homePageController.itemList.elementAt(index).id}"),
        tileColor: Colors.green[300],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
