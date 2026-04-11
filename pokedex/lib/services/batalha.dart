// Questão 8 — Polimorfismo em batalha

import '../models/pokemon.dart';
import '../models/habilidade.dart';

void executarTurno(Pokemon atacante, Pokemon defensor, Habilidade habilidade) {
  print('\n  ⚔ TURNO: ${atacante.nome} → ${defensor.nome}');
  habilidade.usar(atacante, defensor);
  print('  │ HP de ${defensor.nome}: ${defensor.hpAtual}/${defensor.hpMaximo}');
  if (defensor.hpAtual == 0) {
    print('  🏆 ${defensor.nome} foi derrotado! ${atacante.nome} venceu!');
  }
}
