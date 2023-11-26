# App Filmes GETX

Este é um aplicativo de filmes desenvolvido com Flutter e GetX. Ele permite que você veja os filmes mais populares, os mais bem avaliados, os que estão em cartaz e os que estão chegando em breve. Você também pode pesquisar filmes por nome, ver os detalhes de cada filme, como sinopse, elenco, gênero, duração, etc., e adicionar os filmes aos seus favoritos.

## Funcionalidades

- Tela inicial com quatro categorias de filmes: populares, mais bem avaliados, em cartaz e chegando em breve.
- Tela de pesquisa de filmes por nome, com sugestões e resultados.
- Tela de detalhes de cada filme, com informações como sinopse, elenco, gênero, duração, etc.
- Tela de favoritos, onde você pode ver os filmes que você adicionou aos seus favoritos e removê-los se quiser.
- Navegação entre as telas usando a barra inferior.
- Tema escuro e claro, que pode ser alternado pelo botão no canto superior direito.
- Uso do GetX para gerenciamento de estado, injeção de dependência, navegação e internacionalização.

## Tecnologias utilizadas

- Flutter: um framework de código aberto para desenvolver aplicativos móveis nativos para Android e iOS.
- GetX: um framework de produtividade para Flutter que oferece recursos como gerenciamento de estado, injeção de dependência, navegação, internacionalização, etc.
- TMDB API: uma API que fornece dados sobre filmes, séries, atores, etc.

## Como instalar e executar

Para instalar e executar este aplicativo, você precisa ter o Flutter e o Android Studio instalados no seu computador. Você também precisa de uma chave de API do TMDB, que você pode obter [aqui](https://developer.themoviedb.org/docs). Depois, siga os passos abaixo:

- Clone este repositório para o seu computador usando o comando `git clone https://github.com/JBSilvaDev/App-Filmes-GETX.git`.
- Abra o projeto no Android Studio e aguarde a sincronização do Gradle.
- Crie um arquivo chamado `api_constants.dart` na pasta `lib/application/rest_client/` e adicione o seguinte código:

```dart
class ApiConstants {
  static const String API_KEY = 'SUA_CHAVE_DE_API_AQUI';
  static const String BASE_URL = 'https://api.themoviedb.org/3';
  static const String BASE_IMAGE_URL = 'https://image.tmdb.org/t/p/w500';
}
```

- Substitua `SUA_CHAVE_DE_API_AQUI` pela sua chave de API do TMDB.
- Conecte o seu dispositivo Android ou inicie um emulador.
- Execute o aplicativo usando o botão de play no Android Studio ou o comando `flutter run` no terminal.


## Referências

- [Flutter](https://flutter.dev/)
- [GetX](https://pub.dev/packages/get)
- [TMDB API](https://developer.themoviedb.org/docs)