
import Foundation
import Alamofire


extension APIClient {
    
    enum Router: URLRequestConvertible {
        
        private static let baseURLString = "https://api.soundcloud.com"
        
        //MARK: Connect
        
        // case connect
        
        //MARK: Users
        
        case users(String)
        case user(String)
        case tracksOfUser(User)
        case playlistsOfUser(User)
        case followingsOfUser(User)
        // case followersOfUser(User)
        // case commentsOfUser(User)
        case favoritesOfUser(User)
        // case groupsOfUser(User)
        // case webProfilesOfUser(User)
        
        //MARK: Tracks
        
        case track(String)
        // case commentsOfTrack(Track)
        // case commentOfTrack(Track, Comment)
        // case favoritersOfTrack(Track)
        // case favoriterOfTrack(Track, User)
        // case secretTokenOfTrack(Track)
        
        //MARK: Playlists
        
        case playlist(String)
        // case secretTokenOfPlaylist(Playlist)
        
        //MARK: Groups
        
        //MARK: Comments
        
        //MARK: Me
        
        case me
        /* me/connections */
        /* me/activities */
        case activities
        case nextActivities(String)
        case futureActivities(String)
        /* apps */
        /* resolve */
        /* oembed */
        
        
        //MARK: -
        
        var method: Alamofire.HTTPMethod {
            return .get
        }
        
        var path: String {
            switch self {
                
            case .track(let trackId):
                return "/tracks/\(trackId)"
                
            case .playlist(let playlistId):
                return "/playlists/\(playlistId)"
                
            case .users:
                return "/users"
                
            case .user(let userId):
                return "/users/\(userId)"
                
            case .tracksOfUser(let user):
                return "/users/\(user.id)/tracks"
                
            case .playlistsOfUser(let user):
                return "/users/\(user.id)/playlists"
                
            case .followingsOfUser(let user):
                return "/users/\(user.id)/followings"
                
            case .favoritesOfUser(let user):
                return "/users/\(user.id)/favorites"
                
            case .me:
                return "/me"
                
            case .activities:
                return "/me/activities"
                
            case .nextActivities(_):
                fatalError()
                //return ""
                
            case .futureActivities(_):
                fatalError()
                //return ""
            }
        }
        
        var url: URL {
            let urlStr: String
            switch self {
            case .nextActivities(let href):
                urlStr = href
            case .futureActivities(let href):
                urlStr = href
            default:
                urlStr = Self.baseURLString + path
            }
            return URL(string: urlStr)!
        }
        
        var params: [String: AnyObject] {
            switch self {
            case .users(let q):
                return ["q": q as AnyObject]
            default:
                return [:]
            }
        }
        
        var needsOAuthToken: Bool {
            switch self {
            case .me,
                 .activities,
                 .nextActivities,
                 .futureActivities:
                return true
            default:
                return false
            }
        }
        
        public func asURLRequest() throws -> URLRequest {
            
            var req = URLRequest(url: url)
            req.httpMethod = method.rawValue
            
            //TODO: encode param in APIClient
            //var reqParams = params
            //reqParams["client_id"] = clientId as AnyObject?
            
            if needsOAuthToken {
                fatalError()
                // let token = client.accessToken
                // reqParams["oauth_token"] = token as AnyObject?
            }
            return try URLEncoding.default.encode(req, with: params)
        }
    }
}
