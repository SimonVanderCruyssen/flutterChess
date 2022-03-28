import "package:flutter/material.dart";
import 'package:google_codelab/boardViewModel.dart';
import 'package:provider/provider.dart';

import 'chessUI/board.dart';

class Chess extends StatelessWidget {
  const Chess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Sandbox",
        home: ChangeNotifierProvider(
          create: (context) => BoardViewModel(),
          child: const ChessView(),
        ));
  }
}

class ChessView extends StatefulWidget {
  const ChessView({Key? key}) : super(key: key);

  @override
  _ChessViewState createState() => _ChessViewState();
}

class _ChessViewState extends State<ChessView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Board(

              ),
            ),
          ],
        ));
  }
}
