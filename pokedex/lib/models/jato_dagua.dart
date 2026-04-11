// Questão 7 — Habilidade concreta: JatoDAgua

import 'habilidade.dart';
import 'pokemon.dart';

class JatoDAgua extends Habilidade {
  JatoDAgua() : super(nome: "Jato D'Água", custoEnergia: 12);

  @override
  void usar(Pokemon usuario, Pokemon alvo) {
    if (usuario.energia < custoEnergia) {
      print('  ⚠ ${usuario.nome} não tem energia suficiente para usar $nome.');
      return;
    }
    int dano = usuario.calcularAtaqueBase() + 3;
    usuario.gastarEnergia(custoEnergia);
    alvo.receberDano(dano);
    print('  💧 ${usuario.nome} usou $nome! Dano: $dano');
  }
}
