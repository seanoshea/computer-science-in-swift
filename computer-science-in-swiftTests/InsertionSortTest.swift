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

class InsertionSortTest: XCTestCase {
    
    var insertionSort = InsertionSort()
    
    func testInsertionSort() {
        var original = [1]
        var sorted = insertionSort.insertionSort(&original)
        XCTAssert(sorted == original)
    }
    
    func testInsertionSortTwo() {
        var original = [2, 1]
        var sorted = insertionSort.insertionSort(&original)
        XCTAssert(sorted == [1, 2])
    }
    
    func testInsertionSortThree() {
        var original = [2, 1, 2, 2, 2, 0, 9]
        var sorted = insertionSort.insertionSort(&original)
        XCTAssert(sorted == [0, 1, 2, 2, 2, 2, 9])
    }
    
    func testInsertionSortFour() {
        var original = [1, 0, -1, 100]
        var sorted = insertionSort.insertionSort(&original)
        XCTAssert(sorted == [-1, 0, 1, 100])
    }
    
    func testInsertionSortFive() {
        var original = [9, 6, 3]
        var sorted = insertionSort.insertionSort(&original)
        XCTAssert(sorted == [3, 6, 9])
    }

    func testRandomArray() {
        var original = [] as Array<Int>
        for (var i = 1; i <= 100; i++) {
            original.append(Int(rand() % 100 + 1));
        }
        var copied = original;
        original.sort({ $1 > $0 })
        var sorted = insertionSort.insertionSort(&copied)
        XCTAssert(sorted == original)
    }
}
