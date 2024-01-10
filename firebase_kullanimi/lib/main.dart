import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_kullanimi/firebase_options.dart';
import 'package:firebase_kullanimi/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<void> signIn(BuildContext context) async {
      try {
        // Burada Firebase Authentication ile giriş yapılır
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: usernameController.text.toString(),
          password: passwordController.text.toString(),
        );

        // Kullanıcı giriş yaptıktan sonra başka bir sayfaya geçiş yapabilirsiniz
        if (userCredential.user != null) {
          debugPrint(userCredential.user!.email.toString());
        }
      } catch (e) {
        print('Hata: $e');
        // Hata durumunu burada yönetebilirsiniz
      }
    }

    return MaterialApp(
      routes: {
        '/home': (context) => HomePage(),
      },
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: usernameController,
                      decoration:
                          const InputDecoration(hintText: "Kullanıcı Adı"),
                      validator: (value) {
                        if (value == null || value == "") {
                          return "Kullanıcı adı kısmını doldurunuz.";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: const InputDecoration(hintText: "Şifre"),
                      validator: (value) {
                        if (value == null || value == "") {
                          return "Şifre kısmını doldurunuz.";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () => signIn(context),
                        child: Text("GİRİŞ YAP")),
                    ElevatedButton(
                        onPressed: () => FirebaseAuth.instance
                            .signOut()
                            .then((value) => debugPrint("Çıkış Yapıldı.")),
                        child: Text("ÇIKIŞ YAP")),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
