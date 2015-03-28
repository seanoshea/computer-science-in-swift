// Copyright (c) 2015 Sean O'Shea. All rights reserved.

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

import XCTest

class BubbleSortTest: XCTestCase {

    var bubbleSort = BubbleSort()
    
    func testSortingASortedArray() {
        var original = [1, 2, 3, 4, 5, 6, 7]
        var sorted = bubbleSort.bubbleSort(&original)
        XCTAssert(sorted == original)
    }
    
    func testSortingAnUnsortedArray() {
        var original = [1, 2, 3, 4, 5, 9, 7]
        var sorted = bubbleSort.bubbleSort(&original)
        XCTAssert(sorted == [1, 2, 3, 4, 5, 7, 9])
    }
    
    func testOneItemArray() {
        var original = [1]
        var sorted = bubbleSort.bubbleSort(&original)
        XCTAssert(sorted == [1])
    }
    
    func testNegativeNumbersInArray() {
        var original = [-1, -2, 0, 8, 12, 3]
        var sorted = bubbleSort.bubbleSort(&original)
        XCTAssert(sorted == [-2, -1, 0, 3, 8, 12])
    }
    
    func testTwoNumbersInArray() {
        var original = [2, 1]
        var sorted = bubbleSort.bubbleSort(&original)
        XCTAssert(sorted == [1, 2])
    }
}
