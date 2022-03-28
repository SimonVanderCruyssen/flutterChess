import 'package:flutter/cupertino.dart';
import 'package:google_codelab/chessLogic/pieceColor.dart';
import 'package:google_codelab/chessLogic/pieceType.dart';

abstract class Piece {
  PieceType pieceType = PieceType.pawn;
  late int x;
  late int y;
  PieceColor pieceColor = PieceColor.none;

  abstract IconData icon;

  Piece(this.pieceType, this.pieceColor);

  int get X {
    return x;
  }

  int get Y {
    return y;
  }

  set X(int x) {
    this.x = x;
  }

  set Y(int y) {
    this.y = y;
  }

  void move(List<int> moveCoordinateslist) {
    int x2 = moveCoordinateslist[0];
    int y2 = moveCoordinateslist[1];
    if (isValidMove(x2, y2)) {
      x = x2;
      y = y2;
    }
  }

  bool isValidMove(int x2, int y2);
}
