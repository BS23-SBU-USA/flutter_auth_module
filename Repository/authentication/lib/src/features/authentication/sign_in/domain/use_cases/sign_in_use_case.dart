import 'package:auth_module/src/features/authentication/sign_in/domain/entities/sign_in_entity.dart';
import 'package:auth_module/src/features/authentication/sign_in/domain/repositories/sign_in_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInUseCaseProvider = Provider<SignInUseCase>(
  (ref) {
    final repository = ref.read(signInRepositoryProvider);
    return SignInUseCase(repository: repository);
  },
);

class SignInUseCase {
  const SignInUseCase({required this.repository});

  final SignInRepository repository;

  Future<(String?, SignInEntity?)> call({
    required String email,
    required String password,
    required bool rememberMeState,
  }) async {
    return repository.signIn(
      email: email,
      password: password,
      rememberMeState: rememberMeState,
    );
  }

  Future<Map<String, dynamic>?> getStoredCredentials() async {
    return repository.getStoredCredentials();
  }

  bool offlineLogin({
    required String email,
    required String password,
    required bool rememberMeState,
  }) {
    return repository.offlineSignIn(
      email: email,
      password: password,
      rememberMeState: rememberMeState,
    );
  }

  Future<String?> decideNextRoute() async {
    return repository.decideNextRoute();
  }
}
