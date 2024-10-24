# CryptoMania - Acompanhe suas criptomoedas favoritas!

**CryptoMania** é um aplicativo iOS que permite acompanhar suas criptomoedas favoritas de forma simples e eficiente. Com ele, você pode visualizar as principais informações, como preço, variação e volume de negociação, tudo em **tempo real**!

## 📱 Demonstração

Aqui está uma prévia do aplicativo:

| <img src="https://i.imgur.com/vGpb0nL.png" alt="CryptoMania Preview" width="250"/> | <img src="https://i.imgur.com/QcojQjj.png" alt="CryptoMania Preview" width="250"/> | <img src="https://i.imgur.com/g0GseEW.png" alt="CryptoMania Preview" width="250"/> |


## 🚀 Funcionalidades

- **Lista de Criptomoedas**: Veja uma lista com as principais criptomoedas do mercado.
- **Dados em Tempo Real**: Acompanhe o preço, variação, volume e market cap das criptomoedas com dados atualizados da **CoinMarketCap API**.
- **Gráficos Interativos** *(em desenvolvimento)*: Visualize a variação de preço das criptomoedas ao longo do tempo.
- **Favoritos** *(em desenvolvimento)*: Salve suas criptomoedas favoritas para acesso rápido.

## 🛠 Tecnologias Utilizadas

- **Swift**: Linguagem de programação principal.
- **UIKit com View Code**: Para construção da interface do usuário sem uso de Storyboards.
- **URLSession**: Framework para realizar requisições de rede.
- **SDWebImage**: Biblioteca para carregamento e cache de imagens.
- **CoinMarketCap API**: API usada para obter dados das criptomoedas.
- **GraphView** *(em desenvolvimento)*: Biblioteca para plotagem de gráficos.

## 🏗 Arquitetura

O projeto utiliza o padrão **MVVM (Model-View-ViewModel)** para organização do código:

- **Model**: Representa os dados das criptomoedas.
- **View**: Exibe a interface do usuário e as informações das criptomoedas.
- **ViewModel**: Busca e processa os dados da API, fornecendo as informações para a View.

## 💾 Cache

O aplicativo utiliza o **URLCache** para armazenar as respostas da API em cache, reduzindo requisições desnecessárias e melhorando a performance.

## 📈 Próximos Passos

- Implementar a funcionalidade de favoritos.
- Adicionar gráficos interativos com variação de preço.
- Melhorar a interface do usuário.
- Adicionar testes unitários.
