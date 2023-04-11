import 'package:flutter/material.dart';
import 'package:flutter_bloc_crud/screens/add/add_screen.dart';
import 'package:flutter_bloc_crud/screens/edit/edit_screen.dart';
import 'package:flutter_bloc_crud/bloc/export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("ALL USERS"),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        bloc: userBloc,
        builder: (context, state) {
          if (state.allUsers.isEmpty) {
            return const Center(
              child: Text(
                "Data User tidak ada",
                style: TextStyle(fontSize: 24),
              ),
            );
          }
          return ListView.builder(
            itemCount: state.allUsers.length,
            itemBuilder: (context, index) {
              User user = state.allUsers[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditScreen(user),
                    ),
                  );
                },
                leading: CircleAvatar(
                  child: Text("${index + 1}"),
                ),
                title: Text(user.name),
                subtitle: Text("${user.age} tahun"),
                trailing: IconButton(
                  onPressed: () {
                    userBloc.add(
                      DeleteUserEvent(user),
                    );
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
