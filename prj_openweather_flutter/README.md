# CLIMATEMPO - Previsão do Tempo

Construir aplicação mobile de previsão do tempo baseada no protótipo enviado a baixo, consumindo API externa passando como parâmetros para a mesma a latitude e longitude do dispositivo, após concluir a mesma, disponibilizá-la em repositório público no GitHub.

## Requisitos

- Utilizar Flutter como linguagem e MobX como gerenciador de estado.
- Utilizar padrão arquitetural MVVM.

## Links Úteis

- [Protótipo Figma](https://www.figma.com/file/rvAXxtddcGfYdKVOELt3Pt/Climatempo?type=design&node-id=1%3A5&mode=design&t=5MmdjpQX9BR2g1fT-1)
- [Documentação API](https://openweathermap.org/api/one-call-3)

## Dependências

As seguintes dependências são necessárias para o desenvolvimento da aplicação:

```yaml
dependencies:
  cupertino_icons: ^1.0.2
  http: ^1.0.0
  mobx: ^2.2.0
  flutter_mobx: ^2.0.6+5
  mobx_codegen: ^2.3.0
  build_runner: ^2.4.6
  intl: ^0.18.1
  geolocator: ^9.0.2
  geocoding: ^2.1.0
  permission_handler: ^10.4.3
```

## Arquitetura

A aplicação segue o padrão arquitetural MVVM (Model-View-ViewModel), garantindo uma separação clara de responsabilidades e facilitando a escalabilidade e manutenção do código.

## Como Utilizar

1. Clone o repositório para o seu ambiente local:

```console
git clone https://github.com/seu-usuario/climatempo.git
```

2. Instale as dependências do projeto:

```console
flutter pub get
```

3. Execute o gerador de código do pacote build_runner:

```console
dart run build_runner build
```

4. Crie uma conta no OpenWeatherMap e obtenha sua chave de acesso à API.

- [Open Weather Map](https://openweathermap.org/)

5. Substitua a chave de acesso à API no arquivo lib/models/weather_info.dart:

```js
const String apiKey = 'SUA_CHAVE_DE_ACESSO';
```

6. Selecione/emule o Android como o dispositivo utilizado.

É possível fazer isso por meio da extensão Android IOS Emulator ou programas como Genymotion.

- [Genymotion](https://www.genymotion.com/)

7. Execute a aplicação em seu dispositivo emulado:

```console
flutter run
```

## Emulador Android utilizado

Pixel_3a_API_34_extension_level_7_arm64-v8a (android-arm64 emulator) - cold boot

## CLIMATEMPO
<div>
<img alt="app" width="350px" height="600px" src="https://github.com/joaopauloaramuni/flutter/blob/main/prj_openweather_flutter/img/1.png"/>
<img alt="app" width="300px" height="600px" src="https://github.com/joaopauloaramuni/flutter/blob/main/prj_openweather_flutter/img/2.png"/>
<img alt="app" width="300px" height="600px" src="https://github.com/joaopauloaramuni/flutter/blob/main/prj_openweather_flutter/img/3.png"/>
</div>
