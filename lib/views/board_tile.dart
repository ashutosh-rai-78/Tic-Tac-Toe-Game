import 'package:flutter/material.dart';
import 'package:tic_tac_toe/views/tile_state.dart';

class BoardTile extends StatelessWidget {
  final TileState tileState;
  final double dimension;
  final VoidCallback onPressed;

  const BoardTile({Key? key, required this.dimension, required this.onPressed, required this.tileState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimension,
      height: dimension,
      child: FlatButton(
        onPressed: onPressed,
        child: widgetForTileState(),
      ),
    );
  }
  Widget widgetForTileState() {
    switch (tileState) {
      case TileState.empty:
        return Container();
      case TileState.cross:
        return Image.asset('images/x.png');
      case TileState.circle:
        return Image.asset('images/o.png');
    }
  }
}
