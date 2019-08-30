

import UIKit
import ASWaveformPlayerView



class PlayerVC: UIViewController {
    
    var playerView: ASWaveformPlayerView!
    
    let localAudioURL = Bundle.main.url(forResource: "testAudio", withExtension: "mp3")!
    
    let remoteTrackURLString = "https://soundcloud.com/purplewerewolfs/the-guess-who-shakin-all-over"
    
    public var apiClient = APIClient()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // init with track url
        load(trackURLString: remoteTrackURLString)
        
    
        view.addSubview(playerView)
        playerView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        let constrs = [
            playerView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            playerView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            playerView.heightAnchor.constraint(equalToConstant: 128),
            playerView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            playerView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constrs)
    }
    
    /// loads track in WaveformPlayerView
    public func load(trackURLString: String) {
        load(trackURL: URL(string: trackURLString)!)
    }
    
    /// loads track in WaveformPlayerView
    public func load(trackURL: URL) {
        do {
            try initPlayerView(trackURL)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    private func initPlayerView(_ url: URL) throws {
        
        playerView = try ASWaveformPlayerView(audioURL: url,
                                             sampleCount: 1024,
                                             amplificationFactor: 500)
        
        playerView.normalColor = .lightGray
        playerView.progressColor = .orange
        playerView.allowSpacing = false
    }
}


