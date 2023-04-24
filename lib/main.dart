import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_bar/Provider/search_provider.dart';
import 'Screen/search_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SearchProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SeacrhData(),
      ),
    );
  }
}
