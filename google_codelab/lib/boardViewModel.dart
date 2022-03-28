import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_codelab/chessLogic/boardLogic.dart';

class BoardViewModel extends ChangeNotifier {
  BoardLogic board = BoardLogic();

  void initGame() {
    board.initGame();
    notifyListeners();
  }

  void movePiece(int x, int y, int x2, int y2) {
    try {
      board.movePiece(x, y, x2, y2);
      notifyListeners();
    } on Exception catch (exception) {
      Fluttertoast.showToast(msg: exception.toString());
    }
  }

  void undoMove() {
    board.undoMove();
    notifyListeners();
  }

  bool firstTileClicked = false;
  bool secondTileClicked = false;
  late int firstX;
  late int firstY;
  late int secondX;
  late int secondY;

  void clickTile(int x, int y) {
    !firstTileClicked ? clickFirstTile(x, y) : clickSecondTile(x, y);
  }

  void clickFirstTile(int x, int y) {
    if (board.boardMatrix[x][y] == null) return;
    firstTileClicked = true;
    firstX = x;
    firstY = y;
  }

  void clickSecondTile(int x, int y) {
    if (firstTileClicked) {
      if (firstX == x && firstY == y) {
        firstTileClicked = false;
        return;
      }
      secondTileClicked = true;
      secondX = x;
      secondY = y;
      move();
    }
  }

  void move() {
    movePiece(firstX, firstY, secondX, secondY);
    firstTileClicked = false;
    secondTileClicked = false;
  }
}
