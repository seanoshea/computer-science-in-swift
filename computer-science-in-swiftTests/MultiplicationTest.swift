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
        do {
            let result = try Multiplication.regularMultiplication([5, 6, 7, 8], bottom: [1, 2, 3, 4])
            XCTAssertTrue(result == 7006652, "Result should be 7006652")
        } catch _ {
            
        }
    }
    
    func testBackwardsMultiplication() {
        do {
            let result = try Multiplication.regularMultiplication([1, 2, 3, 4], bottom: [5, 6, 7, 8])
            XCTAssertTrue(result == 7006652, "Result should be 7006652")
        } catch _ {
            
        }
    }
    
    func testSimpleMultiplication() {
        do {
            let result1 = try Multiplication.regularMultiplication([1], bottom: [1])
            XCTAssertTrue(result1 == 1, "1 x 1 == 1")
            let result2 = try Multiplication.regularMultiplication([2], bottom: [1])
            XCTAssertTrue(result2 == 2, "2 x 1 == 2")
            let result3 = try Multiplication.regularMultiplication([1], bottom: [0])
            XCTAssertTrue(result3 == 0, "1 x 0 == 0")
            let result4 = try Multiplication.regularMultiplication([0], bottom: [0])
            XCTAssertTrue(result4 == 0, "0 x 0 == 0")
        } catch _ {
            
        }
    }
    
    func testNegatives() {
        do {
            let result1 = try Multiplication.regularMultiplication([-1], bottom: [1])
            XCTAssertTrue(result1 == -1, "-1 x 1 == -1")
            let result2 = try Multiplication.regularMultiplication([1], bottom: [-1])
            XCTAssertTrue(result2 == -1, "1 x -1 == -1")
            let result3 = try Multiplication.regularMultiplication([-1], bottom: [-1])
            XCTAssertTrue(result3 == 1, "-1 x -1 == 1")
        } catch _ {
            
        }
    }
    
    func testDifferentSizes() {
        do {
            let result1 = try Multiplication.regularMultiplication([5, 6, 7], bottom: [1, 2, 3, 4])
            XCTAssertTrue(result1 == 699678, "Result should be 699678")
            let result2 = try Multiplication.regularMultiplication([1, 2, 3, 4], bottom: [1, 2])
            XCTAssertTrue(result2 == 14808, "Result should be 699678")
        } catch _ {
            
        }
    }
    
    func testTens() {
        do {
            let result1 = try Multiplication.regularMultiplication([1, 0], bottom: [1, 0])
            XCTAssertTrue(result1 == 100, "Result should be 100")
            let result2 = try Multiplication.regularMultiplication([1, 0], bottom: [1])
            XCTAssertTrue(result2 == 10, "Result should be 10")
            let result3 = try Multiplication.regularMultiplication([1, 0], bottom: [-1])
            XCTAssertTrue(result3 == -10, "Result should be -10")
            let result4 = try Multiplication.regularMultiplication([1, 0], bottom: [-1, 0])
            XCTAssertTrue(result4 == -100, "Result should be -100")
        } catch _ {
            
        }
    }
    
    func testInvalidInput() {
        do {
            try _ = Multiplication.regularMultiplication([10, 0], bottom: [1, 0])
            XCTAssertTrue(1 == 0)
        } catch let error {
            XCTAssertTrue((error as? MultiplicationError) != nil)
        }
    }
}
