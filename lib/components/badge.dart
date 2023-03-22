import 'package:flutter/material.dart';

class Badgee extends StatelessWidget {
  const Badgee({Key? key, required this.child, required this.value, this.color})
      : super(key: key);

  final Widget child;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color ?? Theme.of(context).colorScheme.secondary,
              ),
              constraints: const BoxConstraints(
                minHeight: 16,
                minWidth: 16,
              ),
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            )),
      ],
    );
  }
}
