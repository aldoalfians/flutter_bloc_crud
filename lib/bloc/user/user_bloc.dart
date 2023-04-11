import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import "package:flutter_bloc_crud/models/user.dart";

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial([])) {
    // Add User
    on<AddUserEvent>((event, emit) {
      try {
        emit(UserLoading(state.allUsers));
        state.allUsers.add(event.user);
        emit(UserFinish(state.allUsers));
      } catch (e) {
        emit(UserError(state.allUsers));
      }
    });

    // Delete User
    on<DeleteUserEvent>((event, emit) {
      try {
        emit(UserLoading(state.allUsers));
        state.allUsers.removeWhere((element) => element.id == event.user.id);
        emit(UserFinish(state.allUsers));
      } catch (e) {
        emit(UserError(state.allUsers));
      }
    });
    // Edit user
    on<EditUserEvent>((event, emit) {
      try {
        emit(UserLoading(state.allUsers));
        final User selectedUser = state.allUsers
            .where((element) => element.id == event.user.id)
            .first;
        selectedUser.name = event.user.name;
        selectedUser.age = event.user.age;
        emit(UserFinish(state.allUsers));
      } catch (e) {
        emit(UserError(state.allUsers));
      }
    });
  }
}
