import 'package:flutter/src/widgets/icon_data.dart';
import 'package:google_codelab/chessLogic/piece.dart';
import 'package:google_codelab/chessLogic/pieceColor.dart';
import 'package:google_codelab/chessLogic/pieceType.dart';
import 'package:google_codelab/customIcons/chess_icons_icons.dart';

class Rook extends Piece{
  Rook(PieceType pieceType, PieceColor pieceColor) : super(pieceType, pieceColor);

  @override
  bool isValidMove(int x2, int y2) {
    return (((X - x2) == 0) ^ ((Y - y2) == 0)) ? true : false;
  }

  @override
  IconData icon = ChessIcons.chess_rook;

}