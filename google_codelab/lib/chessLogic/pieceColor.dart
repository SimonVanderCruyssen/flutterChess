enum PieceColor { none, white, black }

extension PieceColorExtension on PieceColor {
  int get value {
    switch (this) {
      case PieceColor.white:
        return 0xffffffff;
      case PieceColor.black:
        return 0xff000000;
      default:
        return 0;
    }
  }
}
