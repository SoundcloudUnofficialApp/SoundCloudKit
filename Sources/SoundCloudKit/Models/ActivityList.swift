
import Foundation
 

public struct ActivityList: Codable {
    
    public var next_href: String?
    public var future_href: String?
    public var collection: [Activity]
}
