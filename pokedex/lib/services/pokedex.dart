// Questões 4, 5, 11 — Classe Pokedex

import '../models/pokemon.dart';

class Pokedex {
  final List<Pokemon> _pokemons = [];

  List<Pokemon> get pokemons => List.unmodifiable(_pokemons);

  // Questão 4: CRUD
  void adicionarPokemon(Pokemon p) {
    if (_pokemons.any((pk) => pk.numero == p.numero)) {
      print('  ⚠ Pokémon #${p.numero} já existe na Pokédex.');
      return;
    }
    _pokemons.add(p);
    print('  ✔ ${p.nome} (#${p.numero}) adicionado à Pokédex.');
  }

  bool removerPokemonPorNumero(int numero) {
    int index = _pokemons.indexWhere((p) => p.numero == numero);
    if (index == -1) {
      print('  ⚠ Pokémon #$numero não encontrado na Pokédex.');
      return false;
    }
    String nome = _pokemons[index].nome;
    _pokemons.removeAt(index);
    print('  ✔ $nome (#$numero) removido da Pokédex.');
    return true;
  }

  Pokemon? buscarPorNumero(int numero) {
    for (var p in _pokemons) {
      if (p.numero == numero) return p;
    }
    return null;
  }

  void listarTodos() {
    if (_pokemons.isEmpty) {
      print('  A Pokédex está vazia.');
      return;
    }
    print('  ╔══════════ POKÉDEX ══════════');
    for (var p in _pokemons) {
      p.exibirFicha();
    }
    print('  ╚═════════════════════════════');
  }

  // Questão 5: Filtros
  List<Pokemon> listarCapturados() =>
      _pokemons.where((p) => p.capturado).toList();

  List<Pokemon> listarPorTipo(String tipo) =>
      _pokemons.where((p) => p.tipo.toLowerCase() == tipo.toLowerCase()).toList();

  List<Pokemon> listarAcimaDoNivel(int nivelMinimo) =>
      _pokemons.where((p) => p.nivel >= nivelMinimo).toList();

  List<Pokemon> listarQuePodemEvoluir() =>
      _pokemons.where((p) => p.proximaEvolucao != null && p.nivel >= p.nivelEvolucao).toList();

  // Questão 11: Estatísticas
  int totalPokemons() => _pokemons.length;

  Map<String, int> quantidadePorTipo() {
    Map<String, int> mapa = {};
    for (var p in _pokemons) {
      mapa[p.tipo] = (mapa[p.tipo] ?? 0) + 1;
    }
    return mapa;
  }

  double mediaDeNivel() {
    if (_pokemons.isEmpty) return 0;
    int soma = _pokemons.fold(0, (acc, p) => acc + p.nivel);
    return soma / _pokemons.length;
  }

  double percentualCapturados() {
    if (_pokemons.isEmpty) return 0;
    int capturados = _pokemons.where((p) => p.capturado).length;
    return (capturados / _pokemons.length) * 100;
  }
}
