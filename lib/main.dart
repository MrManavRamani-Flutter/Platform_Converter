import 'package:contact_diary_ios_android/provider/contact_provider.dart';
import 'package:contact_diary_ios_android/provider/month_provider.dart';
import 'package:contact_diary_ios_android/provider/theme_chenge_app_provider.dart';
import 'package:contact_diary_ios_android/screen/android_view/home_a.dart';
import 'package:contact_diary_ios_android/screen/ios_view/home_i.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeChangeAppProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ContactProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => MonthProvider(),
          ),
        ],
        builder: (context, _) {
          return (Provider.of<ThemeChangeAppProvider>(context).isAndroid)
              ? MaterialApp(
                  debugShowCheckedModeBanner: false,
                  routes: {
                    '/': (context) => const HomeA(),
                  },
                )
              : CupertinoApp(
                  debugShowCheckedModeBanner: false,
                  routes: {
                    '/': (context) => const HomeI(),
                  },
                );
        });
  }
}
