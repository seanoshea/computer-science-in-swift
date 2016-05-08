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

import XCTest

class MergeSortTest : XCTestCase {
    
    var mergeSort = MergeSort()
    
    func testMergeSort() {
        var original = [1]
        let sorted = mergeSort.mergeSort(&original)
        XCTAssert(sorted == original)
    }
    
    func testMergeSortTwo() {
        var original = [2, 1]
        let sorted = mergeSort.mergeSort(&original)
        XCTAssert(sorted == [1, 2])
    }
    
    func testMergeSortThree() {
        var original = [2, 1, 2, 2, 2, 0, 9]
        let sorted = mergeSort.mergeSort(&original)
        XCTAssert(sorted == [0, 1, 2, 2, 2, 2, 9])
    }
    
    func testMergeSortFour() {
        var original = [1, 0, -1, 100]
        let sorted = mergeSort.mergeSort(&original)
        XCTAssert(sorted == [-1, 0, 1, 100])
    }
    
    func testMergeSortFive() {
        var original = [9, 6, 3]
        let sorted = mergeSort.mergeSort(&original)
        XCTAssert(sorted == [3, 6, 9])
    }
    
    func testRandomArray() {
        var original = Array<Int>()
        for _ in 1.stride(to: 100, by: 1) {
            original.append(Int(rand() % 100 + 1))
        }
        var copied = original
        original.sortInPlace({ $1 > $0 })
        let sorted = mergeSort.mergeSort(&copied)
        XCTAssert(sorted == original)
    }
}
