

@_exported import PromiseKit
@_exported import Alamofire
@_exported import PMKAlamofire


extension APIClient {
    
    func fetchItem<T: Codable>(_ route: Router) -> Promise<T> {
        return session
            .request(route)
            .validate(statusCode: 200..<300)
            .responseDecodable()
    }
    
    func fetchItems<T: Codable>(_ route: Router) -> Promise<[T]> {
        return session
            .request(route)
            .validate(statusCode: 200..<300)
            .responseDecodable()
    }
    
    //    func fetch(_ route: Router,
    //               _ callback: @escaping RequestCallback<Any>) -> DataRequest {
    //        return session
    //            .request(route)
    //            .validate(statusCode: 200..<300)
    //            .responseJSON(options: .allowFragments) { response in
    //                callback(response.request, response.response, response.result)
    //        }
    //    }
    
}
