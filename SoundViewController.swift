
import UIKit
import AVFoundation

class SoundViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var recordButton: UIButton!
    
    var audioRecorder: AVAudioRecorder?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupRecorder()
        
    }
    
    func setupRecorder() {
        
        do {
            
            // Create Audio session
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try session.overrideOutputAudioPort(.speaker)
            try session.setActive(true)
            
            // Create URL for the audio Files
            let basePath : String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            
            let pathComponets = [basePath, "audio.m4a"]
            let audioURL = NSURL.fileURL(withPathComponents: pathComponets)!
            
            // Create settings for audio recorder
            
            var settings = [String:AnyObject] = [:]
            settings[AVFormatIDKey] = Int(kAudioFormatMPEG4AAC)
            settings[AVSampleRateKey] = 44100.0
            settings[AVNumberOfChannelsKey] = 2
            
            
            //Create audio Object
            audioRecorder = try AVAudioRecorder(url: audioURL, settings:  = )
            
        } catch let error as NSError {
            print(error)
        }
        
    }
        @IBAction func addTapped(_ sender: AnyObject) {
        }
        
        @IBAction func recordTapped(_ sender: AnyObject) {
        }
        @IBAction func playTapped(_ sender: AnyObject) {
        }
        
}


