
import UIKit
import ASWaveformPlayerView


class ViewController: UIViewController {
    
    var wformView: ASWaveformPlayerView!
    
    let audioURL = Bundle.main.url(forResource: "testAudio", withExtension: "mp3")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try initWaveformPlayerView(audioURL)
        } catch {
            print(error.localizedDescription)
        }
        
        view.addSubview(wformView)
        wformView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        let constrs = [
            wformView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            wformView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            wformView.heightAnchor.constraint(equalToConstant: 128),
            wformView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            wformView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constrs)
    }
    
    private func initWaveformPlayerView(_ url: URL) throws {
        
        wformView = try ASWaveformPlayerView(audioURL: url,
                                             sampleCount: 1024,
                                             amplificationFactor: 500)
        
        wformView.normalColor = .lightGray
        wformView.progressColor = .orange
        wformView.allowSpacing = false
    }
}

