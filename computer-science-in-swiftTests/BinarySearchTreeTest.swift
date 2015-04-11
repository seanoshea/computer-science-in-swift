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

import UIKit
import XCTest

class BinarySearchTreeTest: XCTestCase {

    var binarySearchTree:BinarySearchTree = BinarySearchTree()
    
    override func setUp() {
        super.setUp()
        binarySearchTree.add(1)
        binarySearchTree.add(2)
        binarySearchTree.add(3)
        binarySearchTree.add(5)
        binarySearchTree.add(8)
        binarySearchTree.add(13)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSize() {
        XCTAssert(binarySearchTree.size() == 6, "there should be 6 elements in the tree at the start")
        binarySearchTree.add(21)
        XCTAssert(binarySearchTree.size() == 7, "there should be 7 elements in the tree after adding one")
    }
}
