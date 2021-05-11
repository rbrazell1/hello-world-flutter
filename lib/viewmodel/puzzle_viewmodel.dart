import 'dart:async';

class PuzzleViewModel {
  final _tileListStreamController;
  final _moveCountStreamController;
  final _matchCountStreamController;
  final _tickStreamController;

  PuzzleViewModel()
      : _tileListStreamController = StreamController<List<Tile>>(),
        _moveCountStreamController = StreamController<int>(),
        _matchCountStreamController = StreamController<int>(),
        _tickStreamController = StreamController<int>() {

  }

  Stream<List<Tile>> get tileListStream => _tileListStreamController.stream;

  Stream<int> get moveCountStream => _moveCountStreamController.stream;

  Stream<int> get matchCountStreamController =>
      _matchCountStreamController.stream;

  Stream<int> get tickStream => _tickStreamContoller.stream;
}