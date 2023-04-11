import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_crud/bloc/export.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD USER"),
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
          SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.number,
            controller: ageController,
            decoration: InputDecoration(
              labelText: "Age",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              userBloc.add(
                AddUserEvent(
                  User(
                    id: Random().nextInt(999999),
                    name: nameController.text,
                    age: int.parse(ageController.text),
                  ),
                ),
              );
              Navigator.pop(context);
            },
            child: Text("ADD USER"),
          ),
        ],
      ),
    );
  }
}
