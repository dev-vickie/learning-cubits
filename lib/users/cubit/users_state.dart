part of 'users_cubit.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.initial() = _Initial;
  const factory UsersState.loading() = _Loading;
  const factory UsersState.success(List<User> users) = _Success;
  const factory UsersState.error(String errorMessage) = _Error;

}
