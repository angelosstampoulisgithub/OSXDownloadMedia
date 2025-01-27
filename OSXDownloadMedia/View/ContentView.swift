//
//  ContentView.swift
//  OSXDownloadMedia
//
//  Created by Angelos Staboulis on 27/1/25.
//

import SwiftUI

struct ContentView: View {
    @State var urlDownload:String
    @State var savingFile:String
    @State var cookiePath:String
    @State var getFinished:Bool
    @State var isPlaying:Bool
    let process = Downloader()
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    HStack{
                        VStack{
                            Text("Enter your url for Download").frame(width:470,alignment: .leading)
                            TextField("Enter your url for Download",text: $urlDownload).frame(width:490,height:45,alignment: .leading)
                        }
                        Button {
                            isPlaying.toggle()
                        } label: {
                            Text("Play Video").frame(width:150,height:45,alignment: .center)
                        }.frame(width:330,alignment: .trailing)
                    }
                    HStack{
                        VStack{
                            Text("Enter your path for Saving File").frame(width:490,alignment: .leading)
                            TextField("Enter your path for Saving File",text: $savingFile).frame(width:490,height:45,alignment: .leading)
                        }
                        Button {
                            isPlaying = false
                            let helper = Helper()
                            helper.removeWebViewCache {
                            }
                        } label: {
                            Text("Stop Video").frame(width:150,height:45,alignment: .center)
                        }.frame(width:330,alignment: .trailing)
                    }
                    HStack{
                        VStack{
                            Text("Enter your path for Cookie File").frame(width:450,alignment: .leading)
                            TextField("Enter your path for Cookie File",text: $cookiePath).frame(width:450,height:45,alignment: .leading)
                        }
                        Button(action: {
                            Task{
                                if cookiePath.count > 0 {
                                    getFinished = await process.downloadFileCookies(downloadfile: urlDownload, pathSave:savingFile, pathCookies: cookiePath)
                                }else{
                                    getFinished = await process.downloadFile(downloadfile: urlDownload, pathSave: savingFile)
                                }
                            }
                        }, label: {
                            Text("Download file").frame(width:150,height:45,alignment: .center)
                        }).alert("Information Message", isPresented: $getFinished) {
                            Text("Download finished")
                            Button("OK", role: .cancel) {}
                        }.frame(width:365,alignment: .trailing)
                    }
                }
            }

        }.frame(maxWidth: .infinity,maxHeight: 1250,alignment: .topLeading)
        if isPlaying {
            MediaView(video: urlDownload)
        }else{
            StopMediaView(video: "https://www.google.com")
        }
    }
}

#Preview {
    ContentView(urlDownload: "", savingFile: "", cookiePath: "", getFinished: false, isPlaying: false)
}
