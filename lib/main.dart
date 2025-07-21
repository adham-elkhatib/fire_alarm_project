import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/Services/App/app.service.dart';
import 'core/Services/Auth/AuthService.dart';
import 'core/Services/FCM Notification/fcm.notification.service.dart';
import 'core/Services/Firebase/firebase.service.dart';
import 'core/Services/Notification/notification.service.dart';
import 'theme.dart';
import 'util.dart';
import 'views/authentication/presentation/pages/landing.screen.dart';
import 'views/home_screen.dart';

Future<void> main() async {
  //
  await App.initialize(AppEnvironment.dev);
  //

  await NotificationService.initialize();
  //
  //
  await FirebaseService.initialize();
  //
  await FCMNotification().initNotifications();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: theme.light().colorScheme,
        textTheme: textTheme,
      ),
      home: StreamBuilder(
        stream: AuthService().isUserLoggedIn(),
        builder: (builder, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LandingScreen();
          }
        },
      ),
    );
  }
}
