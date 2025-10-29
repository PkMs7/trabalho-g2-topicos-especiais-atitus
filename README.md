# 👨‍💻 Alunos  

| Nome |
| **Patrick Marques** 
| **Ricardo Kiess Marin** 
| **Pedro H. Fronza** 
| **Luiz Eduardo Treméa** 

---

# 🎬 CineApp – Catálogo de Filmes Populares  

Um aplicativo Flutter que consome a API do [The Movie Database (TMDb)](https://www.themoviedb.org/), exibindo uma lista de filmes populares com pôster, título e detalhes completos.  


# 🎬 CineApp – Catálogo de Filmes Populares

Um aplicativo Flutter que consome a API do [The Movie Database (TMDb)](https://www.themoviedb.org/), exibindo uma lista de filmes populares com pôster, título e detalhes completos.

---

## 🚀 Objetivo

Desenvolver um app moderno e funcional, aplicando **arquitetura MVVM**, **requisições HTTP**, **Provider** para gerenciamento de estado e **navegação entre telas**.

---

## 🧩 Funcionalidades Principais

- 🏠 **Tela inicial (Home):** Lista de filmes populares com imagem e título  
- 🎞 **Tela de detalhes:** Exibe sinopse, data de lançamento e avaliação  
- 🔄 **Carregamento visual:** Exibe `CircularProgressIndicator` durante o fetch  
- ⚠️ **Tratamento de erro:** Mensagem simples caso a API falhe  

---

## 🧠 Arquitetura MVVM Simplificada

| Camada | Função | Arquivo |
|--------|--------|---------|
| **Model** | Estrutura dos dados de filme | `movie.dart` |
| **Service** | Busca os dados na API (requisições HTTP) | `api_service.dart` |
| **ViewModel** | Controla o estado e fornece dados para a View | `movie_view_model.dart` |
| **View** | Telas e widgets do app | `home_page.dart`, `details_page.dart` |

---

## 🏗 Estrutura de Pastas

lib/
├── main.dart
├── models/
│ └── movie.dart
├── services/
│ └── api_service.dart
├── viewmodels/
│ └── movie_view_model.dart
└── views/
├── home_page.dart
└── details_page.dart



---

## 🌐 API Utilizada

- **Base:** [The Movie Database (TMDb)](https://developers.themoviedb.org/3)
- **Endpoint:**  
  `https://api.themoviedb.org/3/movie/popular?api_key=YOUR_API_KEY&language=pt-BR`
- **Imagem:**  
  `https://image.tmdb.org/t/p/w500/{poster_path}`
- **Campos usados:**  
  `title`, `overview`, `poster_path`, `vote_average`, `release_date`

---

## ⚙️ Dependências principais

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.0
  provider: ^6.1.0

🧠 Desenvolvido com

💙 Flutter • 🧩 MVVM • 🌍 TMDb API • ⚡ Provider

🌟 Dê uma estrela se curtiu o projeto!
