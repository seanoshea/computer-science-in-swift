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

struct Item {
    var priority:Int
    var item:String
}

struct Queue<QueueItem> {
    var items = [Item]()
    mutating func enqueue(priority:Int, item:String) {
        let queueItem = Item(priority: 0, item:item)
        items.append(queueItem)
    }
    mutating func dequeue() -> Item? {
        return items.removeAtIndex(0)
    }
    mutating func sort() {
        items.sortInPlace { (one, two) -> Bool in
            return one.priority > two.priority
        }
    }
    func isEmpty() -> Bool {
        return self.items.count == 0
    }
}

class ShortestPath {
    
    func findShortestPathInGraph(graph:WeightedGraph<String, Int>, from:String, to:String) {
        var nodes = Queue<Item>()
        var distances = [String: Int]()
        for vertex in graph.vertices {
            if vertex == from {
                distances[vertex] = 0
                nodes.enqueue(0, item:vertex)
            } else {
                distances[vertex] = Int.max
                nodes.enqueue(Int.max, item:vertex)
            }
        }
    }
}