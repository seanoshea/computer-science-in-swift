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

class DoublyLinkedListTest: XCTestCase {
    
    var doublyLinkedList = DoublyLinkedList()
    
    override func setUp() {
        super.setUp()
        doublyLinkedList.add(1)
        doublyLinkedList.add(2)
        doublyLinkedList.add(4)
    }
    
    func testAdd() {
        XCTAssert(doublyLinkedList.size() == 3, "The size of the doubly linked list should be 3 after adding three elements")
    }
    
    func testRetrieveItem() {
        XCTAssert(doublyLinkedList.item(2) == 4, "The third element in the list should equal 4")
    }
    
    func testRetrieveItemThatIsntThere() {
        XCTAssert(doublyLinkedList.item(13) == nil, "The thirteenth element in the list should not be present")
    }
    
    func testRemoveItem() {
        let removedItem = doublyLinkedList.remove(1)
        XCTAssert(removedItem == 2, "The removed item should be returned from remove")
        XCTAssert(doublyLinkedList.size() == 2, "The size of the doubly linked list should be 2 after removing one element")
    }
    
    func testRemoveFirstItem() {
        let removedItem = doublyLinkedList.remove(0)
        XCTAssert(removedItem == 1, "The removed item should be returned from remove")
        XCTAssert(doublyLinkedList.size() == 2, "The size of the doubly linked list should be 2 after removing the first element")
    }
    
    func testRemoveOnlyItem()  {
        let singularLinkedList = DoublyLinkedList()
        singularLinkedList.add(14)
        let removedItem = singularLinkedList.remove(0)
        XCTAssert(removedItem == 14, "The removed item should be returned from remove")
        XCTAssert(singularLinkedList.size() == 0, "The size of the doubly linked list should be 2 after removing the only item")
    }
    
    func testRemoveLastItem() {
        let removedItem = doublyLinkedList.remove(2)
        XCTAssert(removedItem == 4, "The removed item should be returned from remove")
        XCTAssert(doublyLinkedList.size() == 2, "The size of the doubly linked list should be 2 after removing the last element")
    }
    
    func testRemoveItemThatIsntPresent() {
        let removedItem = doublyLinkedList.remove(14)
        XCTAssert(removedItem == nil, "The returned item should be nil")
        XCTAssert(doublyLinkedList.size() == 3, "The size of the doubly linked list should be 3 after trying to remove an element that isnt there")
    }
    
    func testToArray() {
        let returnedArray = doublyLinkedList.toArray()
        XCTAssert(returnedArray == [1, 2, 4])
    }
}