// Questão 6 — Herança: PokemonAgua

import 'pokemon.dart';

class PokemonAgua extends Pokemon {
  PokemonAgua({
    required super.numero,
    required super.nome,
    required super.nivel,
    required super.hpAtual,
    required super.hpMaximo,
    super.capturado,
    super.proximaEvolucao,
    super.nivelEvolucao,
    super.energia,
  }) : super(tipo: 'Água');

  @override
  int calcularAtaqueBase() => nivel * 2 + 10;

  @override
  void exibirFicha() {
    print('  💧 [Pokémon de Água]');
    super.exibirFicha();
    print('  │ Ataque Base: ${calcularAtaqueBase()}');
  }
}
