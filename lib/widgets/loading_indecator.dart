import 'package:flutter/material.dart';

class LoaingIndecator extends StatelessWidget {
  const LoaingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
