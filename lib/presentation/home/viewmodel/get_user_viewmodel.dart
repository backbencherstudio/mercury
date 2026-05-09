import 'package:flutter_riverpod/legacy.dart';
import 'package:mercury/core/network/api_clients.dart';
import 'package:mercury/data/models/user_model.dart';
import 'package:mercury/data/repositories/user_repository.dart';
import 'package:mercury/data/sources/remote/user_api_service.dart';

class UserState {
  final bool isLoading;
  final UserModel user;

  UserState({
    required this.isLoading,
    required this.user,
  });

  UserState copyWith({
    bool? isLoading,
    UserModel? user,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }
}

final getUserProvider =
    StateNotifierProvider<GetUserNotifier, UserState>(
  (ref) => GetUserNotifier(
    repository: UserRepository(
      remoteSource: UserApiService(
        apiClient: ApiClient(),
      ),
    ),
  ),
);

class GetUserNotifier extends StateNotifier<UserState> {
  final UserRepository repository;

  GetUserNotifier({
    required this.repository,
  }) : super(
          UserState(
            isLoading: false,
            user: UserModel(),
          ),
        ) {
    getUser();
  }

  Future<void> getUser() async {
    state = state.copyWith(isLoading: true);

    try {
      final response = await repository.getUser();

      state = state.copyWith(
        isLoading: false,
        user: response,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}