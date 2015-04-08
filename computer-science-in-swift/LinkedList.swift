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

class LinkedListNode {
    var data:Int = 0
    var next:LinkedListNode?
}

class LinkedList: NSObject {
    
    var head:LinkedListNode?
    var length:Int = 0
    
    func add(data:Int) {
        var node = LinkedListNode()
        node.data = data
        var current:LinkedListNode
        
        if self.head == nil {
            self.head = node
        } else {
            current = self.head!
            while current.next != nil {
                current = current.next!
            }
            current.next = node
        }
        self.length++
    }
    
    func item(index:Int) -> Int {
        return 0
    }
    
    func remove(index:Int) -> Int? {
        return 0
    }
    
    func size() -> Int {
        return self.length
    }
    
    func toArray() -> Array<Int> {
        return []
    }
    
    func clear() {
        
    }
}
