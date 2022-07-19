import 'dart:math';

enum TileState {
  empty,
  cross,
  circle,
}

List<List<TileState>> chunk(List<TileState> list, int size) {

  return List.generate(
    (list.length / size).ceil(),
    (i) => list.sublist(i * size, min(i * size + size, list.length)));
}