import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tododemo/app/data/provider/user_preferences.dart';
import 'package:tododemo/app/routes/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: (prefs.token == '') ? 'login' : 'list',
    navigatorKey: Get.key,
    getPages: routes(),
  ));
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Material App Bar'),
//         ),
//         body: Center(
//           child: Container(
//             child: Text('Hello World'),
//           ),
//         ),
//       ),
//       initialRoute: 'login',
//       routes: routes(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
