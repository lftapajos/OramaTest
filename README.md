# OramaTest


Teste desenvolvido para a empresa Órama. Desenvolvimento de aplicativo para carregar fundos de investimento, permitir a compra dos fundos e salvá-los no histórico de compras.

## Getting Started

Para começar é necessário possuir uma API de Fundos e detalhes dos fundos. E uma senha para confirmar a compra.

```
Ex: Password = "123456"
```

### Tests

Para alterar a chamada da API, altere o arquivo Constants.swift

```
let API_URL = "https://s3.amazonaws.com/orama-media/json/fund_detail_full.json"
```

Para alterar a senha de acesso, altere o arquivo Constants.swift

```
let MOCK_PASSWORD = "123456"
```

## Built With

* [COCOAPODS](https://cocoapods.org) - The web framework used
* [Alamofire](https://github.com/Alamofire/Alamofire) - Dependency Management
* [AlamofireImage](https://github.com/Alamofire/AlamofireImage) - Dependency Management
* [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) - Dependency Management

## Authors

* **Luís Felipe Tapajós** - *Initial work* - [lftapajos](https://github.com/lftapajos)

## License

Este projeto está licenciado sob a licença MIT - Consulte LICENÇA para obter detalhes.
