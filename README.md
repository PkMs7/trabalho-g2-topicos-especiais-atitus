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

