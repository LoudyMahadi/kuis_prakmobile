import 'package:flutter/material.dart';
import 'package:kuis_prakmobile/home/homepage.dart';
// import 'package:tugas2/home/homepage.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPageState();
}

bool isLoginSuccess = true;

class _LoginPageState extends State<LoginPages> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Blue Doorz'),
          backgroundColor: const Color.fromARGB(255, 17, 27, 51),
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Tambahkan logo aplikasi di sini
              SizedBox(height: 100), // Tambahkan ruang kosong di atas field username
              Image.asset('assets/logo.png', width: 200), // Ganti dengan logo aplikasi Anda
              SizedBox(height: 20), // Tambahkan ruang kosong di antara logo dan field username
              _usernameField(),
              _passwordField(),
              _loginbutton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.all(8),
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.yellow)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.blue)),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: const InputDecoration(
          hintText: 'Passwords',
          contentPadding: const EdgeInsets.all(8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.yellow),
          ),
        ),
      ),
    );
  }

  Widget _loginbutton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: (isLoginSuccess) ? Colors.blue : Colors.red,
        ),
        onPressed: () {
          String text = "";
          if (password == "123") {
            setState(() {
              text = "Sukses Login";
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return HomePage(username: username);
              }),
            );
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
            });
          }
          SnackBar snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('LOGIN'),
      ),
    );
  }
}