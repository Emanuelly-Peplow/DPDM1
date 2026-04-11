// Questão 6 — Herança: PokemonEletrico

import 'pokemon.dart';

class PokemonEletrico extends Pokemon {
  PokemonEletrico({
    required super.numero,
    required super.nome,
    required super.nivel,
    required super.hpAtual,
    required super.hpMaximo,
    super.capturado,
    super.proximaEvolucao,
    super.nivelEvolucao,
    super.energia,
  }) : super(tipo: 'Elétrico');

  @override
  int calcularAtaqueBase() => nivel * 2 + 15;

  @override
  void exibirFicha() {
    print('  ⚡ [Pokémon Elétrico]');
    super.exibirFicha();
    print('  │ Ataque Base: ${calcularAtaqueBase()}');
  }
}
