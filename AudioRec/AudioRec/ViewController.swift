//
//  ViewController.swift
//  AudioRec
//
//  Created by Rithishkesav Saravanan on 29/03/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    
    var numberOfRecords: Int = 0
    
    @IBOutlet weak var buttonLabel: UIButton!
    @IBOutlet weak var myTableView: UITableView!
    
    @IBAction func record(_ sender: Any) {
        //Check if we have an active recorder
        if audioRecorder == nil{
            numberOfRecords += 1
            let fileName = getDirectory().appendingPathComponent("\(numberOfRecords).m4a")
            
            let settings = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC), AVSampleRateKey: 12000, AVNumberOfChannelsKey: 1, AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
            
            //Start Audio recording
            do{
                audioRecorder = try AVAudioRecorder(url: fileName, settings: settings)
                audioRecorder.delegate = self
                audioRecorder.record()
                
                buttonLabel.setTitle("Stop Recording", for: .normal)
            }
            catch{
                displayAlert(title: "Oops!", message: "Something went wrong. Recording failed")
            }
        }
        else{
            //Stopping curreent audio recording
            audioRecorder.stop()
            audioRecorder = nil
            
            //For reloading the tableview after the recording stops
            myTableView.reloadData()
            
            //For saving the number of recordings done - doing that when the recording stops
            UserDefaults.standard.set(numberOfRecords, forKey: "myNumber")
            
            buttonLabel.setTitle("Start Recording", for: .normal)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Setting up the session - Initializing the session
        recordingSession = AVAudioSession.sharedInstance()
        
        //When the app restarts after multiple recordings we need to have the total number of recordings done displayed
        if let number: Int = UserDefaults.standard.object(forKey: "myNumber") as? Int{
            //The if condition means that we have probably stored a number there and then we can set the 'numberofrecords' to 'number'
            numberOfRecords = number
        }
        
        //Asking for permission
        AVAudioSession.sharedInstance().requestRecordPermission{ (hasPermission) in
            if hasPermission{
                print("Permission ACCEPTED")
            }
        }
    }
    
    //Function that gets path to directory to save the ausio recordings
    func getDirectory() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory
    }
    
    //Function to display alerts if soomeething goes wrong
    func displayAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    //Setting up Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //This is an in-built function which defines the number of rows needed in our table view
        return numberOfRecords //number of rows will be equal to the 'numberOFRecords'
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //This function is another built-in function that defines the content of each cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row + 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Create an 'audioPlayer' variable to for this function
        //This is declaring the path in which the particular recording that is clicked on is taken into consideration
        let path = getDirectory().appendingPathComponent("\(indexPath.row + 1).m4a")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: path)
            audioPlayer.play()
        }
        catch{
            
        }
    }

}

