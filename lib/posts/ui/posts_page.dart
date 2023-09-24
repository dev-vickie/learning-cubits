import 'package:cubit_learning/posts/cubit/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    getPosts() {
      context.read<PostsCubit>().getPosts();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          return state.when(
              initial: () => Center(
                    child: ElevatedButton(
                      child: const Text("Get posts"),
                      onPressed: () {
                        getPosts();
                      },
                    ),
                  ),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
              error: () => const Center(
                    child: Text("Error"),
                  ),
              success: (posts) => ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(posts[index].title),
                        subtitle: Text(posts[index].body),
                      );
                    },
                  ));
        },
      ),
    );
  }
}
