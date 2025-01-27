//
//  OSXDownloadMediaApp.swift
//  OSXDownloadMedia
//
//  Created by Angelos Staboulis on 27/1/25.
//

import SwiftUI

@main
struct OSXDownloadMediaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(urlDownload: "", savingFile: "", cookiePath: "", getFinished: false, isPlaying: false).frame(width:950,height:1150,alignment: .center)
        }.windowResizability(.contentSize)
    }
}
