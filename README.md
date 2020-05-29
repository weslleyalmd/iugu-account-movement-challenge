# Desafio de Movimentação de Contas

## Como executar o projeto
1. Baixar o código desse repositório
2. Executar o bundle install na raiz do projeto
3. Para processar as transações, executar o seguinte comando:
```
ruby process_transactions.rb path_to_account_file.csv path_to_transaction_file.csv
```

## Objetivo
Desenvolver uma aplicação em linha de comando, em Ruby, que calcule o balanço da conta corrente dos clientes.

## Execução
A aplicação deve receber dois parâmetros na linha de comando: o nome do arquivo de contas e o nome do arquivo de transações. Ex: ./contas.csv transacoes.csv

## Entrada
Os arquivos de entrada devem estar em formato CSV, sem cabeçalho, sem aspas e com campos delimitados por vírgula.

## Conteúdo dos arquivos
### Contas:
- Número da conta (inteiro)
- Saldo inicial da conta, em centavos de real (inteiro) Exemplo: 123,13052 (Conta: 123, Saldo Inicial: R$ 130,52)

### Transações:
- Número da conta (inteiro)
- Valor da transação, em centavos de real (inteiro) Uma transação com valor negativo é um débito na conta e uma transação com valor positivo é um depósito na conta. Exemplo: 123,-5300 (Débito de R$ 53,00 na conta 123) Exemplo: 123,350000 (Depósito de R$ 3.500,00 na conta 123)

## Cálculo do Saldo
O saldo da conta deve ser calculado a partir do saldo inicial, aplicando cada uma das transações relacionadas a esta conta. Os débitos devem reduzir o saldo da conta e depósitos devem aumentar o saldo da conta, na medida do valor da transação. Uma conta pode assumir um valor negativo e não existe limite inferior para o saldo da conta. Entretanto, cada transação de débito que termina deixando o saldo da conta negativo implica uma multa de R$ 3,00 a ser descontada imediatamente. Esta multa é aplicada independentemente da conta estar ou não com saldo negativo antes da transação, porém se a transação for um depósito a multa não se aplica. As transações devem ser processadas na ordem em que são apresentadas no arquivo de entrada. Exemplo:

- Criação da conta:
  - Saldo inicial da conta 123: R$ 100,00;
- Primeira movimentação:
  - Débito de R$ 103,00 da conta 123;
  - Saldo atual da conta 123: R$ -6,00 (R$ 3,00 de multa aplicado);
- Segunda movimentação:
  - Débito de R$ 10,00 da conta 123;
  - Saldo atual da conta 123: R$ -19,00 (R$ 3,00 de multa aplicado);

## Saída
A saída deve ser exibida na tela (stdout). Deve ser uma lista de todas as contas no seguinte formato por linha:

- ID da conta (int);
- Saldo final da conta, em centavos de real (numérico). Ex: 123,37742 (Saldo final de R$ 377,42 na conta 123)
