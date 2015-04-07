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

class LinkedListTest: XCTestCase {

    var linkedList = LinkedList()
    
    override func setUp() {
        super.setUp()
        linkedList.clear()
        linkedList.add(1)
        linkedList.add(2)
        linkedList.add(4)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testAdd() {
        
        XCTAssert(linkedList.size() == 3, "The size of the linked list should be 3 after adding three elements")
    }
    
    func testRetrieveItem() {
        
        XCTAssert(linkedList.item(3) == 4, "The third element in the list should equal 4")
    }
    
    func testRemoveItem() {
        
        let removedItem = linkedList.remove(1)
        
        XCTAssert(removedItem == 2, "The removed item should be returned from remove")
        XCTAssert(linkedList.size() == 2, "The size of the linked list should be 2 after removing one element")
    }
    
    func testToArray() {
        
        let returnedArray = linkedList.toArray()
        
        XCTAssert(returnedArray == [1, 2, 4])
    }
}
