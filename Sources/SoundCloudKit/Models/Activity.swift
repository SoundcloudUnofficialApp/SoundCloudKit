
import Foundation


public struct Activity: Codable  {
    
    public var type: ActivityType
    public var created_at: String
    public var tags: [TagType]
    public var origin: Origin
}

public extension Activity {
    
    enum TagType: String, Codable {
        case exclusive
        case affiliated
        case first
        case own
        case conversation
    }
    
    enum Origin: Codable {
        
        enum CodingKeys: CodingKey {
            case track, playlist
        }
        
        case track(Track)
        case playlist(Playlist)
        
        public init(from decoder: Decoder) throws {
            let c = try decoder.container(keyedBy: CodingKeys.self)
            
            if let track = try? c.decode(Track.self, forKey: .track) {
                
                self = .track(track)
            } else {
                let playlist = try c.decode(Playlist.self, forKey: .playlist)
                self = .playlist(playlist)
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            var c = encoder.container(keyedBy: CodingKeys.self)
            
            switch self {
            case .track(let track):
                try c.encode(track, forKey: .track)
            case .playlist(let playlist):
                try c.encode(playlist, forKey: .playlist)
            }
        }
    }
}

