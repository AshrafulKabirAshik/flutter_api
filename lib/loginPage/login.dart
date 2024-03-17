import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../movieYTS/movieHomeYts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String result = 'Not Set';

  String Email = 'eve.holt@reqres.in';
  String Password = 'cityslicka';

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    String username = _usernameController.text;
    String password = _passwordController.text;
    //String apiKey = '71d23e5aa6f496147883bb6aeb35f71e';

    // Your backend API endpoint for login
    String url = 'https://reqres.in/api/login';



    // Request body as JSON
    Map<String, String> body = {
      'email': username,
      'password': password,
    };

    try {
      // Sending POST request
      var response = await http.post(
        Uri.parse(url),
        body: json.encode(body),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      // Checking the response status code
      if (response.statusCode == 200) {
        // Successful login
        // Handle your authentication logic here

        setState(() {
          result = response.body;
          _isLoading = false;
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MovieHomeYts(),
          ),
        );
      } else {
        // Failed login
        // Handle error (e.g., display an error message to the user)

        setState(() {
          result = 'Login failed. Status code: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (error) {
      // Handle any exceptions that occur during the HTTP request
      setState(() {
        result = 'Error during login: $error';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 40.0),

            SelectableText(Email),

            const SizedBox(height: 40.0),

            SelectableText(Password),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _isLoading
                    ? const SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          strokeWidth: 4,
                        ),
                      )
                    : GestureDetector(
                        onTap: _login,
                        child: const SizedBox(
                          height: 25,
                          //width: 100,
                          child: Text('Login'),
                        ),
                      ),
              ],
            ),
            const SizedBox(height: 20.0),
            Center(child: Text(result)),
          ],
        ),
      ),
    );
  }
}
