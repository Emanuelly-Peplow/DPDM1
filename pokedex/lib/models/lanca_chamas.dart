// Questão 7 — Habilidade concreta: LancaChamas

import 'habilidade.dart';
import 'pokemon.dart';

class LancaChamas extends Habilidade {
  LancaChamas() : super(nome: 'Lança-Chamas', custoEnergia: 18);

  @override
  void usar(Pokemon usuario, Pokemon alvo) {
    if (usuario.energia < custoEnergia) {
      print('  ⚠ ${usuario.nome} não tem energia suficiente para usar $nome.');
      return;
    }
    int dano = usuario.calcularAtaqueBase() + 7;
    usuario.gastarEnergia(custoEnergia);
    alvo.receberDano(dano);
    print('  🔥 ${usuario.nome} usou $nome! Dano: $dano');
  }
}
