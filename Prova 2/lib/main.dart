// Prova Programaçao Mobile 2.1
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // qual aba ta selecionada na barra de baixo
  int indiceAtual = 0;

  // todos os carros que vao aparecer na lista
  final List<Map<String, String>> carros = [
    { "nome": "HYUNDAI CRETA",
     "versao": "1.6 TGDI FLEX N LINE DCT",
      "ano": "2026/2027", 
     "km": "0 Km", 
     "cor": "Branco",
      "local": "Cianorte - PR",
     "tipo": "Loja",
     "preco": "R\$ 206.990",
      "imagem": "https://dealersites-content.s3.us-east-1.amazonaws.com/dealersites/vehicles/versions/hyundai/foto890_44812.webp" },

    { "nome": "TOYOTA COROLLA",
     "versao": "2.0 XEI CVT FLEX",
      "ano": "2024/2025", "km":
     "15.000 Km", "cor": "Prata",
      "local": "Curitiba - PR", 
     "tipo": "Loja",
     "preco": "R\$ 158.900",
      "imagem": "https://upload.wikimedia.org/wikipedia/commons/f/f6/Toyota_Corolla_Limousine_Hybrid_Genf_2019_1Y7A5576.jpg" },

    { "nome": "HONDA CIVIC",
     "versao": "2.0 TOURING CVT",
      "ano": "2023/2024", 
     "km": "32.500 Km", 
     "cor": "Preto",
      "local": "Maringá - PR", 
     "tipo": "Particular",
     "preco": "R\$ 142.500",
      "imagem": "https://revistacarro.com.br/wp-content/uploads/2019/11/Honda-Civic-EXL-1.jpg" },

    { "nome": "VOLKSWAGEN T-CROSS",
     "versao": "1.4 TSI HIGHLINE",
      "ano": "2025/2026",
     "km": "5.200 Km", 
     "cor": "Preto",
      "local": "Londrina - PR", 
     "tipo": "Loja", 
     "preco": "R\$ 189.990",
      "imagem": "https://upload.wikimedia.org/wikipedia/commons/8/80/Volkswagen_T-Cross_%282023%29_1X7A1967.jpg" },

    { "nome": "JEEP COMPASS", 
     "versao": "2.0 LONGITUDE AT9 DIESEL",
      "ano": "2022/2023", 
     "km": "48.300 Km", 
     "cor": "Cinza",
      "local": "Cascavel - PR", 
     "tipo": "Particular", 
     "preco": "R\$ 175.000",
      "imagem": "https://cdn.dealerspace.ai/saga/compass.jpg" },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      // barra de cima
      appBar: AppBar(
        backgroundColor: Colors.white, elevation: 1,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text("Pesquisa", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          // menu com os 3 botoes
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Row(children: [Icon(Icons.grid_view), SizedBox(width: 5), Text("Exibir")]),
                Row(children: [Icon(Icons.swap_vert), SizedBox(width: 5), Text("Ordenar")]),
                Row(children: [Icon(Icons.tune), SizedBox(width: 5), Text("Filtrar")]),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // filtro de pais
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Chip(
                label: const Text("Brasil"),
                backgroundColor: Colors.black87,
                labelStyle: const TextStyle(color: Colors.white)),
          ),

          const SizedBox(height: 10),

          // contador (por enquanto fixo)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("407.288 carros encontrados", style: TextStyle(fontSize: 16)),
          ),

            const SizedBox(height: 10),

            // roda a lista e cria um card pra cada carro
            ...carros.map((c) => buildCar(c)),
          ],
        ),
      ),

      // navegacao de baixo
      bottomNavigationBar: BottomNavigationBar(
        // sem o fixed os icones somem quando tem mais de 3 itens
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey[700],
        currentIndex: indiceAtual,
        onTap: (i) => setState(() => indiceAtual = i),
        items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoritos"),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: "Serviços"),
           BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ],
      ),
    );
  }

  // monta o card do carro
  Widget buildCar(Map<String, String> carro) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // imagem + os dois botoes sobrepostos
            Stack(children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    carro["imagem"]!,
                    height: 180, width: double.infinity, fit: BoxFit.cover,
                    // caso a imagem nao carregue
                    errorBuilder: (_, __, ___) => Container(
                      height: 180, color: Colors.grey[300],
                      child: const Icon(Icons.directions_car, size: 60, color: Colors.grey),
                    ),
                  ),
                ),

                // botao da esquerda (comparar)
                const Positioned(left: 10, top: 10,
                  child: CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: Icon(Icons.crop_square, color: Colors.white))),

                // botao de favoritar
                const Positioned(right: 10, top: 10,
                  child: CircleAvatar(
                   backgroundColor: Colors.black54,
                    child: Icon(Icons.favorite_border, color: Colors.white),
                  ),
                ),
              ],
            ),

            // parte com as infos
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // titulo
                  Text(carro["nome"]!,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(carro["versao"]!),
                  const SizedBox(height: 8),

                  // linha do ano e km
                  Row(children: [
                    const Icon(Icons.calendar_today, size: 16),
                      const SizedBox(width: 5),
                  Text(carro["ano"]!),
                     const SizedBox(width: 10),
                    const Icon(Icons.speed, size: 16), const SizedBox(width: 5),
                    Text(carro["km"]!),
                  ]),

                  const SizedBox(height: 5),

                  // cor e cidade
                  Row(children: [
                    const Icon(Icons.palette, size: 16), const SizedBox(width: 5),
                    Text(carro["cor"]!),
                    const SizedBox(width: 10),
                    const Icon(Icons.location_on, size: 16),
                    const SizedBox(width: 5),
                    Text(carro["local"]!),
                  ]),

                  const SizedBox(height: 5),
                  Text(carro["tipo"]!),
                  const SizedBox(height: 10),

                  // preco em destaque
                  Text(carro["preco"]!,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}