//
//  ContentView.swift
//  Calise
//
//  Created by 王ユウ on R 4/05/31.
//

import SwiftUI

struct ContentView: View {
    @State private var oouControl = 1.0
    @State private var dotControl = 0.0
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack(spacing: 6) {
                GeometryReader {
                    geometry in
                    HStack(spacing: 6) {
                        Text("0 ")
                            .font(.system(size: 24))
                            .frame(maxWidth: .infinity, maxHeight: geometry.size.height, alignment: .trailing)
                            .background(.white)
                        Button(action: {}) {
                            Text("<-")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .frame(width: geometry.size.height, height: geometry.size.height)
                        .foregroundColor(.white)
                        .background(.blue)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                HStack(spacing: 6) {
                    VStack {
                        Slider(value: $oouControl, in: 0...2)
                        Text("4/5")
                            .font(.system(size: 24))
                            .frame(width: 50, height: 40)
                            .background(.white)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    VStack {
                        Slider(value: $dotControl, in: 0...2)
                        Text("0")
                            .font(.system(size: 24))
                            .frame(width: 40, height: 40)
                            .background(.white)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: 6) {
                    Button(action: {}) {
                        Text("C")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {}) {
                        Text("+/-")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {}) {
                        Text("sqrt")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {}) {
                        Text("^")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: 6) {
                    Button(action: {}) {
                        Text("MC")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {}) {
                        Text("MR")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {}) {
                        Text("M-")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {}) {
                        Text("M+")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: 6) {
                    Button(action: {}) {
                        Text("7")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {}) {
                        Text("8")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {}) {
                        Text("9")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {}) {
                        Text("/")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: 6) {
                    Button(action: {}) {
                        Text("4")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {}) {
                        Text("5")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {}) {
                        Text("6")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {}) {
                        Text("*")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: 6) {
                    Button(action: {}) {
                        Text("1")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {}) {
                        Text("2")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {}) {
                        Text("3")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {}) {
                        Text("-")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: 6) {
                    Button(action: {}) {
                        Text("0")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {}) {
                        Text(".")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {}) {
                        Text("=")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {}) {
                        Text("+")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
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
