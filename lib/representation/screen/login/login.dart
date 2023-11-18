import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 150,
            height: 150,
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                value: rememberMe,
                onChanged: (value) {
                  setState(() {
                    rememberMe = value!;
                  });
                },
              ),
              Text('Remember me'),
              Spacer(),
              TextButton(
                onPressed: () {
                  // Forgot password logic
                },
                child: Text('Forgot password?'),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Login button logic
            },
            child: Text('Log In'),
          ),
          SizedBox(height: 20),
          Text('or log in with'),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Google login logic
                },
                icon: Icon(Icons.g_translate),
                label: Text('Google'),
              ),
              SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () {
                  // Facebook login logic
                },
                icon: Icon(Icons.facebook),
                label: Text('Facebook'),
              ),
            ],
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              // Sign up logic
            },
            child: Text("Don't have an account? Sign Up"),
          ),
        ],
      ),
    );
  }
}
