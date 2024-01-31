import 'package:flutter/material.dart';
import 'package:expance_app/view_Model/register_view_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;

  RegisterViewModel viewModel = RegisterViewModel();

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

  void handleRegister() {
    String name = nameController.text;
    String surname = surnameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    if (isEmailValid && isPasswordValid) {
      print('Kayıt Başarılı. Ad: $name, Soyad: $surname, E-posta: $email, Şifre: $password');
    } else {
      print('Geçersiz E-posta Adresi veya Şifre');
    }
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Ad',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: surnameController,
                  decoration: InputDecoration(
                    labelText: 'Soyad',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    handleEmailValidation();
                  },
                  decoration: InputDecoration(
                    labelText: 'E-posta Adresi',
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: IconButton(
                      icon: isEmailValid
                          ? Icon(Icons.check, color: Colors.green)
                          : Icon(Icons.clear, color: Colors.red),
                      onPressed: () {
                        if (!isEmailValid) {
                          emailController.clear();
                          handleEmailValidation();
                        }
                      },
                    ),
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
                    suffixIcon: IconButton(
                      icon: isPasswordValid
                          ? Icon(Icons.check, color: Colors.green)
                          : Icon(Icons.clear, color: Colors.red),
                      onPressed: () {
                        if (!isPasswordValid) {
                          passwordController.clear();
                          handlePasswordValidation();
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text("Kayıt ol"),
                  onPressed: () {
                    viewModel.register(
                      context,
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                  },
                ),
                SizedBox(height: 20),
                TextButton(
                  child: Text("Hesabınız var mı? Giriş yapın"),
                  onPressed: () {
                    viewModel.openLoginPage(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
