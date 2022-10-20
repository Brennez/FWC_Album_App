import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:fwc_album_app/app/pages/auth/register/view/register_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class ResgisterPage extends StatefulWidget {
  final RegisterPresenter presenter;
  const ResgisterPage({super.key, required this.presenter});

  @override
  State<ResgisterPage> createState() => _ResgisterPageState();
}

class _ResgisterPageState extends RegisterViewImpl {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: Tentar achar o motivo da appBar não pegar o tema
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: context.textStyles.textPrimaryFontBold.copyWith(
          color: Colors.black,
          fontSize: 18,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 106.82,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bola.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Cadastrar Usuário',
                style: context.textStyles.titleBlack,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: nameEC,
                      decoration: const InputDecoration(
                        label: Text('Nome completo *'),
                      ),
                      validator: Validatorless.required('Obrigatório!'),
                      style: context.textStyles.labelTextField,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: emailEC,
                      decoration: const InputDecoration(
                        label: Text('E-mail *'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Campo obrigratório!'),
                        Validatorless.email('E-mail inválido'),
                      ]),
                      style: context.textStyles.labelTextField,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: passwordEC,
                      decoration: const InputDecoration(
                        label: Text('Senha *'),
                      ),
                      obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.required('Campo obrigatório!'),
                        Validatorless.min(
                            6, "A senha deve conter pelo menos 6 caracteres!"),
                      ]),
                      style: context.textStyles.labelTextField,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: confirmPasswordEC,
                      decoration: const InputDecoration(
                        label: Text('Confirmar senha *'),
                      ),
                      obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.required('Campo obrigatório!'),
                        Validatorless.min(
                            6, "A senha deve conter pelo menos 6 caracteres!"),
                        Validatorless.compare(
                            passwordEC, 'senha digitada não é igual'),
                      ]),
                      style: context.textStyles.labelTextField,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Button.primary(
                width: MediaQuery.of(context).size.width * 0.90,
                onPressed: () {
                  final formValid = formKey.currentState?.validate() ?? false;
                  if (formValid) {
                    showLoader();
                    widget.presenter.register(
                      name: nameEC.text,
                      email: emailEC.text,
                      password: passwordEC.text,
                      password_confirmation: confirmPasswordEC.text,
                    );
                  }
                },
                label: 'Cadastrar',
              )
            ],
          ),
        ),
      ),
    );
  }
}
