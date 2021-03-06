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

class QuickSort {
    
    func quickSort(_ items:inout [Int]) -> [Int] {
        let left:Int = 0
        let right:Int = items.count - 1
        return qs(&items, left:left, right:right)
    }
    
    func qs(_ items:inout [Int], left:Int = 0, right:Int) -> [Int] {
        var index:Int
        if items.count > 1 {
            index = partition(&items, left:left, right:right)
            if left < index - 1 {
                _ = qs(&items, left:left, right:index - 1)
            }
            if index < right {
                _ = qs(&items, left:index, right:right)
            }
        }
        return items
    }
    
    func partition(_ items:inout [Int], left:Int = 0, right:Int) -> Int {
        let index:Int = Int(Double((right + left) / 2))
        let pivot = items[index]
        var i = left
        var j = right
        while i <= j {
            while items[i] < pivot {
                i = i + 1
            }
            while items[j] > pivot {
                j = j - 1
            }
            if i <= j {
                exchange(&items, i:i, j:j)
                i = i + 1
                j = j - 1
            }
        }
        return i
    }
    
    func exchange<T>(_ items:inout [T], i:Int, j:Int) {
        let temp = items[i]
        items[i] = items[j]
        items[j] = temp
    }
}
