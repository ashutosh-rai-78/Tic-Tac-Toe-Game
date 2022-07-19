import 'package:flutter/material.dart';
import 'package:tic_tac_toe/views/board_tile.dart';
import 'package:tic_tac_toe/views/tile_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _board = List.filled(9, TileState.empty);
  var _currentPlayer = TileState.cross;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
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
          children: chunk(_board, 3).asMap().entries.map((entry) {
            final chunkIndex = entry.key;
            final tileStateChunk = entry.value;
            return Row(
              children: tileStateChunk.asMap().entries.map((innerEntry) {
                final tileState = innerEntry.value;
                final innerIndex = innerEntry.key;
                final tileIndex = chunkIndex * 3 + innerIndex;

                return BoardTile(
                  dimension: boardTileDimension,
                  tileState: tileState,
                  onPressed: () {
                    _updateTileStateForIndex(tileIndex);
                  },
                );
              }).toList(),
            );
          }).toList(),
        ),
      );
    });
  }

  void _updateTileStateForIndex(int selectedIndex) {
    if (_board[selectedIndex] == TileState.empty) {
      setState(() {
        _board[selectedIndex] = _currentPlayer;
        _currentPlayer = _currentPlayer == TileState.cross
            ? TileState.circle
            : TileState.cross;
      });
      final winner = _checkWinner();
      if (winner != null) {
        print("Winner is $winner");
        _showWinnerDialog(winner);
      }
    }
  }

  TileState _checkWinner() {
    TileState? Function(int, int, int) winnerForMatch = (a, b, c) {
      if(_board[a] != TileState.empty ) {
        if(_board[a] == _board[b] && _board[b] == _board[c]) {
          return _board[a];
        }
      }
      return null;
    };
    final checks = [
      winnerForMatch(0, 1, 2),
      winnerForMatch(3, 4, 5),
      winnerForMatch(6, 7, 8),
      winnerForMatch(0, 3, 6),
      winnerForMatch(1, 4, 7),
      winnerForMatch(2, 5, 8),
      winnerForMatch(0, 4, 8),
      winnerForMatch(2, 4, 6),
    ];

    TileState? winner = null;
    for (int i = 0; i < checks.length; i++) {
      if (checks[i] != null) {
        winner = checks[i];
        break;
      }
    }
    return winner!;
  }
  void _showWinnerDialog(TileState winner) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Image.asset(
          winner == TileState.cross
              ? 'images/x.png'
              : 'images/o_wins.png',
        ),
        title: Text("Winner is $winner"),
        actions: <Widget>[
          FlatButton(
            child: Text("New Game"),
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _board = List.filled(9, TileState.empty);
                _currentPlayer = TileState.cross;
              });
            },

          ),
        ],
      ),
    );
  }
  void _resetBoard() {
    setState(() {
      _board = List.filled(9, TileState.empty);
    });
  }
}
