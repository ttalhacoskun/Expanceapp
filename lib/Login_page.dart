import 'package:expance_app/Register_Page.dart';
import 'package:expance_app/view_Model/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;

  LoginViewModel viewModel = LoginViewModel();

  void handleEmailValidation() {
    String email = emailController.text;
    setState(() {
      isEmailValid = RegExp(
        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
      ).hasMatch(email);
    });
  }

  void handlePasswordValidation() {
    String password = passwordController.text;
    setState(() {
      isPasswordValid = password.length >= 6;
    });
  }

  void handleLogin() {
    viewModel.login(
      context,
      emailController.text.trim(),
      passwordController.text.trim(),
    );
  }

  void navigateToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/login_page_background.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      handleEmailValidation();
                    },
                    decoration: InputDecoration(
                      labelText: 'E-posta Adresi',
                      prefixIcon: Icon(Icons.email),
                      suffixIcon: isEmailValid
                          ? Icon(Icons.check, color: Colors.green)
                          : Icon(Icons.clear, color: Colors.red),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    onChanged: (value) {
                      handlePasswordValidation();
                    },
                    decoration: InputDecoration(
                      labelText: 'Şifre',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: isPasswordValid
                          ? Icon(Icons.check, color: Colors.green)
                          : Icon(Icons.clear, color: Colors.red),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: Text("Giriş Yap"),
                    onPressed:(){
                      viewModel.login(
                        context,
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                    },
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: navigateToRegisterPage,
                    child: Text(
                      'Hesabınız yok mu? Hemen kayıt olun',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
