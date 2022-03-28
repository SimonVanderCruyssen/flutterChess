import 'package:google_codelab/chessLogic/Pieces/bishop.dart';
import 'package:google_codelab/chessLogic/Pieces/king.dart';
import 'package:google_codelab/chessLogic/Pieces/knight.dart';
import 'package:google_codelab/chessLogic/Pieces/pawn.dart';
import 'package:google_codelab/chessLogic/Pieces/queen.dart';
import 'package:google_codelab/chessLogic/pieceColor.dart';
import 'package:google_codelab/chessLogic/pieceType.dart';

import 'Pieces/rook.dart';
import 'piece.dart';

class PieceFactory {
  Piece createPiece(PieceType pieceType, PieceColor pieceColor) {
    switch (pieceType) {
      case PieceType.pawn:
        return Pawn(pieceType, pieceColor);
      case PieceType.rook:
        return Rook(pieceType, pieceColor);
      case PieceType.knight:
        return Knight(pieceType, pieceColor);
      case PieceType.bishop:
        return Bishop(pieceType, pieceColor);
      case PieceType.queen:
        return Queen(pieceType, pieceColor);
      case PieceType.king:
        return King(pieceType, pieceColor);
      default:
        return Pawn(pieceType, pieceColor);
    }
  }

  Piece createPieceFromPiece(Piece piece) {
    Piece newPiece = createPiece(piece.pieceType, piece.pieceColor);
    newPiece.X = piece.X;
    newPiece.Y = piece.Y;
    return newPiece;
  }
}
