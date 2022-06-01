//
//  ContentView.swift
//  Calise
//
//  Created by 王ユウ on R 4/05/31.
//

import SwiftUI

// Variable
var setAB = false
var mySetValue = false
var operandChange = false
var finish = false
var error = false
var dotMode = false
var myOperator = "null"
var oouControl = 1
var dotControl = 0
var a = Decimal(string: "0")!
var b = Decimal(string: "0")!
var m = Decimal(string: "0")!
var dot = Decimal(string: "0.1")!
var dotCount = 1

// Try
enum countError: Error {
    case divideZero
    case minusToSqrt
}

func count(operandA: Decimal, myOperatorOfCount: String, operandB: Decimal) throws -> Decimal {
    guard ((myOperator == "div") && (b != Decimal(string: "0")!)) else {
        throw countError.divideZero
    }
    switch myOperator {
    case "add":
        return a + b
    case "sub":
        return a - b
    case "mul":
        return a * b
    case "div":
        return a / b
    default:
        return pow(a, Int("\(b)")!)
    }
}

func mySqrt(operand: Decimal) throws -> Decimal {
    guard (operand < 0) else {
        throw countError.minusToSqrt
    }
    return Decimal(string: "\(sqrt(Double("\(operand)")!))")!
}

// Function
func show() -> String {
    var output = ""
    if (!dotMode || (dotMode && (dot < Decimal(string: "0.1")!))) {
        output = (!operandChange) ? "\(a) " : "\(b) "
    } else if (dotMode && (dot == Decimal(string: "0.1")!)) {
        output = (!operandChange) ? "\(a). " : "\(b). "
    }
    return output
}

func execution(i: String) -> String {
    var step = ""
    var output = ""
    if (i == "c") {
        setAB = false
        mySetValue = false
        dotMode = false
        dot = Decimal(string: "0.1")!
        dotCount = 1
        do {
            try a = count(operandA: a, myOperatorOfCount: myOperator, operandB: b)
            b = Decimal(string: "0")!
            if (!finish) {
                step = ("\(a)".count <= 13) ? "a" : "e"
            } else {
                operandChange = false
                myOperator = "null"
                step = "f"
            }
        } catch {
            // a/0 error
            step = "e"
        }
    }
    if ((i == "f") || (step == "f")) {
        switch oouControl {
        case 0:
            if (!operandChange) {
                a = Decimal(string: "\(floor((Double("\(a)")! * pow(10.0, Double(dotControl))) / pow(10.0, Double(dotControl))))")!
            } else {
                b = Decimal(string: "\(floor((Double("\(b)")! * pow(10.0, Double(dotControl))) / pow(10.0, Double(dotControl))))")!
            }
        case 2:
            if (!operandChange) {
                a = Decimal(string: "\(ceil((Double("\(a)")! * pow(10.0, Double(dotControl))) / pow(10.0, Double(dotControl))))")!
            } else {
                b = Decimal(string: "\(ceil((Double("\(b)")! * pow(10.0, Double(dotControl))) / pow(10.0, Double(dotControl))))")!
            }
        default:
            if (!operandChange) {
                a = Decimal(string: "\(round((Double("\(a)")! * pow(10.0, Double(dotControl))) / pow(10.0, Double(dotControl))))")!
            } else {
                b = Decimal(string: "\(round((Double("\(b)")! * pow(10.0, Double(dotControl))) / pow(10.0, Double(dotControl))))")!
            }
        }
        if (finish) {
            step = ("\(a)".count <= 13) ? "a" : "e"
        }
    }
    if ((i == "e") || (step == "e")) {
        error = true
        output = "E "
    }
    if (step == "a") {
        output = "\(a) "
    }
    return output
}

func reset() {
    setAB = true
    if (mySetValue || finish) {
        mySetValue = false
        finish = false
        if (!operandChange) {
            a = Decimal(string: "0")!
        } else {
            b = Decimal(string: "0")!
        }
    }
}

// Button Function
func numberButtonClick(number: Decimal) {
}

func operatorButtonClick(myOperatorOfOBC: String) -> Bool {
    var output = false
    finish = false
    if (!operandChange) {
        setAB = false
        mySetValue = false
        operandChange = true
        dotMode = false
        dot = Decimal(string: "0.1")!
        dotCount = 1
    } else if (operandChange && setAB) {
        output = true
    }
    if (!error) {
        myOperator = myOperatorOfOBC
    }
    return output
}

struct ContentView: View {
    // View Control
    @State private var screenTextOfView = "\(a) "
    @State private var oouControlTextOfView = "4/5"
    @State private var dotControlTextOfView = "\(dotControl)"
    @State private var oouControlOfView = 1.0
    @State private var dotControlOfView = 0.0

    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack(spacing: 6) {
                GeometryReader {
                    geometry in
                    HStack(spacing: 6) {
                        Text("\(screenTextOfView)")
                            .font(.system(size: 24))
                            .frame(maxWidth: .infinity, maxHeight: geometry.size.height, alignment: .trailing)
                            .foregroundColor(.black)
                            .background(.white)
                        Button(action: {
                            if (!error) {
                                if (dotMode && (dotCount > 1)) {
                                    dot /= Decimal(string: "0.1")!
                                    dotCount -= 1
                                } else if (dotMode && (dotCount == 1)) {
                                    dotMode = false
                                } else if (!dotMode) {
                                    if (!operandChange) {
                                        a /= Decimal(string: "10")!
                                    } else {
                                        b /= Decimal(string: "10")!
                                    }
                                }
                                if (!operandChange) {
                                    a = Decimal(string: "\(floor((Double("\(a)")! * pow(10.0, Double(dotControl - 1))) / pow(10.0, Double(dotControl - 1))))")!
                                } else {
                                    b = Decimal(string: "\(floor((Double("\(b)")! * pow(10.0, Double(dotControl - 1))) / pow(10.0, Double(dotControl - 1))))")!
                                }
                                screenTextOfView = show()
                            }
                        }) {
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
                        Slider(value: $oouControlOfView, in: 0...2, step: 1, onEditingChanged: {
                            editing in
                            switch oouControlOfView {
                            case 0.0:
                                oouControlTextOfView = "out"
                            case 2.0:
                                oouControlTextOfView = "up"
                            default:
                                oouControlTextOfView = "4/5"
                            }
                            oouControl = Int(oouControlOfView)
                        })
                        Text("\(oouControlTextOfView)")
                            .font(.system(size: 24))
                            .frame(width: 50, height: 40)
                            .foregroundColor(.white)
                            .background(.blue)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    VStack {
                        Slider(value: $dotControlOfView, in: 0...2, step: 1, onEditingChanged: {
                            editing in
                            dotControlTextOfView = "\(Int(dotControlOfView))"
                            dotControl = Int(dotControlOfView)
                        })
                        Text("\(dotControlTextOfView)")
                            .font(.system(size: 24))
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .background(.blue)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: 6) {
                    Button(action: {
                        setAB = false
                        mySetValue = false
                        operandChange = false
                        finish = false
                        error = false
                        dotMode = false
                        myOperator = "null"
                        a = Decimal(string: "0")!
                        b = Decimal(string: "0")!
                        dot = Decimal(string: "0.1")!
                        dotCount = 1
                        screenTextOfView = show()
                    }) {
                        Text("C")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {
                        if (!error) {
                            if (!operandChange) {
                                a *= Decimal(string: "-1")!
                            } else {
                                b *= Decimal(string: "-1")!
                            }
                            screenTextOfView = show()
                        }
                    }) {
                        Text("+/-")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {
                        if (!error) {
                            mySetValue = true
                            dotMode = false
                            dot = Decimal(string: "0.1")!
                            dotCount = 1
                            do {
                                if (!operandChange) {
                                    try a = mySqrt(operand: a)
                                } else {
                                    try b = mySqrt(operand: b)
                                }
                                let myDo = execution(i: "f")
                                if (myDo == "") {
                                    screenTextOfView = show()
                                }
                            } catch {
                                // sqrt(a) or sqrt(b) error
                                screenTextOfView = execution(i: "e")
                            }
                        }
                    }) {
                        Text("sqrt")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {
                        if (!error) {
                            let toCount = operatorButtonClick(myOperatorOfOBC: "pow")
                            if (toCount) {
                                screenTextOfView = execution(i: "c")
                            }
                        }
                    }) {
                        Text("^")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: 6) {
                    Button(action: {
                        m = Decimal(string: "0")!
                    }) {
                        Text("MC")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {
                        if (!error) {
                            reset()
                            mySetValue = true
                            dotMode = false
                            dot = Decimal(string: "0.1")!
                            dotCount = 1
                            if (!operandChange) {
                                a = m
                            } else {
                                b = m
                            }
                            screenTextOfView = show()
                        }
                    }) {
                        Text("MR")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {
                        if (!error) {
                            m -= (!operandChange) ? a : b
                        }
                    }) {
                        Text("M-")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {
                        if (!error) {
                            m += (!operandChange) ? a : b
                        }
                    }) {
                        Text("M+")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: 6) {
                    Button(action: {
                        if (!error) {
                            numberButtonClick(number: Decimal(string: "7")!)
                        }
                    }) {
                        Text("7")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {
                        if (!error) {
                            numberButtonClick(number: Decimal(string: "8")!)
                        }
                    }) {
                        Text("8")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {
                        if (!error) {
                            numberButtonClick(number: Decimal(string: "9")!)
                        }
                    }) {
                        Text("9")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {
                        if (!error) {
                            let toCount = operatorButtonClick(myOperatorOfOBC: "div")
                            if (toCount) {
                                screenTextOfView = execution(i: "c")
                            }
                        }
                    }) {
                        Text("/")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: 6) {
                    Button(action: {
                        if (!error) {
                            numberButtonClick(number: Decimal(string: "4")!)
                        }
                    }) {
                        Text("4")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {
                        if (!error) {
                            numberButtonClick(number: Decimal(string: "5")!)
                        }
                    }) {
                        Text("5")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {
                        if (!error) {
                            numberButtonClick(number: Decimal(string: "6")!)
                        }
                    }) {
                        Text("6")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {
                        if (!error) {
                            let toCount = operatorButtonClick(myOperatorOfOBC: "mul")
                            if (toCount) {
                                screenTextOfView = execution(i: "c")
                            }
                        }
                    }) {
                        Text("*")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: 6) {
                    Button(action: {
                        if (!error) {
                            numberButtonClick(number: Decimal(string: "1")!)
                        }
                    }) {
                        Text("1")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {
                        if (!error) {
                            numberButtonClick(number: Decimal(string: "2")!)
                        }
                    }) {
                        Text("2")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {
                        if (!error) {
                            numberButtonClick(number: Decimal(string: "3")!)
                        }
                    }) {
                        Text("3")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {
                        if (!error) {
                            let toCount = operatorButtonClick(myOperatorOfOBC: "sub")
                            if (toCount) {
                                screenTextOfView = execution(i: "c")
                            }
                        }
                    }) {
                        Text("-")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: 6) {
                    Button(action: {
                        if (!error) {
                            numberButtonClick(number: Decimal(string: "0")!)
                        }
                    }) {
                        Text("0")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {
                        if (!error) {
                            if ((!operandChange && ("\(a)".count < 12)) || (operandChange && ("\(b)".count < 12))) {
                                reset()
                                dotMode = true
                                screenTextOfView = show()
                            }
                        }
                    }) {
                        Text(".")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {
                        if (!error) {
                            finish = true
                            screenTextOfView = execution(i: "c")
                        }
                    }) {
                        Text("=")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    Button(action: {
                        if (!error) {
                            let toCount = operatorButtonClick(myOperatorOfOBC: "add")
                            if (toCount) {
                                screenTextOfView = execution(i: "c")
                            }
                        }
                    }) {
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
