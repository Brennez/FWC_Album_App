import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/styles/button_styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyles.i.yellowButton,
              child: Text('salvar'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: ButtonStyles.i.yellowOutlineButton,
              child: Text('salvar'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyles.i.primaryButton,
              child: Text('salvar'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: ButtonStyles.i.primaryOutlineButton,
              child: Text(
                'salvar',
              ),
            ),
            TextField(),
          ],
        ),
      ),
    );
  }
}
