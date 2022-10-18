import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';

class ResgisterPage extends StatefulWidget {
  const ResgisterPage({super.key});

  @override
  State<ResgisterPage> createState() => _ResgisterPageState();
}

class _ResgisterPageState extends State<ResgisterPage> {
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
                      decoration: const InputDecoration(
                        label: Text('Nome completo *'),
                      ),
                      style: context.textStyles.labelTextField,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('E-mail *'),
                      ),
                      style: context.textStyles.labelTextField,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Senha *'),
                      ),
                      style: context.textStyles.labelTextField,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Confirmar senha *'),
                      ),
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
                onPressed: () {},
                label: 'Cadastrar',
              )
            ],
          ),
        ),
      ),
    );
  }
}
