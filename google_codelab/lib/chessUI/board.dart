import 'package:flutter/material.dart';
import 'package:google_codelab/boardViewModel.dart';
import 'package:google_codelab/chessLogic/piece.dart';
import 'package:google_codelab/chessLogic/pieceColor.dart';
import 'package:provider/provider.dart';

class Board extends StatefulWidget {
  Board({Key? key}) : super(key: key);
  final BoardViewModel boardViewModel = BoardViewModel();

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<BoardViewModel>(context);
    var boardLogic = vm.board;
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        margin: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (var i = 0; i < 8; i++)
                SizedBox(
                  height: 50,
                  width: 400,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (var j = 0; j < 8; j++)
                        Expanded(
                          child: StatefullColourfullTile(
                            color: (((i - j) % 2 != 0)
                                ? Colors.black45
                                : Colors.black12),
                            piece: boardLogic.boardMatrix[i][j],
                            x: i,
                            y: j,
                            vm: vm,
                          ),
                        )
                    ],
                  ),
                ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () => vm.initGame(),
                        child: Text("Start game")),
                  ),
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () => vm.undoMove(),
                        child: Text("Undo move")),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class StatefullColourfullTile extends StatefulWidget {
  const StatefullColourfullTile(
      {Key? key,
      required this.color,
      this.piece,
      required this.x,
      required this.y,
      required this.vm})
      : super(key: key);
  final BoardViewModel vm;
  final Color color;
  final Piece? piece;
  final int x;
  final int y;

  @override
  State<StatefullColourfullTile> createState() =>
      _StatefullColourfullTileState();
}

class _StatefullColourfullTileState extends State<StatefullColourfullTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: Container(
          color: widget.color,
          child: IconButton(
            icon: Icon(widget.piece?.icon),
            color: Color(
                widget.piece != null ? widget.piece!.pieceColor.value : 0),
            onPressed: () {
              widget.vm.clickTile(widget.x, widget.y);
            },
          ),
        ),
      ),
    );
  }
}
