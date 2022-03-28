import 'package:flutter/src/widgets/icon_data.dart';
import 'package:google_codelab/chessLogic/piece.dart';
import 'package:google_codelab/chessLogic/pieceColor.dart';
import 'package:google_codelab/chessLogic/pieceType.dart';
import 'package:google_codelab/customIcons/chess_icons_icons.dart';

class Pawn extends Piece{
  Pawn(PieceType pieceType, PieceColor pieceColor) : super(pieceType, pieceColor);

  @override
  bool isValidMove(int x2, int y2) {
    if ( pieceColor == PieceColor.black){
      return ( x2 - X == 1 && (Y-y2).abs() < 2) ? true: false;
    }
      return ( X - x2 == 1 && (Y-y2).abs() < 2) ? true: false;
  }

  @override
  IconData icon = ChessIcons.chess_pawn;

}