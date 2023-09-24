import 'package:cubit_learning/posts/cubit/posts_cubit.dart';
import 'package:cubit_learning/posts/ui/posts_page.dart';
import 'package:cubit_learning/users/cubit/users_cubit.dart';
import 'package:cubit_learning/users/ui/users_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/users',
      routes: {
        '/users': (context) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => UsersCubit()),
              ],
              child: const UsersPage(),
            ),
        '/posts': (context) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => PostsCubit()),
                BlocProvider(
                    create: (_) =>
                        UsersCubit()), // You can provide UsersCubit here if needed in PostsPage.
              ],
              child: const PostsPage(),
            ),
      },
    );
  }
}
