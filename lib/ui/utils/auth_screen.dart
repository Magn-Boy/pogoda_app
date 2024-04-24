import 'dart:convert';
import 'package:Wheather/data/auth/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Wheather/ui/utils/home_page.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: Center(
        child: isSmallScreen
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  _FormContent(),
                ],
              )
            : Container(
                padding: const EdgeInsets.all(32.0),
                constraints: const BoxConstraints(maxWidth: 800),
                child: Row(
                  children: const [
                    Expanded(
                      child: Center(child: _FormContent()),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _FormContent extends StatefulWidget {
  const _FormContent({Key? key}) : super(key: key);

  @override
  State<_FormContent> createState() => __FormContentState();
}

class __FormContentState extends State<_FormContent> {
  bool _isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthToken _authToken = AuthToken();

  Future<void> authenticate(String username, String password) async {
    final String url = '${_authToken.baseUrl}/auth';

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> body = {
      'username': username,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        // Successfully authenticated
        Map<String, dynamic> responseData = jsonDecode(response.body);
        String token = responseData['token'];
        await _authToken.setToken(token);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
        print('Completed sign in: $token');
      } else {
        // Authentication failed
        print('Failed to authenticate. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error during authentication: $error');
    }
  }

  Widget _gap() => const SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.read(context);
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: model?.model.loginTextController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                if (value.length < 3) {
                  return 'Name must be at least 3 characters';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            _gap(),
            TextFormField(
              controller: model?.model.passwordTextController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                if (value.length < 4) {
                  return 'Password must be at least 4 characters';
                }
                return null;
              },
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )),
            ),
            _gap(),
            AuthButton(),
          ],
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.watch(context);
    final onPressed = model?.model.canStartAuth == true ? () => model?.model.auth(): null;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Sign in',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: onPressed);
  }
}
