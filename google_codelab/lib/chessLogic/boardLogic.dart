import 'package:google_codelab/chessLogic/piece.dart';
import 'package:google_codelab/chessLogic/pieceColor.dart';
import 'package:google_codelab/chessLogic/pieceFactory.dart';
import 'package:google_codelab/chessLogic/pieceType.dart';

class BoardLogic {
  // creates 2d matrix array to store pieces.
  List<List<Piece?>> boardMatrix = List.generate(
      8, (i) => List.filled(8, null, growable: false),
      growable: false);

  //Creates stack to store all previous boardstates.
  List<List<List<Piece?>>> moves = List.empty(growable: true);

  void initGame() {
    boardMatrix = List.generate(8, (i) => List.filled(8, null, growable: false),
        growable: false);
    //Place pieces
    _placePawns();
    _placeRooks();
    _placeKnights();
    _placeBishops();
    _placeQueens();
    _placeKings();
    // Set pieces Coordinates
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        if (boardMatrix[i][j] != null) {
          boardMatrix[i][j]!.X = i;
          boardMatrix[i][j]!.Y = j;
        }
      }
    }
    //store inital gamestate to movesStack
    addToMoveList();
  }

  void movePiece(int x, int y, int x2, int y2) {
    Piece? piece = boardMatrix[x][y];
    //check if piece exists
    if (piece == null) {
      throw Exception("Piece not found");
    }
    //check if the players move is valid
    if (!piece.isValidMove(x2, y2))
      throw Exception(
          "non valid move for ${piece.pieceType.toString() + piece.X.toString() + piece.Y.toString()}");
    Piece? piece2 = boardMatrix[x2][y2];
    //Piece is trying to take an other piece
    if (piece2 != null) {
      piece2.pieceType == PieceType.king
          ? throw Exception("Can't take king")
          : null;
      piece2.pieceColor == piece.pieceColor
          ? throw Exception("Can't take own piece")
          : null;
      //second piece will be removed
    }
    //move the piece
    boardMatrix[x2][y2] = piece;
    boardMatrix[x][y] = null;
    piece.move([x2, y2]);
    //TODO check if new position causes checkmate
    checkCheckMate();
    addToMoveList();
  }

  //Who has time for this?
  //TODO
  void checkCheckMate() {}

  //Undo move and revert board to previous state in the movesStack
  void undoMove() {
    moves.removeLast();
    boardMatrix = moves.last;
  }

  //Add move to movesStack
  void addToMoveList() {
    var move = getMove();
    moves.add(move);
  }

  //Helper Method to copy values instead of references.
  List<List<Piece?>> getMove() {
    List<List<Piece?>> move = List.generate(
        8, (i) => List.filled(8, null, growable: false),
        growable: false);
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        if (boardMatrix[i][j] != null) {
          move[i][j] = PieceFactory().createPieceFromPiece(boardMatrix[i][j]!);
        }
      }
    }
    return move;
  }

  //#region PlacePieces
  void _placePawns() {
    for (int i = 0; i < 8; i++) {
      boardMatrix[1][i] =
          PieceFactory().createPiece(PieceType.pawn, PieceColor.black);
      boardMatrix[6][i] =
          PieceFactory().createPiece(PieceType.pawn, PieceColor.white);
    }
  }

  void _placeRooks() {
    boardMatrix[0][0] =
        PieceFactory().createPiece(PieceType.rook, PieceColor.black);
    boardMatrix[0][7] =
        PieceFactory().createPiece(PieceType.rook, PieceColor.black);
    boardMatrix[7][0] =
        PieceFactory().createPiece(PieceType.rook, PieceColor.white);
    boardMatrix[7][7] =
        PieceFactory().createPiece(PieceType.rook, PieceColor.white);
  }

  void _placeKnights() {
    boardMatrix[0][1] =
        PieceFactory().createPiece(PieceType.knight, PieceColor.black);
    boardMatrix[0][6] =
        PieceFactory().createPiece(PieceType.knight, PieceColor.black);
    boardMatrix[7][1] =
        PieceFactory().createPiece(PieceType.knight, PieceColor.white);
    boardMatrix[7][6] =
        PieceFactory().createPiece(PieceType.knight, PieceColor.white);
  }

  void _placeBishops() {
    boardMatrix[0][2] =
        PieceFactory().createPiece(PieceType.bishop, PieceColor.black);
    boardMatrix[0][5] =
        PieceFactory().createPiece(PieceType.bishop, PieceColor.black);
    boardMatrix[7][2] =
        PieceFactory().createPiece(PieceType.bishop, PieceColor.white);
    boardMatrix[7][5] =
        PieceFactory().createPiece(PieceType.bishop, PieceColor.white);
  }

  void _placeQueens() {
    boardMatrix[0][3] =
        PieceFactory().createPiece(PieceType.queen, PieceColor.black);
    boardMatrix[7][3] =
        PieceFactory().createPiece(PieceType.queen, PieceColor.white);
  }

  void _placeKings() {
    boardMatrix[0][4] =
        PieceFactory().createPiece(PieceType.king, PieceColor.black);
    boardMatrix[7][4] =
        PieceFactory().createPiece(PieceType.king, PieceColor.white);
  }
//#endregion

}
