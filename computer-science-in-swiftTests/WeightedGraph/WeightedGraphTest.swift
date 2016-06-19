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

class WeightedGraphTest: XCTestCase {
    
    var weightedGraph = WeightedGraph<String, Int>()
    
    override func setUp() {
        super.setUp()
        weightedGraph.addVertex("A")
        weightedGraph.addVertex("B")
        weightedGraph.addVertex("C")
        weightedGraph.addVertex("D")
        weightedGraph.addVertex("E")
        weightedGraph.addVertex("F")
        weightedGraph.addVertex("G")
        weightedGraph.addVertex("H")
        
        weightedGraph.addEdge("A", to: "B", weight: 7)
        weightedGraph.addEdge("A", to: "C", weight: 8)
        weightedGraph.addEdge("B", to: "F", weight: 2)
        weightedGraph.addEdge("C", to: "G", weight: 4)
        weightedGraph.addEdge("C", to: "F", weight: 6)
        weightedGraph.addEdge("C", to: "G", weight: 4)
        weightedGraph.addEdge("D", to: "F", weight: 8)
        weightedGraph.addEdge("E", to: "H", weight: 1)
        weightedGraph.addEdge("F", to: "G", weight: 9)
        weightedGraph.addEdge("F", to: "H", weight: 3)
    }
    
    func testWeightedGraphDescription() {
        let desc = weightedGraph.description
        XCTAssert(desc == "A -> [(\"B\", 7), (\"C\", 8)]\nB -> [(\"A\", 7), (\"F\", 2)]\nC -> [(\"A\", 8), (\"G\", 4), (\"F\", 6), (\"G\", 4)]\nD -> [(\"F\", 8)]\nE -> [(\"H\", 1)]\nF -> [(\"B\", 2), (\"C\", 6), (\"D\", 8), (\"G\", 9), (\"H\", 3)]\nG -> [(\"C\", 4), (\"C\", 4), (\"F\", 9)]\nH -> [(\"E\", 1), (\"F\", 3)]\n")
    }
}
