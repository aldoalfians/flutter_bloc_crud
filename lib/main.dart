import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_crud/app.dart';
import 'package:flutter_bloc_crud/general_observer.dart';

void main() {
  Bloc.observer = MyObserver();
  runApp(App());
}
