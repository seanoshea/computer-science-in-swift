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

// https://projecteuler.net/problem=2

class EvenFibonacci {
    
    let maximumTermValue:Int64 = 40000000
    var map = [UInt:UInt]()
    
    func sumOfEvenNumberedFibonacciTerms() -> Int64 {
        var value:Int64 = 0
        let fibonacciGenerator = FibonacciGenerator.init(end: Int64.max - 1)
        while let next = fibonacciGenerator.next() {
            guard next < self.maximumTermValue else { break }
            if next % 2 == 0 {
                value = value + next
            }
        }
        return value
    }
}

typealias FibonacciTuple = (Int64, Int64)

class FibonacciGenerator : IteratorProtocol {
    
    var last:FibonacciTuple = (0, 1)
    var endAt:Int64
    var lastIteration:Int64 = 0
    
    init(end:Int64) {
        self.endAt = end
    }
    
    func next() -> Int64? {
        guard lastIteration < self.endAt else { return nil }
        self.lastIteration = self.lastIteration + 1
        let next:Int64 = last.0
        self.last = (last.1, last.0 + last.1)
        return next
    }
    
}
