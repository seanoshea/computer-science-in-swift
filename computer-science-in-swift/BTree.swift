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

class Node {
    
}

class BTree : NSObject {
    
    var minKeySize = 1
    var minChildrenSize:Int = 0
    var maxKeySize:Int = 0
    var maxChildrenSize:Int = 0
    var size:Int = 0
    var root:Node? = nil

    override init() {
        minKeySize = 1
        super.init()
        self.commonInit()
    }
    
    init(order:Int) {
        minKeySize = order
        super.init()
        self.commonInit()
    }
    
    func commonInit() {
        minChildrenSize = minKeySize + 1
        maxKeySize = 2 * minKeySize
        maxChildrenSize = maxKeySize + 1
    }
}

class BTreeNode : NSObject {
    
    var keys:[Int] = [Int]()
    var keysSize:Int = 0
    var children:[BTreeNode]?
    var childrenSize = 0
    var parent:BTreeNode? = nil
    
    init(parentParam:BTreeNode?, maxKeySize:Int, maxChildrenSize:Int) {
        parent = parentParam
        keys = [Int]()
        keysSize = 0
        children = [BTreeNode]()
        childrenSize = 0
        super.init()
    }
    
    func getKeyAtIndex(index:Int) -> Int {
        guard index < self.keysSize else { return -1 }
        return self.keys[index]
    }
    
    func indexOfValue(value:Int) -> Int {
        var indexOfValue = -1
        for (index, arrayValue) in self.keys.enumerate() {
            if arrayValue == value {
                indexOfValue = index
                break
            }
        }
        return indexOfValue
    }
    
    func addKey(value:Int) {
        self.keys.append(value)
        self.keysSize = self.keysSize + 1
        self.keys.sortInPlace()
    }
    
    func removeKey(value:Int) -> Int {
        guard self.keysSize > 0 else { return -1 }
        var found = false
        var removed = -1
        for (index, arrayValue) in self.keys.enumerate() {
            if value == arrayValue {
                found = true
                removed = arrayValue
            } else if found {
                self.keys[index - 1] = self.keys[index]
            }
        }
        if found {
            self.keysSize = self.keysSize - 1
            self.keys.removeLast()
        }
        return removed
    }
    
    func removeKeyAtIndex(index:Int) -> Int {
        guard self.keysSize > index else { return -1 }
        let removed = self.keys[index]
        for arrayIndex in (index + 1).stride(to: self.keysSize, by: 1) {
            self.keys[arrayIndex - 1] = self.keys[arrayIndex]
        }
        self.keysSize = self.keysSize - 1
        self.keys.removeLast()
        return removed
    }
}