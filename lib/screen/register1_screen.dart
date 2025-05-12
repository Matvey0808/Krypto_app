import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:register_app/models/model1.dart';

enum AuthMode { register, login }

class AuthModeScreen extends StatefulWidget {
  const AuthModeScreen({super.key});

  @override
  State<AuthModeScreen> createState() => _AuthModeState();
}

class _AuthModeState extends State<AuthModeScreen> {
  AuthMode _authMode = AuthMode.register;

  void _switchAuthMode() {
    setState(() {
      _authMode =
          _authMode == AuthMode.register ? AuthMode.login : AuthMode.register;
    });
  }

  void _handleRegisterCardPressed() {
    setState(() {
      _authMode = AuthMode.register;
    });
  }

  void _handleLoginCardPressed() {
    setState(() {
      _authMode = AuthMode.login;
    });
  }

  void EnabledButton() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isRegistering = _authMode == AuthMode.register;

    return Scaffold(
      backgroundColor: Color.fromARGB(222, 178, 240, 211),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        toolbarHeight: 300,
        backgroundColor: const Color.fromARGB(222, 89, 185, 140),
        title: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: SvgPicture.asset(
            "assets/images/glos.svg",
            width: 150,
            height: 150,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: isRegistering ? 0 : -screenWidth,
            right: isRegistering ? 0 : screenWidth,
            top: 0,
            bottom: 0,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: AuthCard(
                title: "Registration",
                currentAuthMode: _authMode,
                cardAuthMode: AuthMode.register,
                onPressed: _handleRegisterCardPressed,
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Имя пользователя",
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Color.fromARGB(224, 72, 128, 133),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 120, 130),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Color.fromARGB(224, 72, 128, 133),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 120, 130),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Пароль",
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Color.fromARGB(224, 72, 128, 133),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 120, 130),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text("Зарегистрироваться"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: isRegistering ? screenWidth : 0,
            right: isRegistering ? -screenWidth : 0,
            top: 0,
            bottom: 0,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: AuthCard(
                title: "Вход",
                currentAuthMode: _authMode,
                cardAuthMode: AuthMode.login,
                onPressed: _handleLoginCardPressed,
                child: Column(
                  children: const [
                    Column(
                      children: const [
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Имя пользователя",
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: "Пароль"),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(onPressed: null, child: Text("Войти")),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: _switchAuthMode,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(222, 89, 185, 140),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            _authMode == AuthMode.register
                ? "Уже есть аккаунт? Войти"
                : "Нет аккаунта? Зарегистрироваться",
            style: TextStyle(fontSize: 15.5, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
