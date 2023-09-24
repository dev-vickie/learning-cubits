import 'package:cubit_learning/users/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    getUsers() {
      context.read<UsersCubit>().fetchUsers();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Users"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/posts'),
            icon: const Icon(
              Icons.arrow_forward_ios,
            ),
          )
        ],
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(
              child: ElevatedButton(
                child: const Text("Get Users"),
                onPressed: () {
                  getUsers();
                },
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: ((errorMessage) => Center(child: Text(errorMessage))),
            success: (users) {
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(users[index].name),
                    subtitle: Text(users[index].email),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
