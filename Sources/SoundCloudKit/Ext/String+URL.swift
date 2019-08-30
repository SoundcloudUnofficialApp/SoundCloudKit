

import Foundation

extension String {
    
    func toURL() -> URL? {
        
        if let url = URL(string: self) {
            return url
            
        } else if let str = addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
            return URL(string: str)
        }
        return nil
    }
}
