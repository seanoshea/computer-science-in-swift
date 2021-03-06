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

class BinarySearchTreeNode {
    var value:Int = 0
    var left:BinarySearchTreeNode?
    var right:BinarySearchTreeNode?
    var visited:Bool = false
}

class BinarySearchTree {
    
    var root:BinarySearchTreeNode?
    
    func add(_ value:Int) {
        let node = BinarySearchTreeNode()
        node.value = value
        if self.root == nil {
            self.root = node
        } else {
            var current:BinarySearchTreeNode = self.root!
            while true {
                if value < current.value {
                    if current.left == nil {
                        current.left = node
                        break
                    } else {
                        current = current.left!
                    }
                } else if value > current.value {
                    if current.right == nil {
                        current.right = node
                        break
                    } else {
                        current = current.right!
                    }
                } else {
                    break
                }
            }        
        }
    }
    
    func contains(_ value:Int) -> Bool {
        var found = false
        var current = self.root
        while !found && current != nil {
            let unwrappedCurrent = current!
            if value < unwrappedCurrent.value {
                current = unwrappedCurrent.left
            } else if value > unwrappedCurrent.value {
                current = unwrappedCurrent.right
            } else {
                found = true
            }
        }
        return found
    }
    
    func size() -> Int {
        var length:Int = 0
        self.traverse { (node) -> () in
            length = length + 1
        }
        return length
    }
    
    func toArray() -> [Int] {
        var result = [Int]()
        self.traverse { (node:BinarySearchTreeNode) -> () in
            result.append(node.value)
        }
        return result
    }
    
    func toString() -> String {
        var result = ""
        self.traverse { (node:BinarySearchTreeNode) -> () in
            result += "\(node.value) "
        }
        result = result.trimmingCharacters(in: CharacterSet.whitespaces)
        return result
    }
    
    func traverse(_ fn:(BinarySearchTreeNode) -> ()) {
        self.inOrderTraversal(self.root, fn: fn)
    }
    
    func inOrderTraversal(_ node:BinarySearchTreeNode?, fn:(BinarySearchTreeNode) -> ()) {
        if let nonNilNode = node {
            if nonNilNode.left != nil {
                self.inOrderTraversal(nonNilNode.left, fn: fn)
            }
            fn(nonNilNode)
            if nonNilNode.right != nil {
                self.inOrderTraversal(nonNilNode.right, fn: fn)
            }
        }
    }
    
    
    
    func depthFirstSearchForNode(_ valueToSearchFor:Int) -> Bool {
        var nodeStack = [BinarySearchTreeNode]()
        if self.findViaDepthFirstSearch(self.root, nodeStack:&nodeStack, valueToSearchFor:valueToSearchFor) {
            return true
        }
        while nodeStack.count != 0 {
            let node = nodeStack.removeFirst()
            if self.findViaDepthFirstSearch(node.left, nodeStack:&nodeStack, valueToSearchFor:valueToSearchFor) {
                return true
            }
            if self.findViaDepthFirstSearch(node.right, nodeStack:&nodeStack, valueToSearchFor:valueToSearchFor) {
                return true
            }
        }
        return false
    }
    
    func findViaDepthFirstSearch(_ node:BinarySearchTreeNode?, nodeStack:inout [BinarySearchTreeNode], valueToSearchFor:Int) -> Bool {
        if let unwrappedNode = node {
            if !unwrappedNode.visited {
                unwrappedNode.visited = true
                nodeStack.insert(unwrappedNode, at:0)
                return unwrappedNode.value == valueToSearchFor
            }
        }
        return false
    }
}
