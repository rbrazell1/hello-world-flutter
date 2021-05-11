import 'dart:async';
import 'dart:math';

import 'package:hello_world_flutter/model/puzzle.dart';
import 'package:hello_world_flutter/model/tile.dart';

class PuzzleViewModel {
  static const _size = 28;
  static const _tick = 500;

  final _tileListStreamController;
  final _moveCountStreamController;
  final _matchCountStreamController;
  final _tickStreamController;
  final _rng;

  late Puzzle _puzzle;
  Timer? _timer;

  PuzzleViewModel()
      : _tileListStreamController = StreamController<List<Tile>>(),
        _moveCountStreamController = StreamController<int>(),
        _matchCountStreamController = StreamController<int>(),
        _tickStreamController = StreamController<int>(),
        _rng = Random.secure() {}

  Stream<List<Tile>> get tileListStream => _tileListStreamController.stream;

  Stream<int> get moveCountStream => _moveCountStreamController.stream;

  Stream<int> get matchCountStreamController =>
      _matchCountStreamController.stream;

  Stream<int> get tickStream => _tickStreamController.stream;

  newPuzzle(int imagePoolSize) {
    _puzzle = Puzzle(_size, imagePoolSize, _rng);
    _timer?.cancel();
    _timer = Timer.periodic(Duration(microseconds: _tick),
        (timer) => _tickStreamController.add(timer.tick));
  }

  select(int tileIndex) {

  }
}
