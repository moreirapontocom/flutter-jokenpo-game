import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jo Ken Po"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Escolha do app",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            Image.asset("images/padrao.png"),
            Text(
              "ganhou ou perdeu",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/pedra.png", height: 100,),
                Image.asset("images/papel.png", height: 100,),
                Image.asset("images/tesoura.png", height: 100,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}