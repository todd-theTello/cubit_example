import 'package:bloc/bloc.dart';
import 'package:cubit_example/src/core/model/authentication.dart';
import 'package:cubit_example/src/core/repository/authentication.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  final AuthenticationRepository _repository = AuthenticationRepository();
  Future<void> login({required String username, required String password}) async {
    emit(AuthenticationLoading());
    try {
      final response = await _repository.login(username: username, password: password);
      emit(AuthenticationSuccess(data: response));
    } on DioException catch (error, _) {
      emit(AuthenticationError(message: error.message ?? 'Something went wrong'));
    } catch (e) {
      emit(AuthenticationError(message: e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthenticationLoading());

    emit(AuthenticationInitial());
  }
}
