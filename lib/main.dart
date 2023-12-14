import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_dio/src/api_service/api_service.dart';
import 'package:task_dio/src/presentation/manager/home_bloc.dart';
import 'package:task_dio/src/presentation/pages/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(ApiService()),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
