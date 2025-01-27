//
//  MediaView.swift
//  OSXDownloadMedia
//
//  Created by Angelos Staboulis on 27/1/25.
//

import Foundation
import SwiftUI
struct MediaView: View {
    @State private var amount = 0.0
    @State var video:String
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
            ZStack(alignment: .center) {
                ProgressView("Loading…", value: amount, total: 50)
                    .onReceive(timer) { _ in
                        if amount < 50 {
                            amount += 2
                        }
                }.opacity(amount < 50 ? 1 : 0.0)
                .progressViewStyle(.circular)
                
            }.background {
                WebVideo(urlVideo:video).frame(width:950,height:1750)
            }
         
    }
}
