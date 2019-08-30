


import Foundation


//TODO: check API reference ! some models are optional
public struct Track: Codable {
    
    public let id: Int
    
    public let user_id: Int
    public let user: User
    
    public let title: String
    public let permalink: String
    public let permalink_url: String
    public let uri: String
    
    public let sharing: Sharing
    public let embeddable_by: EmbeddableBy?
    
    public let artwork_url: String?
    
    public let description: String?
    public let label: User
    public let duration: Int64
    
    public let genre: String?
    public let created_at: String
    public let purchase_url: String?
    public let tag_list: String
    public let label_id: Int64?
    public let label_name: String?
    public let release: Int?
    public let release_day: Int?
    public let release_month: Int?
    public let release_year: Int?
    
    public let streamable: Bool
    public let downloadable: Bool
    
    
    public enum EncodingState: String, Codable {
        case processing
        case failed
        case finished
    }
    public let state: EncodingState
    
    public enum License: String, Codable {
        case noRightsReserved  = "no-rights-reserved"
        case allRightsReserved = "all-rights-reserved"
        case ccBy              = "cc-by"
        case ccByNc            = "cc-by-nc"
        case ccByNd            = "cc-by-nd"
        case ccBySa            = "cc-by-sa"
        case ccByNcNd          = "cc-by-nc-nd"
        case ccByNcSa          = "cc-by-nc-sa"
    }
    public let license: License
    
    
    public enum TrackType: String, Codable {
        case original
        case remix
        case live
        case recording
        case spoken
        case podcast
        case demo
        case in_progress = "in progress"
        case stem
        case loop
        case sound_effect = "sound effect"
        case sample
        case other
    }
    public let track_type: TrackType?
    
    public let waveform_url: String
    public let download_url: String
    public let stream_url: String
    
    public let comment_count: Int
    public let download_count: Int
    public let playback_count: Int
    
    public let video_url: String?
    public let bpm: Int?
    public let commentable: Bool
    public let isrc: String?
    public let key_signature: String?
    public let favoritings_count: Int
    public let original_format: String
    public let original_content_size: Int64
    public let created_with: App
    public let attachments_uri: String?
}

public extension Track {
        
    var thumbnailURL: URL? {
        if let url = artwork_url?.toURL() {
            return url
        } else if let url = user.avatar_url.toURL() {
            return url
        }
        return nil
    }
    
    /// t500x500
    var artworkURL: URL? {
        return getURL(for: .t500x500)
    }
    
    enum ArtworkType: String, Codable {
        case t500x500
        case crop
        case t300x300
        case large
        case t67x67
        case badge
        case small
        case tiny
        case mini
    }
    func getURL(for type: ArtworkType) -> URL? {
        guard let artworkUrl = artwork_url else {
            return thumbnailURL
        }
        let str = artworkUrl.replacingOccurrences(of: "large", with: type.rawValue, options: NSString.CompareOptions.literal, range: nil)
        
        if let url = URL(string: str) {
            return url
        }
        return thumbnailURL
    }
}

public enum EmbeddableBy: String, Codable {
    case all
    case me
    case none
}

public enum Sharing: String, Codable {
    case `public`
    case `private`
}
