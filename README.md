# metricapes
Metricapes é uma ferramenta de linha de comando escrita em Python com o propósito de simplificar a coleta (e posterior análise) dos metadados de trabalhos de pós-graduação segundo obtidos por meio do [Catálogo de teses e dissertações da CAPES](https://catalogodeteses.capes.gov.br/catalogo-teses). Nos casos em que o link é fornecido, também acrescenta metadados adicionais sobre os trabalhos, obtidos pela plataforma [Sucupira](https://sucupira.capes.gov.br/).

## Dependências
Python, versão 3 (recomendável >= 3.10) e a biblioteca [HTTPX](https://www.python-httpx.org/), instalável via pip:
    pip install httpx

## Utilização
Utilize a opção `-h` para obter ajuda sobre a sintaxe de uso da ferramenta:

    metricapes -h

    usage: metricapes [-h] [-i INPUT] [-p] [-f FILTRO] [-d DESDE] [-a ATE] [-e] [-n PAGINA] [T ...]

    Consulta a base de trabalhos da CAPES, retornando os metadados dos trabalhos encontrados.

    argumentos posicionais:
      T                     Termos a buscar (na sintaxe aceita pela busca de teses da CAPES)

    opções:
      -h, --help            exibe este texto de ajuda e sai da aplicação.
      -i INPUT, --input INPUT
                            Lê os critérios de busca a partir do arquivo informado.
      -p                    Imprime os critérios de busca e sai da aplicação.
      -f FILTRO, --filtro FILTRO
                            Inclui um filtro compatível com a busca CAPES na forma <campo>:<valor>.
                            Utilizar aspas ao redor da expressão para campos ou valores compostos por mais de uma palavra.
                            Campos válidos:
                            - Ano
                            - Grau Acadêmico: Mestrado ou Doutorado
                            - Biblioteca
                            - Instituição
                            - Nome Programa
                            - Área Concentração
                            - Área Avaliação
                            - Área Conhecimento
                            - Grande Àrea Conhecimento
                            - Banca
                            - Orientador
                            - Autor
      -d DESDE, --desde DESDE
                            Retorna apenas trabalhos posteriores ao ano informado (inclusive).
      -a ATE, --ate ATE     Retorna apenas trabalhos anteriores ao ano informado (inclusive).
      -e, --estatisticas    Informa as estatísticas da busca e sai da aplicação.
      -n PAGINA, --pagina PAGINA
                            Coleta apenas os resultados da página indicada.

A fim de ilustrar uma sequência de utilização típica podemos buscar e obter os trabalhos relacionados a "mitocôndrias". Inicialmente, vamos investigar as estatísticas obtidas buscando apenas pelo próprio termo "mitocôndria".

    metricapes -e "mitocôndria"

Obs.: ceritifique-se que o terminal de comandos pode localizar o script "metricapes", fornecendo o caminho completo para o diretório one o mesmo se encontra ou incluindo-o na variável de ambiente PATH.

Para restringir os resultados, podemos optar por buscar apenas teses de doutorado escritas desde 2014:

    metricapes -e -d 2014 -f "Grau Acadêmico:Doutorado" "mitocôndria"

Podemos explorar a primeira página dos resultados para nos certificarmos de que são relevantes:

    metricapes -n 1 -d 2014 -f "Grau Acadêmico:Doutorado" "mitocôndria"
    
Uma vez satisfeitos, para obter a tabela completa dos resultados, indicamos um arquivo para salvar a saída do programa:

    metricapes -d 2014 -f "Grau Acadêmico:Doutorado" "mitocôndria" > resultados.tsv

Recomenda-se salvar os resultados com a extensáo tsv (TAB-separated values). Campos contendo quebras de linha serão delimitados por aspas.

Adicionalmente, explore o diretório "exemplos" para outros casos de uso (em breve).

