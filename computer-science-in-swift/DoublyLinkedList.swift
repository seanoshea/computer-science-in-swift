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

class DoublyLinkedListNode {
    var data:Int = 0
    var previous:DoublyLinkedListNode?
    var next:DoublyLinkedListNode?
}

class DoublyLinkedList {

    var head:DoublyLinkedListNode?
    var tail:DoublyLinkedListNode?
    var length:Int = 0
    
    func add(data:Int) {
        let node = DoublyLinkedListNode()
        node.data = data
        if self.length == 0 {
            self.head = node
            self.tail = node
        } else {
            self.tail!.next = node
            node.previous = self.tail
            self.tail = node
        }
        self.length = self.length + 1
    }
    
    func item(index:Int) -> Int? {
        if index > -1 && index < self.length {
            var current = self.head
            var i = 0
            while i < index {
                current = current!.next
                i = i + 1
            }
            return current!.data
        } else {
            return nil
        }
    }
    
    func remove(index:Int) -> Int? {
        if index > -1 && index < self.length {
            var current = self.head
            var i = 0
            if index == 0 {
                if let possibleHead = current?.next {
                    possibleHead.previous = nil
                    self.head = possibleHead
                } else {
                    self.tail = nil
                }
            } else if index == self.length - 1 {
                current = self.tail
                self.tail = current!.previous
                self.tail!.next = nil
            } else {
                while i < index {
                    current = current!.next
                    i = i + 1
                }
                let unwrappedCurrent = current!
                unwrappedCurrent.previous!.next = unwrappedCurrent.next
                unwrappedCurrent.next!.previous = unwrappedCurrent.previous
            }
            self.length = self.length - 1
            return current!.data
        } else {
            return nil
        }
    }
    
    func toArray() -> Array<Int> {
        var result = Array<Int>()
        var current = self.head
        while current != nil {
            let unwrappedCurrent = current!
            result.append(unwrappedCurrent.data)
            current = unwrappedCurrent.next
        }
        return result
    }
    
    func size() -> Int {
        return self.length
    }
}

