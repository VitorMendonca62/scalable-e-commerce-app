# scalable_e_commerce_app

Aplicativo de e-commerce desenvolvido com Flutter e uma API própria baseada em microserviços.

O projeto está sendo estruturado para consumir uma arquitetura de backend dividida em serviços, com foco em separação clara de responsabilidades, escalabilidade e facilidade de evolução.

## Sobre o projeto

A proposta deste app é funcionar como a camada mobile de um e-commerce completo. Hoje a estratégia do backend está organizada em três microserviços principais:

- Auth: autenticação tradicional e com Google, recuperação de senha, atualização de senha e renovação de token.
- Users: cadastro, consulta, atualização e exclusão de usuários.
- Products: núcleo do negócio, com catálogo, carrinho, favoritos, avaliações e, futuramente, perguntas sobre produtos.

O front-end em Flutter deve acompanhar essa divisão, mantendo uma base modular e preparada para crescer por domínio de negócio.

## Arquitetura de pastas

A organização atual do projeto foi pensada para separar responsabilidades por camada e por módulo.

```text
lib/
├── main.dart
├── app/
│   ├── app.dart
│   ├── bindings/
│   └── routes/
├── core/
│   ├── config/
│   ├── constants/
│   ├── errors/
│   ├── network/
│   │   ├── api_client.dart
│   │   ├── dio_factory.dart
│   │   ├── endpoints.dart
│   │   └── interceptors/
│   ├── storage/
│   ├── theme/
│   │   ├── app_theme.dart
│   │   ├── colors.dart
│   │   ├── spacing.dart
│   │   └── typography.dart
│   ├── utils/
│   └── widgets/
├── modules/
│   ├── auth/
│   │   ├── auth_module.dart
│   │   ├── di/
│   │   ├── domain/
│   │   ├── infrastructure/
│   │   └── presentation/
│   ├── users/
│   │   ├── users_module.dart
│   │   ├── di/
│   │   ├── domain/
│   │   ├── infrastructure/
│   │   └── presentation/
│   ├── products/
│   │   ├── products_module.dart
│   │   ├── di/
│   │   ├── domain/
│   │   ├── infrastructure/
│   │   └── presentation/
│   ├── cart/
│   ├── favorites/
│   └── reviews/
└── shared/
	├── extensions/
	├── helpers/
	├── mixins/
	└── widgets/
```

### Responsabilidade de cada pasta

- app: ponto de entrada da aplicação, configuração global, rotas e injeção inicial.
- core: recursos compartilhados por todo o projeto, como networking, tema, armazenamento, erros e utilitários.
- modules: módulos por funcionalidade ou domínio, seguindo uma estrutura pronta para crescer em camadas.
- shared: componentes reutilizáveis entre diferentes módulos.

### Organização por módulo

Cada módulo principal pode seguir essa divisão interna:

- domain: entidades, contratos e regras de negócio.
- infrastructure: implementações concretas, datasources, repositories e integração com API.
- presentation: telas, controllers, estados e componentes específicos da feature.
- di: injeção de dependência do módulo.

## Como iniciar o projeto

### Pré-requisitos

- Flutter 3.35.0 stable
- Dart 3.9.0
- Android Studio, VS Code ou outro editor com suporte a Flutter
- Emulador Android, simulador iOS ou dispositivo físico

### Passos

1. Instale as dependências do projeto.

```bash
flutter pub get
```

2. Verifique o ambiente Flutter.

```bash
flutter doctor
```

3. Execute o aplicativo.

```bash
flutter run
```

4. Se precisar formatar o código.

```bash
dart format .
```

5. Para análise estática.

```bash
flutter analyze
```

## Versão do Flutter

O ambiente atual do projeto está usando:

- Flutter 3.35.0 stable
- Dart 3.9.0

O arquivo `pubspec.yaml` também declara compatibilidade com `sdk: ^3.9.0`.

## Principais bibliotecas escolhidas

As dependências base atuais do projeto são:

TODO: ADicioanr Bloc, dio e outros
- flutter: SDK principal do aplicativo.
- cupertino_icons: ícones no estilo iOS.
- flutter_lints: conjunto de regras para manter qualidade e consistência no código.

Bibliotecas adicionais podem ser incorporadas conforme os módulos forem evoluindo, principalmente para autenticação, consumo de API, estado e persistência local.

## Contribuição

Se quiser colaborar, siga este fluxo:

1. Crie uma branch a partir da main.
2. Faça as mudanças no módulo ou camada correspondente.
3. Rode `flutter analyze` e, quando aplicável, testes automatizados.
4. Verifique formatação com `dart format .`.
5. Abra um pull request com descrição objetiva do que foi alterado.

### Boas práticas

- Mantenha os módulos isolados por domínio.
- Prefira reutilizar componentes de `core` e `shared` antes de duplicar código.
- Evite acoplamento entre features.
- Centralize regras de rede, erro e tema em `core`.

## Próximos passos sugeridos

- Integrar os contratos reais da API em microserviços.
- Definir a estratégia de gerenciamento de estado.
- Implementar a camada de autenticação com refresh token.
- Estruturar as telas iniciais de login, catálogo e detalhes de produto.

## Observação

Este README pode ser refinado à medida que os artefatos das APIs forem entregues. Se você quiser, eu também posso adaptar este documento para incluir endpoints, fluxos de autenticação, convenções de resposta e um diagrama da arquitetura.
