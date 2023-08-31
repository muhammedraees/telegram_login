import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week7/screens/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController controlUsername = TextEditingController();
  final TextEditingController controlPssword = TextEditingController();
  bool error = false;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
                    'Telegram',
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromRGBO(255, 255, 255, 1)),
                  ),
        backgroundColor: const Color.fromRGBO(80, 167, 234, 1),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(                                
          key: formKey,
          child: ListView(
            children: [        
              const SizedBox(
                height: 150,
              ),
              TextFormField(
                controller: controlUsername,
                textInputAction: TextInputAction.next,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Username is Required';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                
                controller: controlPssword,
                textInputAction: TextInputAction.next,
                decoration:InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  labelText: 'PassWord',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Visibility(
                visible: error,
                child: Center(
                  child: const Text(
                    'Username or password incorrect',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromRGBO(80, 167, 234, 1)),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      if (controlUsername.text == 'arun' &&
                          controlPssword.text == '1234') {
                        var pref = await SharedPreferences.getInstance();
                        pref.setBool('isLogged', true);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      } else {
                              setState(() {
                        error = true;
                      });
                      await Future.delayed(
                       const Duration(seconds: 3),  
                      );
                      setState(() {
                        error=false;
                      });
                      }
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}