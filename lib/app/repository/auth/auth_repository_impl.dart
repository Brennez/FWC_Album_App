import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album_app/app/core/exceptions/repository_exception.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/models/register_user_model.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;

  AuthRepositoryImpl({required this.dio});

  @override
  Future<String> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> register(RegisterUserModel registerUserModel) async {
    try {
      await dio.unAuth().post(
            '/api/register',
            data: registerUserModel.toMap(),
          );
    } on DioError catch (error, s) {
      log(
        'Erro ao registrar usuário',
        error: error,
        stackTrace: s,
      );
      throw RepositoryException(message: 'Erro ao registrar usuário');
    }
  }
}
