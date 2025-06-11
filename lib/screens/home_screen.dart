import 'package:ecommerce/utils/constants/icons.dart';
import 'package:ecommerce/utils/themes/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  const HomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(context), body: _body);
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        "Hi, $username 👋",
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: CallColors.textPrimary,
        ),
      ),
      actions: [
        _iconButton(Image.asset(CallIcons.iconSearch, width: 20, height: 20)),
        const SizedBox(width: 8),
        _iconButton(
          Image.asset(CallIcons.iconNotification, width: 20, height: 20),
        ),
        const SizedBox(width: 12),
      ],
    );
  }

  Widget _iconButton(Widget icon) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      width: 33,
      height: 33,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade200,
      ),
      child: IconButton(
        icon: icon,
        onPressed: () {},
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      ),
    );
  }

  Widget get _body {
    return Container(
      // color: CallColors.defaultColor,
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: const Center(
        child: Text(
          "My work is done, guys. Appreciate for your time.",
          style: TextStyle(
            fontSize: 20,
            color: CallColors.textSecondary,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
