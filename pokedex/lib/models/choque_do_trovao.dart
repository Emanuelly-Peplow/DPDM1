// Questão 7 — Habilidade concreta: ChoqueDoTrovao

import 'habilidade.dart';
import 'pokemon.dart';

class ChoqueDoTrovao extends Habilidade {
  ChoqueDoTrovao() : super(nome: 'Choque do Trovão', custoEnergia: 15);

  @override
  void usar(Pokemon usuario, Pokemon alvo) {
    if (usuario.energia < custoEnergia) {
      print('  ⚠ ${usuario.nome} não tem energia suficiente para usar $nome.');
      return;
    }
    int dano = usuario.calcularAtaqueBase() + 5;
    usuario.gastarEnergia(custoEnergia);
    alvo.receberDano(dano);
    print('  ⚡ ${usuario.nome} usou $nome! Dano: $dano');
  }
}
