import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // This method handles the login logic
  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      // Perform login logic here
      print('Login button pressed');
      Navigator.pushReplacementNamed(context, '/home'); // Redirect to HomeScreen after successful login
    }
  }

  void _signup() {
    // Perform signup logic here or navigate to the signup page
    print('Signup button pressed');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Redirecting to Signup...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD4F1F9),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Image(
                image: AssetImage('assets/logo_small.png'),
                width: 50,
                height: 50,
              ),
              const SizedBox(height: 40),
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF05324D),
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              const Text(
                'Sign in to your account',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF7E8B8C),
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person, color: Colors.black54),
                  hintText: 'SSHYYFU8755',
                  filled: true,
                  fillColor: const Color(0xFFB3DFFA),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, color: Colors.black54),
                  suffixIcon: const Icon(Icons.visibility, color: Colors.black54),
                  hintText: 'Password',
                  filled: true,
                  fillColor: const Color(0xFFB3DFFA),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?', style: TextStyle(color: Color(0xFF05324D))),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF05324D),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: _signup,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF05324D)),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Signup', style: TextStyle(color: Color(0xFF05324D))),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "India's own finance marketplace\nMade in India",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF7E8B8C),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
