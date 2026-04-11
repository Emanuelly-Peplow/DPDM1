// Questão 12 — Desafio final: simulação do app

import '../lib/models/pokemon.dart';
import '../lib/models/pokemon_fogo.dart';
import '../lib/models/pokemon_agua.dart';
import '../lib/models/pokemon_eletrico.dart';
import '../lib/models/habilidade.dart';
import '../lib/models/choque_do_trovao.dart';
import '../lib/models/jato_dagua.dart';
import '../lib/models/lanca_chamas.dart';
import '../lib/services/pokedex.dart';
import '../lib/services/batalha.dart';

void main() {
  print('');
  print('══════════════════════════════════════════════════');
  print('       POKÉDEX INTERATIVA - SIMULAÇÃO COMPLETA');
  print('══════════════════════════════════════════════════');

  // ---- Criação da Pokédex ----
  Pokedex pokedex = Pokedex();

  // ════════════════════════════════════════════════
  // QUESTÃO 1 & 6: Cadastro de pokémons (8+, 3 tipos)
  // ════════════════════════════════════════════════
  print('\n═══ CADASTRO DE POKÉMONS ═══');

  var charmander = PokemonFogo(
    numero: 4,
    nome: 'Charmander',
    nivel: 15,
    hpAtual: 60,
    hpMaximo: 60,
    capturado: true,
    proximaEvolucao: 'Charmeleon',
    nivelEvolucao: 16,
    energia: 100,
  );

  var vulpix = PokemonFogo(
    numero: 37,
    nome: 'Vulpix',
    nivel: 20,
    hpAtual: 55,
    hpMaximo: 55,
    capturado: true,
    energia: 80,
  );

  var squirtle = PokemonAgua(
    numero: 7,
    nome: 'Squirtle',
    nivel: 12,
    hpAtual: 65,
    hpMaximo: 65,
    capturado: true,
    proximaEvolucao: 'Wartortle',
    nivelEvolucao: 16,
    energia: 100,
  );

  var psyduck = PokemonAgua(
    numero: 54,
    nome: 'Psyduck',
    nivel: 22,
    hpAtual: 25,
    hpMaximo: 70,
    energia: 90,
  );

  var vaporeon = PokemonAgua(
    numero: 134,
    nome: 'Vaporeon',
    nivel: 35,
    hpAtual: 120,
    hpMaximo: 120,
    capturado: true,
    energia: 100,
  );

  var pikachu = PokemonEletrico(
    numero: 25,
    nome: 'Pikachu',
    nivel: 18,
    hpAtual: 50,
    hpMaximo: 50,
    capturado: true,
    proximaEvolucao: 'Raichu',
    nivelEvolucao: 25,
    energia: 100,
  );

  var jolteon = PokemonEletrico(
    numero: 135,
    nome: 'Jolteon',
    nivel: 30,
    hpAtual: 90,
    hpMaximo: 90,
    capturado: true,
    energia: 100,
  );

  var magnemite = PokemonEletrico(
    numero: 81,
    nome: 'Magnemite',
    nivel: 10,
    hpAtual: 40,
    hpMaximo: 40,
    energia: 70,
  );

  pokedex.adicionarPokemon(charmander);
  pokedex.adicionarPokemon(vulpix);
  pokedex.adicionarPokemon(squirtle);
  pokedex.adicionarPokemon(psyduck);
  pokedex.adicionarPokemon(vaporeon);
  pokedex.adicionarPokemon(pikachu);
  pokedex.adicionarPokemon(jolteon);
  pokedex.adicionarPokemon(magnemite);

  // Teste de duplicata
  print('\n--- Tentativa de cadastrar duplicata ---');
  pokedex.adicionarPokemon(pikachu);

  // ════════════════════════════════════════════════
  // QUESTÃO 1: Exibir fichas
  // ════════════════════════════════════════════════
  print('\n═══ QUESTÃO 1: FICHAS DOS POKÉMONS ═══');
  charmander.exibirFicha();
  squirtle.exibirFicha();
  pikachu.exibirFicha();

  // ════════════════════════════════════════════════
  // QUESTÃO 2: Encapsulamento
  // ════════════════════════════════════════════════
  print('\n═══ QUESTÃO 2: ENCAPSULAMENTO E VALIDAÇÃO ═══');

  print('\n--- subirNivel ---');
  charmander.subirNivel(1);
  pikachu.subirNivel(5);
  pikachu.subirNivel(-3); // deve rejeitar

  print('\n--- receberDano ---');
  squirtle.receberDano(20);
  vulpix.receberDano(999); // não pode ficar negativo

  print('\n--- curar ---');
  squirtle.curar(10);
  vulpix.curar(100); // não pode ultrapassar máximo
  vulpix.curar(-5); // deve rejeitar

  // ════════════════════════════════════════════════
  // QUESTÃO 3: Evolução
  // ════════════════════════════════════════════════
  print('\n═══ QUESTÃO 3: EVOLUÇÃO ═══');

  print('\n--- Charmander tenta evoluir (nível ${charmander.nivel}) ---');
  charmander.evoluir();

  print('\n--- Squirtle tenta evoluir (nível ${squirtle.nivel}, precisa 16) ---');
  squirtle.evoluir(); // não pode, nível insuficiente

  print('\n--- Subindo Squirtle para evoluir ---');
  squirtle.subirNivel(4);
  squirtle.evoluir();

  print('\n--- Tentando evoluir novamente ---');
  squirtle.evoluir(); // já evoluiu

  // ════════════════════════════════════════════════
  // QUESTÃO 4: Busca e remoção
  // ════════════════════════════════════════════════
  print('\n═══ QUESTÃO 4: BUSCA E REMOÇÃO ═══');

  print('\n--- Buscar por número ---');
  var encontrado = pokedex.buscarPorNumero(25);
  print('  Busca #25: ${encontrado != null ? encontrado.nome : "Não encontrado"}');

  var naoEncontrado = pokedex.buscarPorNumero(999);
  print('  Busca #999: ${naoEncontrado != null ? naoEncontrado.nome : "Não encontrado"}');

  print('\n--- Remover pokémon ---');
  pokedex.removerPokemonPorNumero(999); // não existe

  // ════════════════════════════════════════════════
  // QUESTÃO 5: Filtros
  // ════════════════════════════════════════════════
  print('\n═══ QUESTÃO 5: FILTROS DA POKÉDEX ═══');

  print('\n--- Capturados ---');
  var capturados = pokedex.listarCapturados();
  for (var p in capturados) print('  • $p');

  print('\n--- Por tipo: Água ---');
  var tipoAgua = pokedex.listarPorTipo('água');
  for (var p in tipoAgua) print('  • $p');

  print('\n--- Por tipo: FOGO (case insensitive) ---');
  var tipoFogo = pokedex.listarPorTipo('FOGO');
  for (var p in tipoFogo) print('  • $p');

  print('\n--- Acima do nível 20 ---');
  var acimaDoNivel = pokedex.listarAcimaDoNivel(20);
  for (var p in acimaDoNivel) print('  • $p');

  print('\n--- Que podem evoluir ---');
  var podemEvoluir = pokedex.listarQuePodemEvoluir();
  if (podemEvoluir.isEmpty) {
    print('  Nenhum pokémon pode evoluir no momento.');
  } else {
    for (var p in podemEvoluir) print('  • $p');
  }

  // ════════════════════════════════════════════════
  // QUESTÃO 6: Fichas com herança
  // ════════════════════════════════════════════════
  print('\n═══ QUESTÃO 6: HERANÇA - FICHAS POR TIPO ═══');
  charmander.exibirFicha();
  squirtle.exibirFicha();
  jolteon.exibirFicha();

  // ════════════════════════════════════════════════
  // QUESTÃO 7 & 8: Habilidades e Batalhas
  // ════════════════════════════════════════════════
  print('\n═══ QUESTÃO 7 & 8: BATALHAS COM POLIMORFISMO ═══');

  Habilidade choqueDoTrovao = ChoqueDoTrovao();
  Habilidade jatoDAgua = JatoDAgua();
  Habilidade lancaChamas = LancaChamas();

  // Restaurar HP para batalhas
  charmander.curar(999);
  pikachu.curar(999);
  vaporeon.curar(999);
  jolteon.curar(999);

  print('\n--- Batalha 1: Pikachu vs Vaporeon ---');
  executarTurno(pikachu, vaporeon, choqueDoTrovao);
  executarTurno(vaporeon, pikachu, jatoDAgua);
  executarTurno(pikachu, vaporeon, choqueDoTrovao);

  print('\n--- Batalha 2: Charmander vs Jolteon ---');
  executarTurno(charmander, jolteon, lancaChamas);
  executarTurno(jolteon, charmander, choqueDoTrovao);
  executarTurno(charmander, jolteon, lancaChamas);

  // ════════════════════════════════════════════════
  // QUESTÃO 9: Interface RegistravelNaPokedex
  // ════════════════════════════════════════════════
  print('\n═══ QUESTÃO 9: INTERFACE - VISTO / CAPTURADO / FAVORITO ═══');

  print('\n--- marcarComoVisto ---');
  psyduck.marcarComoVisto();
  magnemite.marcarComoVisto();

  print('\n--- marcarComoCapturado (marca visto automaticamente) ---');
  psyduck.marcarComoCapturado();

  print('\n--- favoritar ---');
  charmander.favoritar();
  vaporeon.favoritar();
  magnemite.favoritar(); // deve falhar: não capturado

  print('\n--- desfavoritar ---');
  vaporeon.desfavoritar();
  vaporeon.favoritar(); // re-favoritar

  // ════════════════════════════════════════════════
  // QUESTÃO 10: Funções anônimas
  // ════════════════════════════════════════════════
  print('\n═══ QUESTÃO 10: FUNÇÕES ANÔNIMAS ═══');

  print('\n--- Pokémons com HP atual abaixo de 30 ---');
  var hpBaixo = pokedex.pokemons.where((p) => p.hpAtual < 30).toList();
  if (hpBaixo.isEmpty) {
    print('  Nenhum pokémon com HP abaixo de 30.');
  } else {
    for (var p in hpBaixo) print('  • ${p.nome} — HP: ${p.hpAtual}/${p.hpMaximo}');
  }

  print('\n--- Ordenados por nome (A-Z) ---');
  var porNome = List<Pokemon>.from(pokedex.pokemons)
    ..sort((a, b) => a.nome.toLowerCase().compareTo(b.nome.toLowerCase()));
  for (var p in porNome) print('  • $p');

  print('\n--- Ordenados por nível (decrescente) ---');
  var porNivel = List<Pokemon>.from(pokedex.pokemons)
    ..sort((a, b) => b.nivel.compareTo(a.nivel));
  for (var p in porNivel) print('  • $p');

  print('\n--- Pokémons favoritos ---');
  var favoritos = pokedex.pokemons.where((p) => p.favorito).toList();
  if (favoritos.isEmpty) {
    print('  Nenhum pokémon favoritado.');
  } else {
    for (var p in favoritos) print('  • ★ $p');
  }

  // ════════════════════════════════════════════════
  // QUESTÃO 11: Estatísticas
  // ════════════════════════════════════════════════
  print('\n═══ QUESTÃO 11: ESTATÍSTICAS DA POKÉDEX ═══');
  print('  Total de Pokémons: ${pokedex.totalPokemons()}');
  print('  Média de nível: ${pokedex.mediaDeNivel().toStringAsFixed(1)}');
  print('  Percentual capturados: ${pokedex.percentualCapturados().toStringAsFixed(1)}%');
  print('  Quantidade por tipo:');
  pokedex.quantidadePorTipo().forEach((tipo, qtd) {
    print('    • $tipo: $qtd');
  });

  print('\n══════════════════════════════════════════════════');
  print('       SIMULAÇÃO CONCLUÍDA COM SUCESSO!');
  print('══════════════════════════════════════════════════');
  print('');
}
