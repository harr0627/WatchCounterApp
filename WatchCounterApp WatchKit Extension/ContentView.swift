//
//  ContentView.swift
//  WatchCounterApp WatchKit Extension
//
//  Created by kelsey harrison on 2022-02-24.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var count = 0
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(alignment: .center, spacing: 8){
            Text("\(count)")
                .font(.system(size: 90))
                .fontWeight(.black)
                .multilineTextAlignment(.center)
                .onReceive(timer){ _ in
                    if count == 0 {
                        timer.upstream.connect().cancel()
                    }
                   count = count > 0 ? count - 1 : 0
                }
            HStack(alignment: .center, spacing: 8){
                Button {
                    print("increment")
                    timer.upstream.connect().cancel()
                    count = count + 1
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 34))
                }
                Button {
                    print("decrement")
                    timer.upstream.connect().cancel()
                    count = count - 1
                } label: {
                    Image(systemName: "minus")
                        .font(.system(size: 34))
                }
            }
            HStack(alignment: .center, spacing: 8){
                Button {
                    print("clear")
                } label: {
                    Text("Clear")
                        .font(.system(size: 0))
                }
                Button {
                
                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                } label: {
                    Image(systemName: "play.fill")
                        .font(.system(size: 34))
                }
                Button {
                   print("pause")
                    timer.upstream.connect().cancel()
                } label: {
                    Image(systemName: "pause.fill")
                        .font(.system(size: 34))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
