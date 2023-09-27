//
//  ContentView.swift
//  RubberDuckieWatchOS Watch App
//
//  Created by Pieter Yoshua Natanael on 08/09/23.
//

import SwiftUI
import AVFoundation

class AudioPlayerManager: ObservableObject {
    private var player: AVAudioPlayer?
    
    init() {
        guard let soundURL = Bundle.main.url(forResource: "music", withExtension: "mp3") else {
            fatalError("Sound file not found")
        }
        
        
        do {
            player = try AVAudioPlayer(contentsOf: soundURL)
            player?.prepareToPlay()
        } catch {
            print("Error initializing audio player: \(error.localizedDescription)")
        }
    }
    
    func play() {
        player?.play()
    }
    
    func stop() {
        player?.stop()
        player?.currentTime = 0
    }
}

struct ContentView: View {
    @State private var isPlaying = false
    @ObservedObject private var audioPlayerManager = AudioPlayerManager()
    
    var body: some View {
        VStack {
            Spacer()
            Image("Duckie")
                .resizable()
                .aspectRatio(contentMode: .fit)
      
            Spacer()
            
            Button(action: {
                if isPlaying {
                    isPlaying = false
                    audioPlayerManager.stop()  // Stop the music
                } else {
                    isPlaying = true
                    audioPlayerManager.play()
                }
            }) {
                Text(isPlaying ? "Turn Off" : "Turn On")
                    .foregroundColor(.black)
                    .bold()
            }
            .padding()
            .background(isPlaying ? Color.green : Color.gray)
            .cornerRadius(15)
            .foregroundColor(.white)
            
            Spacer()
            
            Text("Powered by PYN")
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
/*


import SwiftUI
import AVFoundation

struct ContentView: View {
    @ObservedObject private var audioPlayerManager = AudioPlayerManager()
    @State private var isButtonPressed = false

    var body: some View {
        VStack {
            if isButtonPressed {
                LottieView(loopMode: .loop)
                    .frame(height: 200)
                    .scaleEffect(0.4)
                
                Text("Party Bear")
                    .font(.title3)
                    .bold()
                    .padding()
            }

         

            Button(action: {
                audioPlayerManager.play()
                isButtonPressed = true
            }) {
                Text("Start")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background(Color.green)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 4)
            }
            .padding()

            Button(action: {
                audioPlayerManager.pause()
                isButtonPressed = false // Hide the LottieView
            }) {
                Text("Pause")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background(Color.red)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 4)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

*/
/*
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
