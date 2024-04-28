//
//  ViewController.swift
//  AudioTesting
//
//  Created by Vision Solutions on 4/28/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?
    var tempoTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudioSession()
        setupAudioPlayer()
    }

    
    // Modifies AVAudioSession settings to allow for audio while in silent mode
    func setupAudioSession() {
        do {
            // Set the audio session category to playback
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            // Activate the audio session
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set up audio session: \(error)")
        }
    }
    
    func setupAudioPlayer() {
        guard let soundURL = Bundle.main.url(forResource: "beep", withExtension: "wav") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
        } catch {
            print("Error loading sound file.")
        }
    }
    
    @objc func toggleTempo() {
        if tempoTimer == nil {
            startTempo()
        } else {
            stopTempo()
        }
    }
    
    func startTempo() {
        adjustVolumeToSystemVolume()
        tempoTimer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(playSound), userInfo: nil, repeats: true)
    }
    
    func stopTempo() {
        tempoTimer?.invalidate()
        tempoTimer = nil
    }
    
    @objc func playSound() {
        audioPlayer?.play()
    }
    
    func adjustVolumeToSystemVolume() {
        let volume = AVAudioSession.sharedInstance().outputVolume
        audioPlayer?.volume = volume
    }
}
