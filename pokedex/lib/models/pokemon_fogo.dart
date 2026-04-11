// Questão 6 — Herança: PokemonFogo

import 'pokemon.dart';

class PokemonFogo extends Pokemon {
  PokemonFogo({
    required super.numero,
    required super.nome,
    required super.nivel,
    required super.hpAtual,
    required super.hpMaximo,
    super.capturado,
    super.proximaEvolucao,
    super.nivelEvolucao,
    super.energia,
  }) : super(tipo: 'Fogo');

  @override
  int calcularAtaqueBase() => nivel * 3;

  @override
  void exibirFicha() {
    print('  🔥 [Pokémon de Fogo]');
    super.exibirFicha();
    print('  │ Ataque Base: ${calcularAtaqueBase()}');
  }
}
