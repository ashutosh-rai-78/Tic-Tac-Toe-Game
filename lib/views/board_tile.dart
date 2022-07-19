import 'package:flutter/material.dart';

class BoardTile extends StatelessWidget {
  final double dimension;
  final VoidCallback onPressed;

  const BoardTile({Key? key, required this.dimension, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimension,
      height: dimension,
      child: FlatButton(
        onPressed: onPressed,
        child: Image.asset('images/x.png'),
      ),
    );
  }
}
