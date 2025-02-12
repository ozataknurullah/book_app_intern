import 'package:flutter/material.dart';

class CustomOverlay extends StatelessWidget {
  final String msg;
  const CustomOverlay({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withAlpha(70),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(msg),
          ],
        ),
      ),
    );
  }
}
