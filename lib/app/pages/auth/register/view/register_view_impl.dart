import 'package:flutter/widgets.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/pages/auth/register/resgister_page.dart';

import '../../../../core/ui/helpers/messages.dart';
import './register_view.dart';

abstract class RegisterViewImpl extends State<ResgisterPage>
    with Messages<ResgisterPage>, Loader<ResgisterPage>
    implements RegisterView {
  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void registerFail([String? message]) {
    hideLoader();
    showError(message ?? 'Erro ao cadastrar usuário');
  }

  @override
  void registerSuccess() {
    hideLoader();
    showSuccess('Usuário cadastrado com sucesso');
    Navigator.of(context).pop();
  }
}
