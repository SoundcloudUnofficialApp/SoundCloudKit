

public enum ActivityType: String, Codable {
    
    case track
    case track_repost = "track-repost"
    case track_sharing = "track-sharing"
    case comment
    case favoriting
    case playlist
    case playlist_repost = "playlist-repost"
}
