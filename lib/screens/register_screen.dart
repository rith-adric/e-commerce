import 'package:flutter/material.dart';
import 'package:ecommerce/routes/app_route.dart';
import 'package:ecommerce/utils/constants/icons.dart';
import 'package:ecommerce/utils/constants/images.dart';
import 'package:ecommerce/utils/themes/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isValidMail = false;
  bool _isValidPassword = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                  "Register",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF485c75),
                  ),
                ),
                const SizedBox(height: 32),
                _nameField,
                const SizedBox(height: 16),
                _emailField,
                const SizedBox(height: 16),
                _passwordField,
                const SizedBox(height: 16),
                _confirmPasswordField,
                const SizedBox(height: 24),
                _registerButton,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _nameField {
    return TextFormField(
      controller: _nameController,
      decoration: InputDecoration(
        labelText: "Full Name",
        prefixIcon: const Icon(Icons.person, size: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your name";
        }
        return null;
      },
    );
  }

  Widget get _emailField {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          _isValidMail = value.contains("@");
        });
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
        setState(() {
          _isValidPassword = value.length > 6;
        });
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

  Widget get _confirmPasswordField {
    return TextFormField(
      controller: _confirmPasswordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Confirm Password",
        prefixIcon: Image.asset(CallIcons.iconPassword, width: 14, height: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please confirm your password";
        }
        if (value != _passwordController.text) {
          return "Passwords do not match";
        }
        return null;
      },
    );
  }

  Widget get _registerButton {
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
          }
        },
        child: const Text(
          "Register",
          style: TextStyle(
            fontSize: 16,

            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
