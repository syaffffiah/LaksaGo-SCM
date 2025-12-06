// Unified main.dart file
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // State management
import 'package:flutter/foundation.dart'; // For kIsWeb

// Screens
import 'screens/home_screen.dart';
import 'login_signup/splashscreen.dart';
import 'screens/paymentsuccessful_screen.dart';

// Providers
import 'providers/cart_provider.dart';
import 'providers/favorites_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDlm5GJdvOBeVlyXaHuGUTsDhDxQSbuYPE",
        authDomain: "laksago-d1420.firebaseapp.com",
        projectId: "laksago-d1420",
        storageBucket: "laksago-d1420.firebasestorage.app",
        messagingSenderId: "781006891448",
        appId: "1:781006891448:web:fb73f5bbca4aafa376874d",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(MergedApp());
}

class MergedApp extends StatelessWidget {
  const MergedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(), // Splash screen initialization
        routes: {
          '/home': (context) => HomeScreen(),
          '/payment-successful': (context) => const PaymentSuccessfulScreen(),
        },
      ),
    );
  }
}
