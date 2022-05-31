//
//  CaliseApp.swift
//  Calise
//
//  Created by 王ユウ on R 4/05/31.
//

import SwiftUI

let setAB = false
let mySetValue = false
let operandChange = false
let finish = false
let error = false
let dotMode = false
let myOperator = "null"
let oouControl = 2
let dotControl = 0
let a = Decimal(string: "0")
let b = Decimal(string: "0")
let dot = Decimal(string: "0.1")
let dotCount = 1

@main
struct CaliseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
