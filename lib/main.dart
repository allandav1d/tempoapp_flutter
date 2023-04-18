import 'package:flutter/material.dart';
import 'package:tempoapp_flutter/screens/Home.dart';
import 'package:tempoapp_flutter/theme/theme.dart';

void main() {
  runApp(PrevisaoTempo());
}

class PrevisaoTempo extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Previsão do tempo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: Home(),
    );
  }
}