import Alamofire

struct HTTPRequest {
    
    let resource: HTTPResource
    
    let method: HTTPMethod
    
    let headers: HTTPHeaders
    
    let parameters: Parameters
    
    let mappingKeyPath: String?
    
    init(resource: HTTPResource,
         method: HTTPMethod = .get,
         headers: HTTPHeaders = [:],
         parameters: Parameters = [:],
         mappingKeyPath: String? = nil) {
        
        self.resource = resource
        self.method = method
        self.headers = headers
        self.parameters = parameters
        self.mappingKeyPath = mappingKeyPath
    }
}

enum HTTPResource: URLConvertible {
    
    private static let baseURLString = "https://api.cloudpayments.ru/payments/cards"
    
    case charge
    case auth
    case post3ds
    
    func asURL() throws -> URL {
        guard let baseURL = URL(string: HTTPResource.baseURLString) else {
            throw AFError.invalidURL(url: HTTPResource.baseURLString)
        }
        
        switch self {
        case .charge:
            return baseURL.appendingPathComponent("charge")
        case .auth:
            return baseURL.appendingPathComponent("auth")
        case .post3ds:
            return baseURL.appendingPathComponent("post3ds")
        }
    }
}
