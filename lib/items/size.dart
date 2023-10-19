import 'package:flutter/material.dart';

class Size extends StatelessWidget {
  final String size;
  final String selected;
  const Size({super.key, required this.size, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: size == selected?Colors.red :const Color(0xFF2B2B2B),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(size,
      style: const TextStyle(fontSize: 15,color: Colors.white,fontFamily: 'Audiowide'),
      ),
    );
  }
}