import 'package:flutter/widgets.dart';

class DecoratedContainer extends StatelessWidget {
  final Widget child;
  const DecoratedContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/bg-image.png"),
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
        ),
      ),
      child: child,
    );
  }
}
