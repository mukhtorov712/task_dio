import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().fetchData();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: state.status == FetchDataStatus.loading
                ? const Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                        color: Colors.blueAccent,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      final data = state.list[index];
                      return ListTile(
                        title: Text(
                          data.firstName ?? 'FirstName',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          data.firstName ?? 'LastName',
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      );
                    },
                    // separatorBuilder: (context, index) => 8.ph,
                    itemCount: state.list.length,
                  ),
          ),
        );
      },
    );
  }
}
