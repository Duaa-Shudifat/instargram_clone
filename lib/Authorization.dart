import 'package:flutter/material.dart';
import 'main_page.dart';

class Authorization extends StatelessWidget {
  const Authorization({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthorizationPage(),
    );
  }
}

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String emailError = '';
  String passwordError = '';

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+com$').hasMatch(email);
  }


  bool isValidPassword(String password) {
    return RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\W).+$').hasMatch(password);
  }

  void validateAndLogin() {
    setState(() {
      // تحقق البريد
      if (!isValidEmail(emailController.text)) {
        emailError = 'Please enter a valid email';
      } else {
        emailError = '';
      }

      // تحقق كلمة المرور
      if (!isValidPassword(passwordController.text)) {
        passwordError =
        'Password must include uppercase, lowercase & special character';
      } else {
        passwordError = '';
      }

      // إذا كل شيء صحيح، انتقل للصفحة الرئيسية
      if (emailError.isEmpty && passwordError.isEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset('images/instagram.png', width: 200),
            const SizedBox(height: 30),

            // Email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  errorText: emailError.isEmpty ? null : emailError,
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  errorText: passwordError.isEmpty ? null : passwordError,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Forget password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot password?',
                      style: TextStyle(color: Colors.blue)),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Login button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: validateAndLogin,
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Facebook login
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/Facebook.jpg', width: 20, height: 20),
                  const SizedBox(width: 8),
                  const Text('Log in with Facebook',
                      style: TextStyle(color: Colors.blue, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // OR divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                      child: Divider(color: Colors.grey[300], thickness: 0.8)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR', style: TextStyle(color: Colors.grey)),
                  ),
                  Expanded(
                      child: Divider(color: Colors.grey[300], thickness: 0.8)),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Sign up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? ",
                    style: TextStyle(color: Colors.grey)),
                GestureDetector(
                  onTap: () {},
                  child: const Text('Sign up.',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),

      // Bottom bar
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(color: Colors.grey[300], height: 1),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text('Instagram or Facebook',
                style: TextStyle(color: Colors.grey, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
