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

class NextPrimeFibonacci {
    
    var map = Dictionary<Int, Int>()
    
    func nextPrimeFibonacci(input: Int) -> Int {
        var nextPrimeFibonacci = 0
        while (true) {
            let num = fibonacci(nextPrimeFibonacci)
            if (num > input && isPrime(num)) {
                nextPrimeFibonacci = num
                break;
            }
            nextPrimeFibonacci = nextPrimeFibonacci + 1
        }
        return nextPrimeFibonacci
    }
    
    func isPrime(input: Int) -> Bool {
        var isPrime = input >= 2
        if (isPrime) {
            for index in 2.stride(to: input - 1, by: 1) {
                if input % index == 0 {
                    isPrime = false
                    break;
                }
            }
        }
        return isPrime
    }
    
    func fibonacci(input: Int) -> Int {
        if (input <= 1) {
            return 1
        } else {
            let memoized = map[input]
            if memoized != nil {
                return memoized!
            } else {
                map[input] = fibonacci(input - 1) + fibonacci(input - 2)
                return map[input]!
            }
        }
    }
}