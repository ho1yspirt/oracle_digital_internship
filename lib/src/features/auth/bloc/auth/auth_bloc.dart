import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oracle_digital_internship/src/core/components/token_storage/token_repository.dart';
import 'package:oracle_digital_internship/src/features/auth/data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository, this.tokenRepository)
      : super(Unauthenticated()) {
    on<LoginEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        final model = await authRepository.login(
          email: event.email,
          password: event.password,
        );
        await tokenRepository.setTokens(model);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError());
      }
    });

    on<SignupEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        final model = await authRepository.signup(
          email: event.email,
          password: event.password,
        );
        await tokenRepository.setApiToken(model.apiToken);
        emit(Registered());
      } catch (e) {
        emit(AuthError());
      }
    });

    on<SignupConfirmEvent>((event, emit) async {
      try {
        final model = await authRepository.signupConfirm(
          nickname: event.nickname,
        );
        await tokenRepository.setTokens(model);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError());
      }
    });

    on<GetAuthStatusEvent>((event, emit) async {
      try {
        final bool status = tokenRepository.getApiToken().isNotEmpty;
        if (status) {
          emit(Authenticated());
        } else {
          emit(Unauthenticated());
        }
      } catch (e) {
        emit(AuthError());
      }
    });

    on<LogoutEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        await tokenRepository.deleteTokens();
        emit(Unauthenticated());
      } catch (e) {
        emit(AuthError());
      }
    });
  }

  final IAuthRepository authRepository;
  final ITokenRepository tokenRepository;
}
