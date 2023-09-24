import 'package:bloc/bloc.dart';
import 'package:cubit_learning/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';

part 'posts_state.dart';
part 'posts_cubit.freezed.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(const PostsState.initial());

  getPosts() async {
    try {
      emit(const PostsState.loading());
      Dio dio = Dio();

      final response =
          await dio.get("https://jsonplaceholder.typicode.com/posts");
      if (response.statusCode == 200) {
        List<Post> posts = response.data.map<Post>(
          (e) {
            return Post.fromJson(e);
          },
        ).toList();
        
        emit(PostsState.success(posts));
      } else {
        emit(const PostsState.error());
      }
    } catch (e) {
      emit(const PostsState.error());
    }
  }
}
