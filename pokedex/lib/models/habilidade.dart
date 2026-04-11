// Questão 7 — Classe abstrata Habilidade

import 'pokemon.dart';

abstract class Habilidade {
  final String nome;
  final int custoEnergia;

  Habilidade({required this.nome, required this.custoEnergia});

  void usar(Pokemon usuario, Pokemon alvo);
}
