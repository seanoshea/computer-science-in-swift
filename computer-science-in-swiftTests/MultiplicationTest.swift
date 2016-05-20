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
import XCTest

class MultiplicationTest : XCTestCase {
    
    func testRegularMultiplication() {
        let result = Multiplication.regularMultiplication([5, 6, 7, 8], bottom: [1, 2, 3, 4])
        XCTAssertTrue(result == 7006652, "Result should be 7006652")
    }
    
    func testBackwardsMultiplication() {
        let result = Multiplication.regularMultiplication([1, 2, 3, 4], bottom: [5, 6, 7, 8])
        XCTAssertTrue(result == 7006652, "Result should be 7006652")
    }
    
    func testSimpleMultiplication() {
        XCTAssertTrue(Multiplication.regularMultiplication([1], bottom: [1]) == 1, "1 x 1 == 1")
        XCTAssertTrue(Multiplication.regularMultiplication([2], bottom: [1]) == 2, "2 x 1 == 2")
        XCTAssertTrue(Multiplication.regularMultiplication([1], bottom: [0]) == 0, "1 x 0 == 0")
        XCTAssertTrue(Multiplication.regularMultiplication([0], bottom: [0]) == 0, "0 x 0 == 0")
    }
    
    func testNegatives() {
        XCTAssertTrue(Multiplication.regularMultiplication([-1], bottom: [1]) == -1, "-1 x 1 == -1")
        XCTAssertTrue(Multiplication.regularMultiplication([1], bottom: [-1]) == -1, "1 x -1 == -1")
        XCTAssertTrue(Multiplication.regularMultiplication([-1], bottom: [-1]) == 1, "-1 x -1 == 1")
    }
}
