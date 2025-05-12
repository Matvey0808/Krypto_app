import 'package:flutter/material.dart';
import 'package:register_app/screen/register1_screen.dart';

class AuthCard extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback? onPressed;
  final AuthMode currentAuthMode;
  final AuthMode cardAuthMode;

  const AuthCard({
    super.key,
    required this.title,
    required this.child,
    this.onPressed,
    required this.currentAuthMode,
    required this.cardAuthMode,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentAuthMode == cardAuthMode;

    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}
