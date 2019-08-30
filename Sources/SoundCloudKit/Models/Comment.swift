

public struct Comment: Codable {
    
    public let id: Int
    
    public let created_at: String
    public let user_id: Int
    public let track_id: Int
    public let timestamp: Int64
    public let body: String
    public let uri: String
    public let user: User
}
