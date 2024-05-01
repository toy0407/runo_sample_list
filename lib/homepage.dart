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
  HomePageController _homePageController = Get.put(HomePageController());
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
          title: Text("Animated List"),
        ),
        body: Obx(
          () => ListView.builder(
            itemBuilder: (context, index) {
              return _listItem(index);
            },
            itemCount: _homePageController.itemList.length,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              constraints: BoxConstraints(minHeight: 800),
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    constraints: BoxConstraints(
                        maxHeight: double.infinity, minWidth: double.infinity),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Enter Item", style: TextStyle(fontSize: 32)),
                        SizedBox(height: 100),
                        CupertinoTextField(
                            controller: _nameTextEditingController),
                        SizedBox(height: 20),
                        OutlinedButton(
                            onPressed: () {
                              _homePageController.addElement(ItemModel(
                                  name: _nameTextEditingController.text));
                              Navigator.pop(context);
                              _nameTextEditingController.clear();
                            },
                            child: Text("SUBMIT"))
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
    print(index);
    print(_homePageController.itemList.elementAt(index).name);
    return ListTile(
      title: Text(_homePageController.itemList.elementAt(index).name!),
      subtitle: Text("id: ${_homePageController.itemList.elementAt(index).id}"),
    );
  }
}
