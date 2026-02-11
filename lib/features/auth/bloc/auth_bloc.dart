import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }
  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {

      final response = await repository.login(
        username: event.username,
        password: event.password,
      );

      if (response.statusCode == 200) {

        emit(
          AuthSuccess(
            userId: response.payload['userId'],
            username: response.payload['username'],
          ),
        );
      } else {

        emit(AuthFailure(response.message));
      }
    } catch (e) {
      emit(AuthFailure('Login failed'));
    }
  }
}
