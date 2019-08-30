
 
import Alamofire
import Foundation


open class APIClient {
    
    public let session = Alamofire.SessionManager.default
    
    public static let shared = APIClient()
    
    static let clientId = "i71BoBoxTxlbVYvnt7O2reL86DynpqT3"
    
    public var accessToken: String?
    public var isLoggedIn: Bool {
        return accessToken != nil
    }
    
    public init() {
    }
}
