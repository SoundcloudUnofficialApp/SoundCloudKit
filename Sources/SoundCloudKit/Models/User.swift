

public struct User: Codable {
    
    public let id: Int
    
    public let permalink: String
    public let username: String
    public let full_name: String?
    
    public let uri: String
    public let permalink_url: String
    public let avatar_url: String
    
    public let country: String?
    public let city: String?
    
    public let description: String?
    
    public let website: String?
    public let website_title: String?
    public let online: Bool?
    public let track_count: Int?
    public let playlist_count: Int?
    public let followers_count: Int?
    public let followings_count: Int?
    public let public_favorites_count: Int?
    
    //TODO: check discogs-name, myspace-name ?
    //    public let discogs_name: String?
    //    public let myspace_name: String?
}
