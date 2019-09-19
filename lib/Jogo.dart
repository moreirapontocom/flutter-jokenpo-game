import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _imagemApp = AssetImage("images/padrao.png");
  static List<String> _opcoesMensagem = ["Escolha uma opção abaixo","Parabéns, você ganhou!","Que pena, você perdeu...","Empatou!"];
  String _mensagemAtual = _opcoesMensagem[0];
  static int _pontosUsuario = 0;
  static int _pontosApp = 0;
  String _mensagemPontuacao = "(você) $_pontosUsuario x $_pontosApp (app)";

  void incrementPontos(String winner) {
    if (winner=='usuario') {
      _pontosUsuario++;
    } else if (winner=='app') {
      _pontosApp++;
    }
    setState(() {
      this._mensagemPontuacao = "(você) $_pontosUsuario x $_pontosApp (app)";
    });
  }

  void restartGame() {
    _pontosUsuario = 0;
    _pontosApp = 0;
    _mensagemAtual = _opcoesMensagem[0];

    setState(() {
      _imagemApp = AssetImage("images/padrao.png");
      this._mensagemPontuacao = "(você) $_pontosUsuario x $_pontosApp (app)";
    });
  }

  void selecionarOpcao(String opcaoJogador) {
    print("Usuário selecionou: $opcaoJogador");

    List<String> _opcoesApp = ["pedra","papel","tesoura"];
    int _numeroAleatorio = Random().nextInt(_opcoesApp.length);
    String _opcaoEscolhidaApp = _opcoesApp[ _numeroAleatorio ];

    print("App selecionou: $_opcaoEscolhidaApp");
    print("--");

    // Exibe a imagem da opção selecionada pelo App

    switch ( _opcaoEscolhidaApp ) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    if (
      ( opcaoJogador=='pedra' && _opcaoEscolhidaApp=='tesoura' ) ||
      ( opcaoJogador=='papel' && _opcaoEscolhidaApp=='pedra' ) ||
      ( opcaoJogador=='tesoura' && _opcaoEscolhidaApp=='papel' )
    ) {
      // eu ganho
      this._mensagemAtual = _opcoesMensagem[1];
      this.incrementPontos('usuario');
    } else if (
      ( _opcaoEscolhidaApp=='pedra' && opcaoJogador=='tesoura' ) ||
      ( _opcaoEscolhidaApp=='papel' && opcaoJogador=='pedra' ) ||
      ( _opcaoEscolhidaApp=='tesoura' && opcaoJogador=='papel' )
    ) {
      // eu perco
      this._mensagemAtual = _opcoesMensagem[2];
      this.incrementPontos('app');
    } else {
      // empatou
      setState(() {
        this._mensagemAtual = _opcoesMensagem[3];
      });
    }
  }

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
            Image(image: this._imagemApp,),
            Text(
              this._mensagemAtual,
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              this._mensagemPontuacao,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => selecionarOpcao('pedra'),
                  child: Image.asset("images/pedra.png", height: 100,),
                ),
                GestureDetector(
                  onTap: () => selecionarOpcao('papel'),
                  child: Image.asset("images/papel.png", height: 100,),
                ),
                GestureDetector(
                  onTap: () => selecionarOpcao('tesoura'),
                  child: Image.asset("images/tesoura.png", height: 100,),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                this.restartGame();
              },
              child: Text("Reiniciar jogo"),
            )
          ],
        ),
      ),
    );
  }
}