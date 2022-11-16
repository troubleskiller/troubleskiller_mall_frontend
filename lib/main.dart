import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troubleskiller_mall/provider/current_index_provider.dart';
import 'package:troubleskiller_mall/screen/main/index_screen.dart';

import 'config/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CurrentIndexProvider()),
      ],
      child: MaterialApp(
        //flutter Mall
        title: MallString.homeTitle,
        debugShowCheckedModeBanner: false,
        //主题
        theme: ThemeData(primaryColor: MallColor.primaryColor),
        home: IndexScreen(),
      ),
    );
  }
}
