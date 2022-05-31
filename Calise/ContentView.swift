//
//  ContentView.swift
//  Calise
//
//  Created by 王ユウ on R 4/05/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            GeometryReader {
                geometry in
                VStack {
                    HStack {
                        Text("0 ")
                            .background(.white)
                        Button(action: {}) {
                            Text("<-")
                        }
                        .foregroundColor(.white)
                        .background(.blue)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height / 9)
                    HStack {
                        Text("0 ")
                            .background(.white)
                        Button(action: {}) {
                            Text("<-")
                        }
                        .foregroundColor(.white)
                        .background(.blue)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height / 9)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
