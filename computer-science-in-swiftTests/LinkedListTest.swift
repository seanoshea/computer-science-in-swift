//
//  LinkedListTest.swift
//  computer-science-in-swift
//
//  Created by Sean O Shea on 4/7/15.
//  Copyright (c) 2015 UpwardsNorthwards. All rights reserved.
//

import UIKit
import XCTest

class LinkedListTest: XCTestCase {

    var linkedList = LinkedList()
    
    override func setUp() {
        super.setUp()
        linkedList.clear()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testAdd() {
        linkedList.add(1)
        linkedList.add(2)
        linkedList.add(3)
        
        XCTAssert(linkedList.size() == 3, "The size of the linked list should be 3 after adding three elements")
    }

}
