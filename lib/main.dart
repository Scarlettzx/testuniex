import 'package:flutter/material.dart';
import 'src/features/user/home/presentation/pages/Homepage.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uni Expense',
      theme: ThemeData(
        fontFamily: 'kanit',
        cardTheme: CardTheme(color: Colors.white),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        dialogTheme: const DialogTheme(backgroundColor: Colors.white),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),
        useMaterial3: true,
        // colorScheme: ColorScheme.light(primary: Colors.white)
      ),
      home: const Homepage(),
    );
  }
}
