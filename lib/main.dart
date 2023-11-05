import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stepperwithmap/provider/counter_provider.dart';
import 'package:stepperwithmap/provider/theme_provider.dart';
import 'package:stepperwithmap/views/Homepage.dart';
import 'package:stepperwithmap/views/getstart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool? res = pref.getBool('start');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => counterprovider(),
      ),
      ChangeNotifierProvider(
        create: (context) => themeprovider(),
      ),
    ],
    builder: (context, _) => MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: (Provider.of<themeprovider>(context).themeeee.isdark == false)
          ? ThemeMode.dark
          : ThemeMode.light,
      home: (res == true) ? homepage() : getstartt(),
    ),
  ));
}
