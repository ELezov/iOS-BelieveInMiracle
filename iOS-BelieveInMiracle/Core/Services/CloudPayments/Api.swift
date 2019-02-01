import Alamofire

//swiftlint:disable colon
extension NetworkService {
    
    func charge(cardCryptogramPacket: String,
                cardHolderName: String,
                completion: @escaping (Result<TransactionResponse>) -> Void) {
        
        // Параметры:
        let parameters: Parameters = [
            "Amount" : 1, // Сумма платежа (Обязательный)
            "Currency" : "RUB", // Валюта (Обязательный)
            "Name" : cardHolderName,
            // Имя держателя карты в латинице (Обязательный для всех платежей кроме Apple Pay и Google Pay)
            "IpAddress" : "192.168.0.1", // Необходимый параметр, оставляем его как есть
            "CardCryptogramPacket" : cardCryptogramPacket, // Криптограмма платежных данных (Обязательный)
            "InvoiceId" : "1111", // Номер счета или заказа в вашей системе (Необязательный)
            "Description" : "Оплата книг", // Описание оплаты в свободной форме (Необязательный)
            "AccountId" : "222", // Идентификатор пользователя в вашей системе (Необязательный)
            "JsonData" : "{\"age\":27,\"name\":\"Ivan\",\"phone\":\"+79998881122\"}"
            // Любые другие данные, которые будут связаны с транзакцией (Необязательный)
        ]
        
        let request = HTTPRequest(resource: .charge, method: .post, parameters: parameters)
        makeObjectRequest(request, completion: completion)
    }
    
    func auth(cardCryptogramPacket: String,
              cardHolderName: String,
              completion: @escaping (Result<TransactionResponse>) -> Void) {
        
        // Параметры:
        let parameters: Parameters = [
            "Amount" : 1, // Сумма платежа (Обязательный)
            "Currency" : "RUB", // Валюта (Обязательный)
            "Name" : cardHolderName, // Имя держателя карты в латинице
            //(Обязательный для всех платежей кроме Apple Pay и Google Pay)
            "IpAddress" : "192.168.0.1",
            // Необходимый параметр, оставляем его как есть
            "CardCryptogramPacket" : cardCryptogramPacket,
            // Криптограмма платежных данных (Обязательный)
            "InvoiceId" : "1111", // Номер счета или заказа в вашей системе (Необязательный)
            "Description" : "Оплата книг", // Описание оплаты в свободной форме (Необязательный)
            "AccountId" : "222", // Идентификатор пользователя в вашей системе (Необязательный)
            "JsonData" : "{\"age\":27,\"name\":\"Ivan\",\"phone\":\"+79998881122\"}"
            // Любые другие данные, которые будут связаны с транзакцией (Необязательный)
        ]
        
        let request = HTTPRequest(resource: .auth, method: .post, parameters: parameters)
        makeObjectRequest(request, completion: completion)
    }
    
    func post3ds(transactionId: String, paRes: String, completion: @escaping (Result<TransactionResponse>) -> Void) {
        
        let parameters: Parameters = [
            "TransactionId" : transactionId,
            "PaRes" : paRes
        ]
        
        let request = HTTPRequest(resource: .post3ds, method: .post, parameters: parameters)
        makeObjectRequest(request, completion: completion)
    }
}
