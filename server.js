// A funcao require busca e carrega dependencias dentro do ecossistema do Node.js
// Neste caso ela importa o pacote nativo http que serve para o computador conseguir escutar e responder requisicoes da internet
const http = require('http'); 

// Executa o metodo createServer que prepara uma estrutura de servidor web pronta para receber conexoes
// O metodo recebe uma funcao anonima com dois parametros essenciais chamados req que guarda os dados que estao chegando e res que gerencia o que sera devolvido
const server = http.createServer((req, res) => {

  // O metodo setHeader configura metadados invisiveis na resposta que ajudam o aplicativo a entender o formato do arquivo
  // O parametro Content-Type configurado como application/json avisa que o arquivo entregue nao e um site comum mas sim um bloco de dados estruturado em JSON
  res.setHeader('Content-Type', 'application/json');

  // Envia mais uma linha de configuracao de cabecalho muito importante para a seguranca do sistema de navegacao
  // O parametro Access-Control-Allow-Origin com o valor de asterisco remove barreiras e libera o acesso total via protocolo CORS
  // Isso garante que qualquer aplicativo feito em Flutter rodando em Smart TV ou celular consiga ler esses dados sem tomar bloqueios do sistema
  res.setHeader('Access-Control-Allow-Origin', '*');

  // Declara uma variavel constante chamada dadosDoApp usando chaves para criar um objeto javascript complexo que simula o banco de dados
  const dadosDoApp = {

    // Cria um vetor ou lista do tipo array chamado canais dedicado para listar todas as fontes de transmissao ao vivo do sistema
    "canais": [

      // Define o primeiro objeto do canal salvando o titulo de exibicao no campo nome e o link direto do fluxo de stream na propriedade url
      {"nome": "Globo HD", "url": "http://exemplo.com"},

      // Cria a segunda estrutura de canal na lista mapeando o respectivo nome da emissora e o seu respectivo endereco de internet m3u8
      {"nome": "SBT", "url": "http://exemplo.com"},

      // Adiciona o terceiro canal configurando mais um bloco de texto contendo os dados do canal de esportes para visualizacao no app
      {"nome": "ESPN Brasil", "url": "http://exemplo.com"}

    ], // Fecha a colecao de dados da lista de canais usando uma virgula para poder declarar a proxima categoria do objeto

    // Cria a segunda lista do tipo array chamada filmes feita exclusivamente para organizar as midias gravadas sob demanda do catalogo
    "filmes": [

      // Configura o primeiro filme salvando o titulo da obra no campo nome e o caminho do arquivo de video mp4 ou mkv na propriedade url
      {"nome": "Avatar 2", "url": "http://exemplo.com"},

      // Adiciona o segundo filme na lista estruturando o seu nome de identificacao e o link de acesso para o player rodar
      {"nome": "Oppenheimer", "url": "http://exemplo.com"}

    ], // Fecha a colecao de dados da categoria de filmes colocando a virgula para indicar que o objeto ainda nao acabou

    // Cria a terceira e ultima lista do tipo array chamada series para mapear os catalogos de seriados que serao enviados para o front-end
    "series": [

      // Insere a primeira serie cadastrada preenchendo o titulo da producao no nome e o link de rede do arquivo de midia na url
      {"nome": "Breaking Bad", "url": "http://exemplo.com"},

      // Adiciona a segunda serie estruturando o nome de exibicao e o endereco do servidor onde o arquivo de video esta armazenado
      {"nome": "The Boys", "url": "http://exemplo.com"}

    ] // Fecha a lista interna de series sem colocar virgula por se tratar do ultimo atributo do objeto principal

  }; // Fecha a montagem completa da variavel constante dadosDoApp colocando o ponto e virgula para encerrar a declaracao

  // O metodo res.end serve para finalizar o processo de atendimento da requisicao e enviar a resposta final de volta para o cliente
  // A funcao JSON.stringify transforma o objeto estruturado dadosDoApp em uma string ou texto corrido no formato universal JSON
  // Esse texto finalizado e disparado pela rede e viaja ate o aplicativo em Flutter que aguarda os dados para montar o menu da TV
  res.end(JSON.stringify(dadosDoApp));

}); // Fecha a funcao anonima de tratamento e encerra o bloco de criacao do servidor web createServer

// O metodo listen liga o servidor configurado e diz para o sistema operacional monitorar uma porta especifica da maquina
// O primeiro parametro indica que a porta sera a de numero 3000 e o segundo parametro executa uma funcao de aviso assim que o sistema ativar
server.listen(3000, () => {

  // O comando console.log imprime uma mensagem de texto simples diretamente no terminal ou prompt de comando do programador
  // Serve apenas como um indicador visual para confirmar que o script iniciou corretamente e esta pronto para receber acessos do app
  console.log("Servidor rodando com sucesso na porta 3000");

}); // Fecha a execucao do metodo listen de abertura da porta de rede do computador
