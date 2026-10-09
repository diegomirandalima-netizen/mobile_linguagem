import 'package:flutter/material.dart'; // Importa o pacote oficial que contem os componentes visuais do Material Design

void main() { // Funcao principal que o sistema operacional procura para dar a partida no aplicativo
  runApp(const MeuReprodutorApp()); // Inicializa a arvore de widgets e renderiza a classe raiz na tela do aparelho
} // Fecha o escopo da funcao principal main

class MeuReprodutorApp extends StatelessWidget { // Declara uma classe para gerenciar a raiz do app sem controle de estado interno
  const MeuReprodutorApp({super.key}); // Construtor da classe que passa a chave identificadora para o widget pai

  @override // Indica que o metodo a seguir esta substituindo a implementacao padrao da classe herdada
  Widget build(BuildContext context) { // Metodo obrigatorio que constroi e retorna a interface grafica deste widget
    return MaterialApp( // Retorna o componente configurador que gerencia temas, rotas e navegacao global do app
      debugShowCheckedModeBanner: false, // Desativa a tarja vermelha com a palavra debug que fica no canto superior da tela
      theme: ThemeData.dark().copyWith( // Carrega as configuracoes nativas do tema escuro e permite modificar cores especificas
        scaffoldBackgroundColor: const Color(0xFF141414), // Define a cor de fundo padrao de todas as paginas como cinza quase preto
      ), // Fecha o bloco de customizacao do tema escuro
      home: const TelaPrincipal(), // Define que a classe TelaPrincipal sera a tela inicial carregada ao abrir o app
    ); // Fecha o construtor do componente MaterialApp
  } // Fecha o metodo de construcao build
} // Fecha a estrutura da classe MeuReprodutorApp

class TelaPrincipal extends StatefulWidget { // Declara uma tela que pode sofrer alteracoes visuais em tempo de execucao
  const TelaPrincipal({super.key}); // Construtor da classe com suporte a chaves de identificacao do Flutter

  @override // Avisa ao compilador que este metodo vai criar o estado customizado da tela
  State<TelaPrincipal> createState() => _TelaPrincipalState(); // Vincula esta classe ao seu gerenciador de estado privado
} // Fecha a estrutura da classe TelaPrincipal

class _TelaPrincipalState extends State<TelaPrincipal> { // Classe privada onde fica a logica de dados e reconstrucao da tela principal
  String abaAtiva = 'canais'; // Variavel de texto que monitora qual categoria esta selecionada no menu lateral

  // Cria um dicionario do tipo Map onde a chave e o nome da categoria e o valor e uma lista de produtos/midias
  final Map<String, List<Map<String, String>>> dadosDoServidor = {
    'canais': [ // Inicia a lista de mapas contendo os dados individuais de cada canal ao vivo disponivel
      {'nome': 'Globo HD', 'url': 'http://exemplo.com'}, // Primeiro canal estruturado com chaves de identificacao de texto
      {'nome': 'SBT', 'url': 'http://exemplo.com'}, // Segundo canal contendo seu nome de exibicao e o link de stream
      {'nome': 'ESPN Brasil', 'url': 'http://exemplo.com'} // Terceiro canal configurado no formato de chave e valor
    ], // Fecha a lista da categoria de canais
    'filmes': [ // Inicia a lista de mapas responsavel por armazenar o catalogo de filmes do aplicativo
      {'nome': 'Avatar 2', 'url': 'http://exemplo.com'}, // Salva o nome do filme e o link para reproducao do arquivo de video
      {'nome': 'Oppenheimer', 'url': 'http://exemplo.com'} // Configura o segundo filme com titulo e url de acesso
    ], // Fecha a lista da categoria de filmes
    'series': [ // Inicia a lista de mapas que contem as informacoes de series cadastradas no sistema
      {'nome': 'Breaking Bad', 'url': 'http://exemplo.com'}, // Define o nome da serie e o link do episodio para o player
      {'nome': 'The Boys', 'url': 'http://exemplo.com'} // Adiciona a segunda serie mapeando o titulo e a url correspondente
    ] // Fecha a lista da categoria de series
  }; // Fecha a declaracao do mapa de dados simulados do servidor

  void abrirPlayer(String nome, String url) { // Cria uma funcao que recebe o nome e a url para iniciar o reprodutor
    Navigator.push( // Aciona o gerenciador de telas para empilhar uma nova pagina por cima da atual
      context, // Informa o contexto visual atual para localizar a arvore de paginas do app
      MaterialPageRoute( // Cria uma rota padrao de transicao de tela de acordo com o sistema operacional
        builder: (context) => TelaPlayer(nomeDoVideo: nome, urlDoVideo: url), // Instancia a tela do player enviando os dados informados
      ), // Termina a configuracao da rota do MaterialPageRoute
    ); // Encerra a execucao do comando Navigator
  } // Fecha o escopo da funcao abrirPlayer

  @override // Sobreescreve o metodo de montagem visual para a tela que possui estado mutavel
  Widget build(BuildContext context) { // Monta o layout estruturado que divide a tela da TV ou celular
    return Scaffold( // Oferece uma estrutura de layout basica com suporte a barras, menus e corpos de pagina
      body: Row( // Organiza os elementos internos de forma horizontal (lado a lado na tela)
        children: [ // Lista de componentes que serao posicionados na sequencia horizontal
          Container( // Widget de caixa com propriedades de tamanho, cor, margem e espacamento
            width: 240, // Determina uma largura fixa de duzentos e quarenta pixels para a barra lateral
            color: const Color(0xFF1E1E1E), // Aplica uma cor cinza escura na caixa para destacar o menu do fundo
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20), // Aplica margem interna para afastar os botoes das bordas
            child: Column( // Organiza os itens de dentro da barra lateral de cima para baixo (verticalmente)
              crossAxisAlignment: CrossAxisAlignment.start, // Alinha todos os componentes filhos na extremidade esquerda da coluna
              children: [ // Lista de widgets que vao compor o menu de opcoes lateral
                const Text('IBO PLAYER', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.redAccent)), // Desenha a logo do app
                const SizedBox(height: 40), // Adiciona um bloco invisivel de quarenta pixels para dar espacamento vertical
                _botaoMenu('Canais Ao Vivo', Icons.tv, abaAtiva == 'canais', () => setState(() => abaAtiva = 'canais')), // Monta o botao de canais
                _botaoMenu('Filmes', Icons.movie_outlined, abaAtiva == 'filmes', () => setState(() => abaAtiva = 'filmes')), // Monta o botao de filmes
                _botaoMenu('Séries', Icons.theaters, abaAtiva == 'series', () => setState(() => abaAtiva = 'series')), // Monta o botao de series
              ], // Fecha a lista de filhos da coluna de botoes do menu lateral
            ), // Fecha a estrutura do widget Column do menu
          ), // Fecha a estrutura do widget Container do menu lateral
          Expanded( // Indica que este componente deve ocupar todo o espaco restante do lado direito da tela
            child: Padding( // Adiciona uma camada de espacamento em volta da area de exibicao do conteudo
              padding: const EdgeInsets.all(25.0), // Define vinte e cinco pixels de margem em todas as direcoes internas
              child: Column( // Organiza o titulo da aba e a grade de videos de forma vertical
                crossAxisAlignment: CrossAxisAlignment.start, // Alinha o titulo e a listagem na lateral esquerda da tela
                children: [ // Lista de componentes da regiao de exibicao de conteudo direita
                  Text(abaAtiva.toUpperCase(), style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)), // Titulo da categoria ativa
                  const SizedBox(height: 20), // Da um espaco de vinte pixels entre o texto do titulo e a grade de cards
                  Expanded( // Faz com que a grade preencha todo o espaco vertical restante na tela da TV
                    child: GridView.builder( // Construtor de grade dinamica que processa apenas os itens visiveis na tela
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( // Define as propriedades e limitacoes de layout da grade
                        crossAxisCount: 3, // Configura para exibir exatamente tres cards alinhados por linha na horizontal
                        crossAxisSpacing: 15, // Adiciona quinze pixels de espaco livre entre os cards na horizontal
                        mainAxisSpacing: 15, // Adiciona quinze pixels de espaco livre entre as linhas de cards na vertical
                        childAspectRatio: 16 / 9, // Define a proporcao de tamanho do card imitando o formato de telas widescreen
                      ), // Fecha a configuracao das propriedades de layout da grade
                      itemCount: dadosDoServidor[abaAtiva]?.length ?? 0, // Informa a quantidade de cards com base na lista ativa do servidor
                      itemBuilder: (context, index) { // Funcao executada para desenhar cada card de acordo com a sua posicao index
                        final item = dadosDoServidor[abaAtiva]![index]; // Extrai o mapa com os dados da midia na posicao atual da lista
                        return InkWell( // Adiciona um detector de toques e cliques com animacao visual sobre o card
                          onTap: () => abrirPlayer(item['nome']!, item['url']!), // Dispara a funcao de abrir o player enviando nome e url
                          child: Container( // Caixa visual que representa o card de cada filme, serie ou canal
                            decoration: BoxDecoration(color: const Color(0xFF262626), borderRadius: BorderRadius.circular(8)), // Cor e cantos arredondados
                            child: Center(child: Text(item['nome']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))), // Texto centralizado
                          ), // Fecha o widget Container do card individual
