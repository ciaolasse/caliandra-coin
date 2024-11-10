# Caliandra (CLD) - ERC20 Token

## Descrição
Caliandra (CLD) é uma criptomoeda desenvolvida no padrão ERC20, utilizando a blockchain Ethereum. Este projeto visa criar um token fungível que pode ser transferido, aprovado e utilizado em diversas aplicações descentralizadas (dApps).

## Funcionalidades

- **Nome**: Caliandra
- **Símbolo**: CLD
- **Decimais**: 18
- **Suprimento Total**: 100 CLD

## Interface ERC20
O contrato implementa a interface padrão ERC20, que inclui as seguintes funções:

- `totalSupply()`: Retorna o suprimento total de tokens.
- `balanceOf(address account)`: Retorna o saldo de tokens de um endereço específico.
- `allowance(address owner, address spender)`: Retorna a quantidade de tokens que um proprietário permitiu a um gastador.
- `transfer(address recipient, uint256 amount)`: Transfere uma quantidade específica de tokens para um destinatário.
- `approve(address spender, uint256 amount)`: Aprova um gastador para gastar uma quantidade específica de tokens em nome do proprietário.
- `transferFrom(address sender, address recipient, uint256 amount)`: Transfere tokens de um endereço para outro usando a permissão aprovada.

## Eventos
O contrato emite os seguintes eventos para facilitar a rastreabilidade das transações:

- `Transfer(address indexed from, address indexed to, uint256 value)`: Emitido quando tokens são transferidos.
- `Approval(address indexed owner, address indexed spender, uint256 value)`: Emitido quando uma aprovação é concedida.

## Implementação
A implementação do contrato inclui:

- **Mapeamentos**: Para armazenar saldos de tokens e permissões de gasto.
- **Construtor**: Inicializa o contrato com o suprimento total de tokens atribuído ao criador do contrato.
- **Funções**: Para gerenciar transferências, aprovações e consultas de saldo.

## Exemplo de Uso

### Transferência de Tokens
- `transfer(address recipient, uint256 amount)`

Transfere tokens do remetente para o destinatário.

### Aprovação de Gastador
- `approve(address spender, uint256 amount)`

Aprova um gastador para gastar tokens em nome do proprietário.

### Transferência de Tokens Aprovados
- `transferFrom(address sender, address recipient, uint256 amount)`

Transfere tokens de um endereço para outro usando a permissão aprovada.

## Licença
Este projeto está licenciado sob a licença MIT.
