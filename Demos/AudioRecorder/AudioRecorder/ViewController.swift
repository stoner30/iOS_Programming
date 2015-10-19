//
//  ViewController.swift
//  AudioRecorder
//
//  Created by Stoner Wang on 15/10/19.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var soundFileUrl: NSURL!
    var recording: Bool!
    var playing: Bool!
    
    var soundRecorder: AVAudioRecorder?
    var soundPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
//        let documentDirectory = paths.first
//        
//        let fileManager = NSFileManager.defaultManager()
//        let myDirectory = NSString(string: documentDirectory).stringByAppendingPathComponent("test")
        
        let tempDir = NSTemporaryDirectory()
        let soundFilePath = tempDir.stringByAppendingString("test.caf")
        
        let newUrl = NSURL(fileURLWithPath: soundFilePath)
        self.soundFileUrl = newUrl
        
        let audioSession = AVAudioSession.sharedInstance()
        // 使用NotificationCenter进行监听，delegate属性已过期
        do {
            try audioSession.setActive(true)
        } catch {
            print(error)
        }
        
        recording = false
        playing = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func beginToRecord(sender: UIButton) {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setActive(true)
            try audioSession.setCategory(AVAudioSessionCategoryRecord)
        } catch {
            print(error)
        }
        
        let recordingSetting = [
            AVSampleRateKey: NSNumber(double: 44100.0),
            AVFormatIDKey: NSNumber(unsignedInt: kAudioFormatAppleLossless),
            AVNumberOfChannelsKey: NSNumber(int: 1),
            AVEncoderAudioQualityKey: NSNumber(integer: AVAudioQuality.Max.rawValue)
        ]
        
        do {
            soundRecorder = try AVAudioRecorder(URL: soundFileUrl, settings: recordingSetting)
        } catch {
            soundRecorder = nil
            print(error)
        }
        
        soundRecorder?.prepareToRecord()
        soundRecorder?.record()
        
        sender.setTitle("Recording...", forState: .Normal)
        sender.setTitle("Recording...", forState: .Highlighted)
        
        recording = true
    }
    
    @IBAction func completeToRecord(sender: UIButton) {
        recording = false
        
        soundRecorder?.stop()
        self.soundRecorder = nil
        
        sender.setTitle("Record", forState: .Normal)
        sender.setTitle("Record", forState: .Highlighted)
        
        do {
            try AVAudioSession.sharedInstance().setActive(false)
        } catch {
            print(error)
        }
    }
    
    @IBAction func playSound(sender: UIButton) {
        let fileManager = NSFileManager.defaultManager()
        if fileManager.fileExistsAtPath(self.soundFileUrl.path!) {
            print("AAA")
        } else {
            print("------")
        }
        
        do {
            self.soundPlayer = try AVAudioPlayer(contentsOfURL: self.soundFileUrl)
            self.soundPlayer?.volume = 1
            self.soundPlayer?.delegate = self
            if (self.soundPlayer!.prepareToPlay()) {
                self.soundPlayer?.play()
            } else {
                let alert = UIAlertController(title: nil, message: "声音文件尚未准备好，请稍后再试", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "确定", style: .Cancel, handler: nil)
                alert.addAction(cancelAction)
                presentViewController(alert, animated: true, completion: nil)
            }
        } catch {
            print(error)
        }
    }
    
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer, error: NSError?) {
        if error != nil {
            print(error)
        }
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        let alert = UIAlertController(title: "播放完毕", message: nil, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "确定", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion: nil)
    }

}

