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

class BTreeTest : XCTestCase {
    
    let bTree = BTree()
    
    func testInitialsation() {
        XCTAssertTrue(bTree.minKeySize == 1)
        XCTAssertTrue(bTree.maxChildrenSize == 3)
        XCTAssertTrue(bTree.maxKeySize == 2)
        XCTAssertTrue(bTree.maxChildrenSize == 3)
    }
    
    func testCustomInitialisation() {
        let customBTree = BTree(order:3)
        XCTAssertTrue(customBTree.minKeySize == 3)
        XCTAssertTrue(customBTree.maxChildrenSize == 7)
        XCTAssertTrue(customBTree.maxKeySize == 6)
        XCTAssertTrue(customBTree.maxChildrenSize == 7)
    }
}

class BTreeNodeTets : XCTestCase {
    
    var bTreeNode:BTreeNode?
    var one:BTreeNode?
    var two:BTreeNode?
    
    override func setUp() {
        bTreeNode = BTreeNode.init(parentParam: nil, maxKeySize: 3, maxChildrenSize: 2)
        self.one = BTreeNode.init(parentParam: nil, maxKeySize: 3, maxChildrenSize: 2)
        self.one!.addKey(11)
        self.two = BTreeNode.init(parentParam: nil, maxKeySize: 3, maxChildrenSize: 2)
        self.two!.addKey(12)
    }
    
    func testGetKeyThatIsntThere() {
        XCTAssertTrue(self.bTreeNode!.getKeyAtIndex(14) == -1)
    }
    
    func testGetKeyThatIsThere() {
        self.bTreeNode?.addKey(14)
        let expectedValue = self.bTreeNode!.getKeyAtIndex(0)
        XCTAssertTrue(expectedValue == 14)
    }
    
    func testGetIndexThatIsntThere() {
        XCTAssertTrue(self.bTreeNode?.indexOfValue(33) == -1)
    }
    
    func testGetIndexThatIsThere() {
        self.bTreeNode?.addKey(7)
        self.bTreeNode?.addKey(14)
        self.bTreeNode?.addKey(21)
        XCTAssertTrue(self.bTreeNode?.indexOfValue(21) == 2)
    }
    
    func testRemoveKeyFromEmptyTreeNode() {
        XCTAssert(self.bTreeNode?.keysSize == 0)
        XCTAssertTrue(self.bTreeNode?.removeKey(33) == -1)
        XCTAssert(self.bTreeNode?.keysSize == 0)
    }
    
    func testRemoveKeyThatIsntThere() {
        self.bTreeNode?.addKey(32)
        XCTAssertTrue(self.bTreeNode?.keysSize == 1)
        XCTAssertTrue(self.bTreeNode?.removeKey(33) == -1)
        XCTAssertTrue(self.bTreeNode?.keysSize == 1)
    }
    
    func testRemoveKeyThatIsThere() {
        self.bTreeNode?.addKey(7)
        self.bTreeNode?.addKey(14)
        self.bTreeNode?.addKey(21)
        XCTAssertTrue(self.bTreeNode?.keysSize == 3)
        XCTAssertTrue(self.bTreeNode?.removeKey(7) == 7)
        XCTAssertTrue(self.bTreeNode?.keysSize == 2)
    }
    
    func testRemoveKeyAtIndexFromEmptyTreeNode() {
        XCTAssertTrue(self.bTreeNode?.removeKeyAtIndex(13) == -1)
    }
    
    func testRemoveKeyAtIndexThatIsntThere() {
        self.bTreeNode?.addKey(7)
        XCTAssertTrue(self.bTreeNode?.keysSize == 1)
        XCTAssertTrue(self.bTreeNode?.removeKeyAtIndex(1) == -1)
        XCTAssertTrue(self.bTreeNode?.keysSize == 1)
    }
    
    func testRemoveKeyAtIndex() {
        self.bTreeNode?.addKey(7)
        self.bTreeNode?.addKey(14)
        self.bTreeNode?.addKey(21)
        XCTAssertTrue(self.bTreeNode?.keysSize == 3)
        XCTAssertTrue(self.bTreeNode?.removeKeyAtIndex(1) == 14)
        XCTAssertTrue(self.bTreeNode?.keysSize == 2)
    }
    
    func testGetChildThatIsntThere() {
        XCTAssertTrue(self.bTreeNode?.getChildAtIndex(14) == nil)
    }
    
    func testGetChildThatIsThere() {
        self.addTwoChildren()
        let child = self.bTreeNode?.getChildAtIndex(0)
        XCTAssertTrue(child?.getKeyAtIndex(0) == 11)
    }
    
    func testRemoveChildThatIsntThere() {
        XCTAssertFalse(self.bTreeNode!.removeChild(self.one!))
    }
    
    func testRemoveChildThatIsThere() {
        self.addTwoChildren()
        XCTAssertTrue(self.bTreeNode!.removeChild(self.one!))
        XCTAssertTrue(self.bTreeNode?.childrenSize == 1)
    }
    
    func testRemoveChildAtIndexThatIsntThere() {
        XCTAssertFalse(self.bTreeNode!.removeChildAtIndex(0))
    }
    
    func testRemoveChildAtIndexThatIsThere() {
        self.addTwoChildren()
        XCTAssertTrue(self.bTreeNode!.childrenSize == 2)
        XCTAssertTrue(self.bTreeNode!.removeChildAtIndex(0))
        XCTAssertTrue(self.bTreeNode!.childrenSize == 1)
        let retrievedNode = self.bTreeNode?.getChildAtIndex(0)
        XCTAssertTrue(retrievedNode?.getKeyAtIndex(0) == 11)
    }
    
    func addTwoChildren() {
        self.bTreeNode?.addChild(self.one!)
        self.bTreeNode?.addChild(self.two!)
    }
}
