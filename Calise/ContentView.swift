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
            VStack(spacing: 0) {
                GeometryReader {
                    geometry in
                    HStack(spacing: 0) {
                        Text("0 ")
                            .font(.system(size: 24))
                            .frame(width: ((geometry.size.width / 4) * 3), height: geometry.size.height, alignment: .trailing)
                            .background(.white)
                        Button(action: {}) {
                            Text("<-")
                                .font(.system(size: 24))
                        }
                        .frame(width: (geometry.size.width / 4), height: geometry.size.height)
                        .foregroundColor(.white)
                        .background(.blue)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                HStack(spacing: 0) {
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: 0) {
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: 0) {
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: 0) {
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: 0) {
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: 0) {
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: 0) {
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(6)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
