import 'package:flutter/material.dart';

class ToDoView extends StatefulWidget {
  const ToDoView({super.key});

  @override
  State<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView> {
  List<String> friendsList = ["Owais", "Bilal", "Shahid"];
  TextEditingController itemController = TextEditingController();
  TextEditingController updateItemController = TextEditingController();

  addItem() {
    setState(() {
      if (itemController.text.isNotEmpty) {
        friendsList.add(itemController.text);
      }
    });
    itemController.clear();
  }

  deletItem(i) {
    setState(() {
      friendsList.removeAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: itemController,
        ),
      ),
      body: ListView.builder(
        itemCount: friendsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Friend: ${friendsList[index]}"),
            trailing: Wrap(
              children: [
                IconButton(
                  onPressed: () {
                    updateItemController.text = friendsList[index];
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Update Item"),
                          content: TextField(
                            controller: updateItemController,
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  friendsList[index] =
                                      updateItemController.text;
                                });
                                print(friendsList);
                                updateItemController.clear();
                                Navigator.pop(context);
                              },
                              child: const Text("Update Item"),
                            )
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    deletItem(index);
                  },
                  icon: const Icon(Icons.delete_outline),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItem();
        },
        child: const Text("Add"),
      ),
    );
  }
}

/**
 * Column(
    children: [
      GestureDetector(
        child: Container(
          height: 200,
            color: Colors.red,
          ),
        )
      ],
    ), */