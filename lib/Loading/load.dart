import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Load extends StatelessWidget {
  const Load({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: const Center(
        child: SpinKitFadingCircle(
          color: Colors.lightBlue,
          size: 49.0,
        ),
      ),
    );
  }
}
