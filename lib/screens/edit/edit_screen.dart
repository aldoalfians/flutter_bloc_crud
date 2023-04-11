import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_crud/bloc/export.dart';

class EditScreen extends StatelessWidget {
  final User user;

  EditScreen(this.user, {super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = context.read<UserBloc>();
    nameController.text = user.name;
    ageController.text = '${user.age}';
    return Scaffold(
      appBar: AppBar(
        title: Text("EDIT USER"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Age",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              userBloc.add(EditUserEvent(
                User(
                  id: user.id,
                  name: nameController.text,
                  age: int.parse(ageController.text),
                ),
              ));
              Navigator.pop(context);
            },
            child: Text("EDIT USER"),
          ),
        ],
      ),
    );
  }
}
