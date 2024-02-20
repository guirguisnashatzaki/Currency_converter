import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rbna/bussiness_logic/currency/currency_cubit.dart';
import 'package:flutter_rbna/repository/currencyRepository.dart';
import 'package:flutter_rbna/screens/history_page.dart';
import 'package:flutter_rbna/screens/home.dart';
import 'package:flutter_rbna/web_services/currency_web_service.dart';
import 'constants.dart';
import 'db_handler/db_handler.dart';

void main() {
  runApp(MyApp(db: DBHelper(),currencyWebService: CurrencyWebService(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,required this.db,required this.currencyWebService});

  final DBHelper db;
  final CurrencyWebService currencyWebService;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Convertor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute:(settings) {
        switch (settings.name) {
          case home:
            return MaterialPageRoute(
                builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) =>
                            CurrencyCubit(CurrencyRepository(currencyWebService: currencyWebService,db: db)),
                      ),
                    ],
                    child: Home(currencyWebService: currencyWebService,db: db,))
            );
          case history:
            return MaterialPageRoute(
                builder: (_) => HistoryPage(currencyWebService: currencyWebService,db: db,));
        }
      },
    );
  }
}