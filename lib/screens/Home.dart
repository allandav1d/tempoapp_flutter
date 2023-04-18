import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:search_choices/search_choices.dart';

import '../Widget/climate_widget.dart';
import '../models/Climate.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;
  String _selectedCity = 'Curitiba';
  Climate tempoData = Climate();

  List<String> _cities = [
    'Aracaju',
    'Belém',
    'Belo Horizonte',
    'Boa Vista',
    'Brasilia',
    'Campo Grande',
    'Cuiaba',
    'Curitiba',
    'Florianópolis',
    'Fortaleza',
    'Goiânia',
    'João Pessoa',
    'Macapá',
    'Maceió',
    'Manaus',
    'Natal',
    'Palmas',
    'Porto Alegre',
    'Porto Velho',
    'Recife',
    'Rio Branco',
    'Rio de Janeiro',
    'Salvador',
    'São Luiz',
    'São Paulo',
    'Teresina',
    'Vitoria'
  ];

  carregaTempo() async {
    setState(() {
      isLoading = true;
    });

    String appId = '47c24e0b574ec1d8bd4e9ce85c24ba23';
    String lang = 'pt_br';
    String units = 'metric';
    String city = 'Curitiba';

    Uri uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$appId&lang=$lang&units=$units');

    http.Response response = await http.get(uri);

    print(response.body);

    if (response.statusCode == 200) {
      return setState(() {
        isLoading = false;
        tempoData = Climate.fromJson(jsonDecode(response.body));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    carregaTempo();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedCity ?? 'Previsão do tempo'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
            child: Column(
          children: [
            SearchChoices.single(
              items: _cities
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCity = value;
                  carregaTempo();
                });
              },
              displayClearIcon: false,
              value: _selectedCity,
              icon: Icon(Icons.location_on),
              isExpanded: true,
              closeButton: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text('Fechar'),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(6),
                  child: isLoading
                      ? CircularProgressIndicator(
                          strokeWidth: 4,
                          valueColor: new AlwaysStoppedAnimation(Colors.blue),
                        )
                      : tempoData != null
                          ? ClimateWidget(climate: tempoData, key: UniqueKey())
                          : Container(
                              child: Text('Não foi possível carregar os dados',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge),
                            ) ,
                ),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: isLoading
                    ? Container(
                      child: Text(
                          'Carregando!',
                          style: Theme.of(context).textTheme.headlineSmall
                      ) )
                            :
                        IconButton(
                          icon: Icon(Icons.refresh),
                          iconSize: 40,
                          tooltip: 'Atualizar',
                          color: Colors.blue,
                          onPressed: () {
                            carregaTempo();
                          },
                    )
                )
              ],
            ))
          ],
        )),
      ),
    );
  }
}