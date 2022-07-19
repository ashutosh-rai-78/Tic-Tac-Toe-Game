import 'package:flutter/material.dart';
import 'package:tic_tac_toe/views/board_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [Image.asset('images/board.png'), _boardTile()],
        ),
      ),
    );
  }

  Widget _boardTile() {
    return Builder(builder: (context) {
      final boardDimension = MediaQuery.of(context).size.width;
      final boardTileDimension = boardDimension / 3;
      return Container(
        width: boardDimension,
        height: boardDimension,
        child: Column(
          children: [
            Row(
              children: [
                BoardTile(dimension: boardTileDimension, onPressed: () {  },),
                BoardTile(dimension: boardTileDimension, onPressed: () {  },),
                BoardTile(dimension: boardTileDimension, onPressed: () {  },),
              ],
            ),
            Row(
              children: [
                BoardTile(dimension: boardTileDimension, onPressed: () {  },),
                BoardTile(dimension: boardTileDimension, onPressed: () {  },),
                BoardTile(dimension: boardTileDimension, onPressed: () {  },),
              ],
            ),
            Row(
              children: [
                BoardTile(dimension: boardTileDimension, onPressed: () {  },),
                BoardTile(dimension: boardTileDimension, onPressed: () {  },),
                BoardTile(dimension: boardTileDimension, onPressed: () {  },),
              ],
            ),
          ],
        ),
      );
    });
  }
}
