import 'dart:developer';

import 'package:fwc_album_app/app/models/register_user_model.dart';
import 'package:fwc_album_app/app/pages/auth/register/view/register_view.dart';
import 'package:fwc_album_app/app/repository/auth/auth_repository.dart';
import 'package:fwc_album_app/app/repository/auth/auth_repository_impl.dart';

import './register_presenter.dart';

class RegisterPresenterImpl implements RegisterPresenter {
  late final RegisterView _view;
  final AuthRepository authRepository;

  RegisterPresenterImpl({required this.authRepository});
  @override
  Future<void> register(
      {required name,
      required email,
      required password,
      required password_confirmation}) async {
    // Implementation
    final registerUserModel = RegisterUserModel(
      name: name,
      email: email,
      password: password,
      password_confirmation: password_confirmation,
    );

    try {
      await authRepository.register(registerUserModel);
      _view.registerSuccess();
    } catch (error, stackTrace) {
      log(
        'Erro ao cadastrar usuário',
        error: error,
        stackTrace: stackTrace,
      );
      _view.registerFail();
    }
  }

  @override
  set view(RegisterView view) => _view = view;
}
