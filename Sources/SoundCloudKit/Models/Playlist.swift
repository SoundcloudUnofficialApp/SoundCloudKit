


import Foundation


public enum PlaylistType: String, Codable {
    case epSingle = "ep single"
    case album
    case compilation
    case projectFiles = "project files"
    case archive
    case showcase
    case demo
    case samplePack = "sample pack"
    case other
}

public struct Playlist: Codable {
    
    public let id: Int
    public let user_id: Int
    public let user: User
    public let title: String
    
    public let permalink: String
    public let permalink_url: String
    public let uri: String
    
    
    public let artwork_url: String?
    public let description: String?
    
    public let created_at: String
    public let sharing: Sharing
    public let embeddable_by: EmbeddableBy?
    public let purchase_url: String?
    
    public let label: User
    public let duration: Int64
    public let genre: String?
    public let tag_list: String
    public let label_id: Int64?
    public let label_name: String?
    public let release: Int?
    public let release_day: Int?
    public let release_month: Int?
    public let release_year: Int?
    public let streamable: Bool
    public let downloadable: Bool
    public let ean: String
    public let playlist_type: PlaylistType?
    public let tracks: [Track]
    public let track_count: Int
}

public extension Playlist {
    
    var thumbnailURL: URL? {
        if let url = artwork_url?.toURL() {
            return url
        } else if let url = user.avatar_url.toURL() {
            return url
        }
        return nil
    }
}
