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
    
    func item(index:Int) -> Int? {
        if index > -1 && index < self.length {
            var current:LinkedListNode = self.head!
            var i = 0
            while i++ < index {
                current = current.next!
            }
            return current.data
        }
        return nil
    }
    
    func remove(index:Int) -> Int? {
        if index > -1 && index < self.length {
            var current:LinkedListNode = self.head!
            var previous:LinkedListNode = LinkedListNode()
            var i = 0
            if index == 0 {
                self.head = current.next
            } else {
                while i++ < index {
                    previous = current
                    current = current.next!
                }
                previous.next = current.next
            }
            self.length--
            return current.data
        } else {
            return nil
        }
    }
    
    func size() -> Int {
        return self.length
    }
    
    func toArray() -> Array<Int> {
        var result:Array<Int> = []
        var current:LinkedListNode = self.head!
        for var i = 0; i < self.length; i++ {
            result.append(self.item(i)!)
        }
        return result
    }
    
    func clear() {
        var size = self.size();
        for var i = 0; i < size; i++ {
            self.remove(i);
        }
        self.head = nil
        self.length = 0
    }
}
