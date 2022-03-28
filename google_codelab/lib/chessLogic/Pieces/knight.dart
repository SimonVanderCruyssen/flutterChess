import 'package:flutter/src/widgets/icon_data.dart';
import 'package:google_codelab/chessLogic/piece.dart';
import 'package:google_codelab/chessLogic/pieceColor.dart';
import 'package:google_codelab/chessLogic/pieceType.dart';
import 'package:google_codelab/customIcons/chess_icons_icons.dart';

class Knight extends Piece{
  Knight(PieceType pieceType, PieceColor pieceColor) : super(pieceType, pieceColor);

  @override
  bool isValidMove(int x2, int y2) {
    return ( ( (X - x2).abs() == 2 && (Y - y2).abs() == 1 ) || ( (X - x2).abs() == 1 && (Y - y2).abs() == 2 )) ? true : false;
  }

  @override
  IconData icon = ChessIcons.chess_knight;

}