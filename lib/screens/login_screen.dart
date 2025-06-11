import 'package:ecommerce/routes/app_route.dart';
import 'package:ecommerce/utils/constants/icons.dart';
import 'package:ecommerce/utils/constants/images.dart';
import 'package:ecommerce/utils/themes/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isValidMail = false;
  bool _isValidPassword = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CallColors.defaultColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(CallImages.imageAdric, width: 77, height: 77),
                const SizedBox(height: 24),
                Text(
                  "Login",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF485c75),
                  ),
                ),
                const SizedBox(height: 32),
                _emailField,
                const SizedBox(height: 16),
                _passwordField,
                const SizedBox(height: 24),
                _loginButton,
                const SizedBox(height: 10),
                _registerButton,
                const SizedBox(height: 10),
                _guestButton,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _emailField {
    return TextFormField(
      onChanged: (value) {
        if (value.contains("@")) {
          setState(() {
            _isValidMail = true;
          });
        } else {
          setState(() {
            _isValidMail = false;
          });
        }
      },
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        prefixIcon: Image.asset(CallIcons.iconEmail, width: 14, height: 14),
        suffix:
            _isValidMail
                ? Image.asset(CallIcons.iconTick, width: 24, height: 24)
                : Image.asset(CallIcons.iconDisagree, width: 24, height: 24),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your email";
        }
        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return "Please enter a valid email";
        }
        return null;
      },
    );
  }

  Widget get _passwordField {
    return TextFormField(
      onChanged: (value) {
        if (value.length > 6) {
          setState(() {
            _isValidPassword = true;
          });
        } else {
          setState(() {
            _isValidPassword = false;
          });
        }
      },
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        prefixIcon: Image.asset(CallIcons.iconPassword, width: 14, height: 14),
        suffix:
            _isValidPassword
                ? Image.asset(CallIcons.iconTick, width: 24, height: 24)
                : Image.asset(CallIcons.iconDisagree, width: 24, height: 24),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your password";
        }
        if (value.length < 6) {
          return "Password must be at least 6 characters";
        }
        return null;
      },
    );
  }

  Widget get _loginButton {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: CallColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            AppRoute.key.currentState!.pushReplacementNamed(
              AppRoute.mainScreen,
              arguments: "Mr. Choeun Sothearith",
            );
          } else {}
        },
        child: const Text(
          "Login",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget get _registerButton {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: CallColors.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          AppRoute.key.currentState!.pushReplacementNamed(
            AppRoute.registerScreen,
          );
        },

        child: const Text(
          "Register",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget get _guestButton {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: CallColors.darkGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          AppRoute.key.currentState!.pushReplacementNamed(
            AppRoute.mainScreen,
            arguments: "Guest",
          );
        },
        child: const Text(
          "Continue as Guest",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
