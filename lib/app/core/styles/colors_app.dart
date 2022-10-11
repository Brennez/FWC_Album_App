import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  // Utilizando singleton para pegar apenas uma instância da classe
  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0XFF791435);
  Color get secondary => const Color(0XFFFDCE50);
  Color get yellow => const Color(0XFFFDCE50);
  Color get grey => const Color(0XFFCCCCCC);
  Color get greyDart => const Color(0XFF999999);
}

// Extensão para não precisar digitar a instância dessa classe todas as vezes
extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
