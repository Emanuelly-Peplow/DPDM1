// Questões 1, 2, 3, 9 — Classe base Pokemon

import '../interfaces/registravel_na_pokedex.dart';

class Pokemon implements RegistravelNaPokedex {
  final int numero;
  String _nome;
  final String tipo;
  int _nivel;
  int _hpAtual;
  int _hpMaximo;
  bool _capturado;
  bool _visto;
  bool _favorito;
  int _energia;
  String? proximaEvolucao;
  int nivelEvolucao;

  Pokemon({
    required this.numero,
    required String nome,
    required this.tipo,
    required int nivel,
    required int hpAtual,
    required int hpMaximo,
    bool capturado = false,
    this.proximaEvolucao,
    this.nivelEvolucao = 0,
    int energia = 100,
  })  : _nome = nome,
        _nivel = nivel.clamp(1, 100),
        _hpMaximo = hpMaximo > 0 ? hpMaximo : 1,
        _hpAtual = 0,
        _capturado = capturado,
        _visto = capturado,
        _favorito = false,
        _energia = energia {
    _hpAtual = hpAtual.clamp(0, _hpMaximo);
  }

  // Getters
  String get nome => _nome;
  int get nivel => _nivel;
  int get hpAtual => _hpAtual;
  int get hpMaximo => _hpMaximo;
  bool get capturado => _capturado;
  bool get visto => _visto;
  bool get favorito => _favorito;
  int get energia => _energia;

  // Questão 2: Encapsulamento e validação
  void subirNivel(int quantidade) {
    if (quantidade <= 0) {
      print('  ⚠ Valor inválido. A quantidade deve ser positiva.');
      return;
    }
    _nivel = (_nivel + quantidade).clamp(1, 100);
    print('  ✔ $_nome subiu para o nível $_nivel.');
  }

  void receberDano(int dano) {
    if (dano <= 0) {
      print('  ⚠ Valor de dano inválido.');
      return;
    }
    _hpAtual = (_hpAtual - dano).clamp(0, _hpMaximo);
    print('  ✔ $_nome recebeu $dano de dano. HP: $_hpAtual/$_hpMaximo');
    if (_hpAtual == 0) {
      print('  💀 $_nome foi derrotado!');
    }
  }

  void curar(int valor) {
    if (valor <= 0) {
      print('  ⚠ Valor de cura inválido.');
      return;
    }
    _hpAtual = (_hpAtual + valor).clamp(0, _hpMaximo);
    print('  ✔ $_nome foi curado. HP: $_hpAtual/$_hpMaximo');
  }

  // Questão 3: Evolução
  void evoluir() {
    if (proximaEvolucao == null) {
      print('  ⚠ $_nome não possui evolução disponível.');
      return;
    }
    if (_nivel < nivelEvolucao) {
      print('  ⚠ $_nome precisa estar no nível $nivelEvolucao para evoluir (atual: $_nivel).');
      return;
    }
    String nomeAnterior = _nome;
    _nome = proximaEvolucao!;
    proximaEvolucao = null;
    _hpMaximo += 20;
    _hpAtual = _hpMaximo;
    print('  ✔ $nomeAnterior evoluiu para $_nome! HP Máximo: $_hpMaximo');
  }

  // Questão 6: Ataque base (classe pai)
  int calcularAtaqueBase() => _nivel * 2;

  // Energia
  void gastarEnergia(int custo) {
    _energia = (_energia - custo).clamp(0, 999);
  }

  void restaurarEnergia(int valor) {
    _energia = (_energia + valor).clamp(0, 999);
  }

  // Questão 1: Exibir ficha
  void exibirFicha() {
    print('  ┌─────────────────────────────────');
    print('  │ #$numero - $_nome');
    print('  │ Tipo: $tipo');
    print('  │ Nível: $_nivel');
    print('  │ HP: $_hpAtual/$_hpMaximo');
    print('  │ Energia: $_energia');
    print('  │ Capturado: ${_capturado ? "Sim" : "Não"}');
    print('  │ Visto: ${_visto ? "Sim" : "Não"}');
    print('  │ Favorito: ${_favorito ? "★" : "Não"}');
    if (proximaEvolucao != null) {
      print('  │ Próxima evolução: $proximaEvolucao (nível $nivelEvolucao)');
    }
    print('  └─────────────────────────────────');
  }

  // Questão 9: Implementação da interface
  @override
  void marcarComoVisto() {
    _visto = true;
    print('  ✔ $_nome foi marcado como visto.');
  }

  @override
  void marcarComoCapturado() {
    _capturado = true;
    _visto = true;
    print('  ✔ $_nome foi capturado (e marcado como visto automaticamente).');
  }

  @override
  void favoritar() {
    if (!_capturado) {
      print('  ⚠ $_nome precisa ser capturado antes de ser favoritado.');
      return;
    }
    _favorito = true;
    print('  ★ $_nome foi favoritado!');
  }

  @override
  void desfavoritar() {
    _favorito = false;
    print('  ✔ $_nome foi desfavoritado.');
  }

  @override
  String toString() => '#$numero $_nome (Lv.$_nivel)';
}
