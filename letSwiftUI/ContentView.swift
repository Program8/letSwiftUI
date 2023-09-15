//
//  ContentView.swift
//  i@SwiftUI
//
//  Created by Vijay Sachan on 15/09/23.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        ZStack{
            // Using .ignoresSafeArea() so that background color can be set in fullscreen including status bar
            Color.white.ignoresSafeArea()
            VStack(spacing: 0){
                ZStack{
                    let view=HomeView().background(Color.green)
                    if #available(iOS 16.0, *) {
                        NavigationStack{
                            view
                        }
                    } else {
                        // Fallback on earlier versions
                        NavigationView{
                            view
                        }
                    }
                    
                }.frame(maxWidth: .infinity,maxHeight: .infinity)
            }.frame(maxWidth: .infinity,maxHeight: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
