

import Foundation
import Alamofire


extension APIClient {
    
    func fetchTrack(_ id: String) -> Promise<Track> {
        return fetchItem(Router.track(id))
    }
}
