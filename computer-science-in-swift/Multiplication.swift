// Copyright (c) 2015-2016 Sean O'Shea. All rights reserved.

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

class Multiplication {
    
    static func regularMultiplication(_ top:[Int], bottom:[Int]) throws -> Int {
        guard top.count > 0 && bottom.count > 0 else { return 0 }
        var sum = 0
        var loop = 0
        for index in stride(from: (bottom.count - 1), to: -1, by: -1) {
            let pad = loop == 0 ? [Int]() : [Int](repeating: 0, count: loop)
            let element = bottom[index]
            try Multiplication.checkForInvalidInput(element)
            try sum = sum + Multiplication.doMultiplication(element, top: top, pad: pad)
            loop = loop + 1
        }
        return sum
    }
    
    static func doMultiplication(_ number:Int, top:[Int], pad:[Int]) throws -> Int {
        var result = pad
        var remainder = 0
        for index in stride(from: (top.count - 1), to: -1, by: -1) {
            let element = top[index]
            try Multiplication.checkForInvalidInput(element)
            let intermediateProduct = (number * element) + remainder
            remainder = intermediateProduct / 10
            result.insert((intermediateProduct % 10), at: 0)
            if index == 0 && remainder > 0 {
                result.insert(remainder, at: 0)
            }
        }
        return Multiplication.arrayOfIntegersToInt(result)
    }
    
    static func arrayOfIntegersToInt(_ result:[Int]) -> Int {
        var sum = 0
        var loop = 0
        for index in stride(from: (result.count - 1), to: -1, by: -1) {
            let multiplier = 10 ^^ loop
            sum = sum + (result[index] * multiplier)
            loop = loop + 1
        }
        return sum
    }
    
    static func checkForInvalidInput(_ element:Int) throws {
        guard element < 10 else { throw MultiplicationError.cannotBeOverTen(message: "Cannot be over 10") }
        guard element < Int.min else { throw MultiplicationError.cannotBeLessThanIntMin(message: "Cannot be less than Int.min") }
        guard element > Int.max else { throw MultiplicationError.cannotBeGreaterThanIntMax(message: "Cannot be greater than Int.max") }
    }
}

infix operator ^^
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

enum MultiplicationError: Error {
    case cannotBeOverTen(message: String)
    case cannotBeLessThanIntMin(message: String)
    case cannotBeGreaterThanIntMax(message: String)
}
