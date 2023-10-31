import 'package:demo_firbase_app/extentions/styled_button.dart';
import 'package:demo_firbase_app/services/auth.dart';
import 'package:demo_firbase_app/shared/loading.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: false,
        title: const Text('Login'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      email = value;
                      print('Check email change $email');
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      password = value;
                      print('Check password change $password');
                    });
                  },
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                StyledButton(
                  text: 'Login',
                  onPressed: () async {
                    print('Click login');
                    print(email);
                    print(password);
                    setState(() {
                      loading = true;
                    });
                    dynamic result =
                        await _auth.signInEmailAndPassword(email, password);
                    if (result == null) {
                      print('Cant sign in');
                    } else {
                      print('Signin register');
                      print(result);
                    }
                    setState(() {
                      loading = false;
                    });
                  },
                ),
                const SizedBox(height: 10),
                StyledButton(
                  text: 'Register',
                  onPressed: () async {
                    print('Click login');
                    print('Check email $email');
                    print('Check password $password');
                    setState(() {
                      loading = true;
                    });
                    dynamic result =
                        await _auth.registerEmailAndPassword(email, password);
                    if (result == null) {
                      print('Cant register');
                    } else {
                      print('Register sucess');
                      print(result);
                    }
                    setState(() {
                      loading = false;
                    });
                  },
                ),
                const SizedBox(height: 10),
                StyledButton(
                  text: 'Login without email',
                  onPressed: () async {
                    print('Click login');
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.signInAnon();
                    if (result == null) {
                      print('Cant login anon');
                    } else {
                      print('Login sucess');
                      print(result);
                    }
                    setState(() {
                      loading = false;
                    });
                  },
                ),
              ],
            ),
          ),
          Visibility(
            visible: loading,
            child: const Center(
              child: Loading(),
            ),
          ),
        ],
      ),
    );
  }
}
