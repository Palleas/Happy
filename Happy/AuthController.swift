import Cocoa
import Foundation
import ReactiveSwift
import Result

struct Credentials {
    let clientId: String
    let clientSecret: String
}

final class AuthController {
    
    private let credentials: Credentials
    
    init(credentials: Credentials) {
        self.credentials = credentials
    }
    
    func open() {
        let params = [("client_id", credentials.clientId),
                      ("redirect_uri", "urn:ietf:wg:oauth:2.0:oob"),
                      ("response_type", "code"),
                      ("scope", "https://www.googleapis.com/auth/drive"),
                      ("state", "potato")]
        
        var comps = URLComponents(url: URL(string: "https://accounts.google.com/o/oauth2/v2/auth")!, resolvingAgainstBaseURL: true)!
        comps.queryItems = params.map(URLQueryItem.init)
        let url = comps.url!
        
        NSWorkspace.shared().open(url)
    }
}
