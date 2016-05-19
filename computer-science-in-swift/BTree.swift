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

class BTree : NSObject {
    
    var minKeySize = 1
    var minChildrenSize:Int = 0
    var maxKeySize:Int = 0
    var maxChildrenSize:Int = 0
    var size:Int = 0
    var root:BTreeNode? = nil

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
    
    func add(value:Int) -> Bool {
        if self.root != nil {
            var node = self.root
            while (node != nil) {
                if node!.childrenSize == 0 {
                    node!.addKey(value)
                    if node!.keysSize <= self.maxKeySize {
                        // A-OK
                        break
                    }
                    self.split(node!)
                    break
                }
                // lesser
                let lesser:Int = node!.getKeyAtIndex(0)
                if value <= lesser {
                    node = node!.getChildAtIndex(0)
                    continue
                }
                // greater
                let numberOfKeys = node!.keysSize
                let last = numberOfKeys - 1
                let greater = node!.getKeyAtIndex(last)
                if (value > greater) {
                    node = node!.getChildAtIndex(numberOfKeys)
                    continue
                }
                // Search internal nodes
                for index in 1.stride(to: numberOfKeys, by: 1) {
                    let prev = node!.getKeyAtIndex(index - 1)
                    let next = node!.getKeyAtIndex(index)
                    if value > prev && value <= next {
                        node = node!.getChildAtIndex(index)
                        break
                    }
                }
            }
        } else {
            self.root = BTreeNode.init(parentParam: nil, maxKeySize: self.maxKeySize, maxChildrenSize: self.maxChildrenSize)
        }
        return false
    }
    
    func split(nodeToSplit:BTreeNode) {
        var node = nodeToSplit
        let numberOfKeys = node.keysSize
        let medianIndex:Int = numberOfKeys / 2
        let medianValue = node.getKeyAtIndex(medianIndex)
        let left = BTreeNode.init(parentParam: nil, maxKeySize: self.maxKeySize, maxChildrenSize: self.maxChildrenSize)
        for arrayIndex in 0.stride(to: medianIndex, by: 1) {
            left.addKey(node.getKeyAtIndex(arrayIndex))
        }
        if node.childrenSize > 0 {
            for arrayIndex in 0.stride(to: medianIndex, by: 1) {
                if let possibleChild = node.getChildAtIndex(arrayIndex) {
                    left.addChild(possibleChild)
                }
            }
        }
        let right = BTreeNode.init(parentParam: nil, maxKeySize: self.maxKeySize, maxChildrenSize: self.maxChildrenSize)
        for arrayIndex in (medianIndex + 1).stride(to: numberOfKeys, by: 1) {
            right.addKey(node.getKeyAtIndex(arrayIndex))
        }
        if node.childrenSize > 0 {
            for arrayIndex in (medianIndex + 1).stride(to: node.childrenSize, by: 1) {
                if let possibleChild = node.getChildAtIndex(arrayIndex) {
                    right.addChild(possibleChild)
                }
            }
        }
        if node.parent == nil {
            let newRoot = BTreeNode.init(parentParam: nil, maxKeySize: self.maxKeySize, maxChildrenSize: self.maxChildrenSize)
            newRoot.addKey(medianValue)
            node.parent = newRoot
            self.root = newRoot
            node = self.root!
            node.addChild(left)
            node.addChild(right)
        } else {
            let parent = node.parent!
            parent.addKey(medianValue)
            parent.removeChild(node)
            parent.addChild(left)
            parent.addChild(right)
            if parent.keysSize > self.maxKeySize {
                self.split(parent)
            }
        }
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
    
    func addChild(child:BTreeNode) {
        child.parent = self
        self.children?.append(child)
        self.childrenSize = self.childrenSize + 1
        self.children?.sortInPlace({ (lhs:BTreeNode, rhs:BTreeNode) -> Bool in
            return lhs < rhs
        })
    }
    
    func getChildAtIndex(index:Int) -> BTreeNode? {
        guard index < self.childrenSize else { return nil }
        return self.children![index]
    }
    
    func removeChild(child:BTreeNode) -> Bool {
        guard self.childrenSize > 0 else { return false }
        var found = false
        for (index, element) in (self.children?.enumerate())! {
            if element == child {
                found = true
            } else if found {
                self.children![index - 1] = self.children![index]
            }
        }
        if found {
            self.childrenSize = self.childrenSize - 1
            self.children?.removeLast()
        }
        return found
    }
    
    func removeChildAtIndex(index:Int) -> Bool {
        guard self.childrenSize > index else { return false }
        for arrayIndex in (index + 1).stride(to: self.keysSize, by: 1) {
            self.keys[arrayIndex - 1] = self.keys[arrayIndex]
        }
        self.childrenSize = self.childrenSize - 1
        self.children?.removeLast()
        return true
    }
}

extension BTreeNode : Comparable {
    
}

func < (lhs: BTreeNode, rhs: BTreeNode) -> Bool {
    return lhs.getKeyAtIndex(0) < rhs.getKeyAtIndex(0)
}

func > (lhs: BTreeNode, rhs: BTreeNode) -> Bool {
    return lhs.getKeyAtIndex(0) > rhs.getKeyAtIndex(0)
}

func == (lhs: BTreeNode, rhs: BTreeNode) -> Bool {
    return lhs.getKeyAtIndex(0) == rhs.getKeyAtIndex(0)
}