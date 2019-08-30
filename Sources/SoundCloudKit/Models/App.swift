

public struct App: Codable {
    
    public let id: Int
    public let uri: String
    public let permalink_url: String
    public let external_url: String
    public let name: String
}


//protocol HasId {
//    var id: Int {get}
//}

//protocol IdHashable: HasId, Hashable {}
//extension IdHashable {
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//}

//typealias SCModel = HasId & Codable
 
