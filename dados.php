<?php // Tag de abertura obrigatoria que avisa ao servidor para comecar a interpretar o codigo como linguagem PHP

// A funcao header envia uma configuracao limpa direto para o navegador ou aplicativo que fez a requisicao
// O parametro Access-Control-Allow-Origin com o simbolo de asterisco libera o mecanismo CORS
// Isso significa que qualquer aplicativo rodando em celular, TV ou computador pode ler este arquivo sem bloqueio de seguranca
header("Access-Control-Allow-Origin: *"); 

// Envia outro cabecalho de configuracao para quem solicitou os dados do servidor
// O parametro Content-Type define que o conteudo gerado por este script nao e uma pagina HTML comum com textos e imagens
// Ele avisa formalmente que o resultado entregue sera um bloco de dados puro estruturado no padrao universal JSON
header("Content-Type: application/json"); 

// Cria uma variavel chamada dadosDoApp usando o simbolo de cifrao para guardar as informacoes
// Abre um array associativo principal usando colchetes que vai funcionar como o banco de dados temporario do sistema
$dadosDoApp = [ 

    // Cria a primeira categoria chave dentro do array principal chamada canais
    // Esta chave guarda uma lista interna que armazena multiplos sub-arrays com os dados das transmissoes ao vivo
    "canais" => [ 
    
        // Cria o primeiro canal da lista definindo uma propriedade nome e associando um link de transmissao na propriedade url
        ["nome" => "Globo HD", "url" => "http://exemplo.com"], 
        
        // Cria o segundo canal da lista adicionando uma nova linha com os dados de nome e o endereco url correspondente
        ["nome" => "SBT", "url" => "http://exemplo.com"] 
        
    ], // Fecha a lista de arrays pertencentes a categoria de canais ao vivo com uma virgula para passar para a proxima chave

    // Cria a segunda categoria chave dentro do array principal dedicada exclusivamente para o catalogo de filmes
    "filmes" => [ 
    
        // Adiciona o primeiro filme na lista salvando o titulo do filme no campo nome e o link do arquivo de video na url
        ["nome" => "Avatar 2", "url" => "http://exemplo.com"], 
        
        // Adiciona o segundo filme na lista criando outro bloco estruturado com nome e a url do arquivo de video mp4 ou mkv
        ["nome" => "Oppenheimer", "url" => "http://exemplo.com"] 
        
    ], // Fecha a lista de arrays pertencentes a categoria de filmes colocando a virgula de continuacao

    // Cria a terceira categoria chave dentro do array principal dedicada para armazenar o catalogo de series do aplicativo
    "series" => [ 
    
        // Adiciona a primeira serie criando um bloco que contem o titulo da serie no nome e o link de acesso na url
        ["nome" => "Breaking Bad", "url" => "http://exemplo.com"] 
        
    ] // Fecha a lista de arrays pertencentes a categoria de series sem colocar virgula por ser o ultimo item

]; // Fecha o array associativo principal da variavel dadosDoApp e encerra a linha de comando com ponto e virgula

// O comando echo serve para imprimir ou exibir um resultado de texto diretamente na tela do servidor
// A funcao json_encode pega toda a estrutura complexa da variavel dadosDoApp e converte em uma unica linha de texto JSON
// Dessa forma o aplicativo em Flutter consegue ler o texto via internet, separar as categorias e exibir na interface da TV
echo json_encode($dadosDoApp); 

?> // Tag de fechamento opcional que indica o término do bloco de instrucoes do codigo PHP
