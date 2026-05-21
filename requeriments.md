# Documento de Requisitos — Aplicativo Mobile E-commerce

## Projeto

Aplicativo mobile de e-commerce desenvolvido em Flutter, consumindo APIs próprias baseadas em microserviços.

---

# Objetivo do Aplicativo

Permitir que usuários naveguem, pesquisem, favoritem, avaliem e adicionem produtos ao carrinho através de um aplicativo mobile moderno, performático e escalável.

---

# Plataforma

- Android
- iOS

---

# Tecnologias Principais

- Flutter
- Bloc
- Dio
- GoRouter
- Isar

---

# Escopo do Aplicativo

O aplicativo possuirá os seguintes módulos:

- Autenticação
- Perfil do usuário
- Produtos
- Favoritos
- Carrinho
- Avaliações

---

# REQUISITOS FUNCIONAIS

# 1. Splash e Inicialização

## RF001 — Splash Screen

O aplicativo deve exibir uma tela de carregamento ao iniciar.

---

## RF002 — Verificação de sessão

O aplicativo deve verificar automaticamente se existe sessão autenticada válida.

---

## RF003 — Redirecionamento automático

O aplicativo deve redirecionar o usuário:

- para Home, caso autenticado
- para Login, caso não autenticado

---

# 2. Autenticação

## RF004 — Cadastro de usuário

O aplicativo deve permitir cadastro utilizando:

- nome
- username
- email
- senha
- telefone

---

## RF005 — Login com email e senha

O aplicativo deve permitir autenticação utilizando email e senha.

---

## RF006 — Login com Google

O aplicativo deve permitir autenticação via Google.

---

## RF007 — Recuperação de senha

O aplicativo deve permitir solicitar recuperação de senha por email.

---

## RF008 — Redefinição de senha

O aplicativo deve permitir redefinir senha utilizando token válido.

---

## RF009 — Logout

O aplicativo deve permitir encerrar sessão do usuário.

---

# 3. Home

## RF010 — Exibição de produtos

O aplicativo deve exibir produtos na tela inicial separados por categorias.

---

## RF011 — Atualização dinâmica

A lista de produtos deve ser atualizada dinamicamente ao rolar a tela.

---

## RF012 — Navegação para detalhes

O aplicativo deve permitir acessar detalhes do produto ao selecionar um item.

---

# 4. Produtos

## RF013 — Visualização de detalhes

O aplicativo deve exibir:

- nome
- descrição
- overview
- preço
- imagens
- estoque
- avaliações

---

## RF014 — Galeria de imagens

O aplicativo deve permitir navegação entre imagens do produto.

---

## RF015 — Busca de produtos

O aplicativo deve permitir pesquisar produtos por texto.

---

## RF016 — Filtragem de produtos

O aplicativo deve permitir filtrar produtos por:

- preço
- categoria
- avaliação
- disponibilidade

---

## RF017 — Ordenação de produtos

O aplicativo deve permitir ordenar produtos por:

- relevância
- preço
- popularidade
- avaliação

---

## RF018 — Paginação infinita

O aplicativo deve carregar produtos continuamente durante o scroll.

---

# 5. Favoritos

## RF019 — Favoritar produto

O aplicativo deve permitir adicionar produtos aos favoritos.

---

## RF020 — Remover favorito

O aplicativo deve permitir remover produtos dos favoritos.

---

## RF021 — Listagem de favoritos

O aplicativo deve permitir visualizar lista de produtos favoritados.

---

# 6. Carrinho

## RF022 — Adicionar ao carrinho

O aplicativo deve permitir adicionar produtos ao carrinho.

---

## RF023 — Atualizar quantidade

O aplicativo deve permitir alterar quantidade de itens no carrinho.

---

## RF024 — Remover item

O aplicativo deve permitir remover itens do carrinho.

---

## RF025 — Persistência do carrinho

O aplicativo deve manter itens do carrinho salvos localmente.

---

## RF026 — Resumo do carrinho

O aplicativo deve exibir:

- subtotal
- quantidade de itens
- total final

---

# 7. Avaliações

## RF027 — Criar avaliação

O aplicativo deve permitir avaliar produtos.

---

## RF028 — Editar avaliação

O aplicativo deve permitir editar avaliações próprias.

---

## RF029 — Excluir avaliação

O aplicativo deve permitir excluir avaliações próprias.

---

## RF030 — Listagem de avaliações

O aplicativo deve exibir avaliações vinculadas ao produto.

---

# 8. Perfil

## RF031 — Visualização de perfil

O aplicativo deve exibir dados do usuário autenticado.

---

## RF032 — Atualização de perfil

O aplicativo deve permitir atualizar:

- nome
- username
- avatar
- email

---

## RF033 — Alteração de senha

O aplicativo deve permitir alterar senha autenticado.

---

## RF034 — Exclusão de conta

O aplicativo deve permitir exclusão da conta do usuário.

---

# 9. Sessão

## RF035 — Renovação automática de token

O aplicativo deve renovar automaticamente o token de acesso.

---

## RF036 — Persistência de autenticação

O aplicativo deve manter usuário autenticado entre reinicializações.

---

## RF037 — Expiração de sessão

O aplicativo deve redirecionar usuário para login após expiração da sessão.

---

# 10. Interface

## RF038 — Feedback visual

O aplicativo deve exibir estados:

- carregando
- erro
- sucesso
- vazio

---

## RF039 — Atualização reativa

A interface deve atualizar automaticamente após mudanças de estado.

---

## RF040 — Navegação fluida

O aplicativo deve possuir transições e navegação fluídas.

---

# REQUISITOS NÃO FUNCIONAIS

# 1. Arquitetura

## RNF001 — Arquitetura modular

O aplicativo deve utilizar arquitetura baseada em módulos/feature-first.

---

## RNF002 — Separação de responsabilidades

O aplicativo deve possuir separação entre:

- presentation
- domain
- infrastructure

---

## RNF003 — Gerenciamento de estado

O aplicativo deve utilizar Bloc para gerenciamento de estado.

---

# 2. Segurança

## RNF004 — HTTPS obrigatório

Toda comunicação deve utilizar HTTPS.

---

## RNF005 — Armazenamento seguro

Tokens devem ser armazenados em armazenamento seguro do dispositivo.

---

## RNF006 — Renovação segura de sessão

O aplicativo deve implementar refresh token automático.

---

# 3. Performance

## RNF007 — Carregamento eficiente

As listas devem utilizar paginação e lazy loading.

---

## RNF008 — Cache local

O aplicativo deve implementar cache local de dados.

---

## RNF009 — Baixo consumo de memória

O aplicativo deve evitar carregamento excessivo de dados simultaneamente.

---

# 4. Escalabilidade

## RNF010 — Estrutura expansível

O aplicativo deve permitir inclusão de novos módulos sem grande refatoração.

---

## RNF011 — Componentização

Widgets devem ser reutilizáveis.

---

# 5. Compatibilidade

## RNF012 — Android

Compatível com Android 8+.

---

## RNF013 — iOS

Compatível com iOS 13+.

---

# 6. Qualidade

## RNF014 — Tratamento de erros

O aplicativo deve tratar:

- erros de rede
- erros de autenticação
- timeout
- falhas de servidor

---

## RNF015 — Logs

O aplicativo deve possuir logs para debugging.

---

## RNF016 — Testabilidade

O aplicativo deve suportar testes unitários e integração.

---

# 7. Persistência

## RNF017 — Persistência local

O aplicativo deve persistir:

- sessão
- favoritos
- carrinho
- cache básico

---

## RNF018 — Offline parcial

O aplicativo deve permitir visualização de dados previamente carregados sem internet.

---

# 8. DevOps

## RNF019 — Ambientes separados

O aplicativo deve possuir:

- development
- staging
- production

---

## RNF020 — Configuração por ambiente

URLs e chaves devem ser configuráveis por ambiente.

---

# Módulos do Aplicativo

| Módulo | Responsabilidade |
|---|---|
| Auth | Login, cadastro, sessão |
| Users | Perfil do usuário |
| Products | Catálogo e detalhes |
| Favorites | Favoritos |
| Cart | Carrinho |
| Reviews | Avaliações |

---

# Estrutura Recomendada do Projeto

```txt
lib/
├── core/
├── shared/
├── modules/
│   ├── auth/
│   ├── users/
│   ├── products/
│   ├── cart/
│   ├── favorites/
│   └── reviews/
├── app/
└── main.dart
```

---

# Estrutura Arquitetural

```txt
presentation/
domain/
infrastructure/
```

---

# Gerenciamento de Estado

## Bloc

Utilizar:

- Bloc para fluxos complexos
- Cubit para estados simples

---

# Navegação

Utilizar:

- GoRouter

---

# Comunicação HTTP

Utilizar:

- Dio

Com:

- interceptors
- refresh token
- retry
- logging

---

# Persistência Local

Utilizar:

- Isar
- Flutter Secure Storage

---

# Estratégia Scrum Recomendada

## Épicos

- Autenticação
- Produtos
- Carrinho
- Favoritos
- Perfil
- Avaliações

---

# Sprint 0

## Objetivo

Preparação da base do projeto.

### Itens

- setup Flutter
- setup Bloc
- setup Dio
- setup GoRouter
- setup arquitetura
- setup environments
- setup CI/CD
- setup tema/design system
- setup interceptors
- setup auth base