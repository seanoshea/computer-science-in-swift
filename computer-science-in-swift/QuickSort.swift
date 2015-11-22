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

import Foundation

import Darwin

class QuickSort {
    
    func quickSort(inout items:Array<Int>) -> Array<Int> {
        let left:Int = 0
        let right:Int = items.count - 1
        return qs(&items, left:left, right:right)
    }
    
    func qs(inout items:Array<Int>, left:Int = 0, right:Int) -> Array<Int> {
        var index:Int
        if items.count > 1 {
            index = partition(&items, left:left, right:right)
            if left < index - 1 {
                qs(&items, left:left, right:index - 1)
            }
            if (index < right) {
                qs(&items, left:index, right:right)
            }
        }
        return items
    }
    
    func partition(inout items:Array<Int>, left:Int = 0, right:Int) -> Int {
        let index:Int = Int(Double((right + left) / 2))
        let pivot = items[index]
        var i = left
        var j = right
        while (i <= j) {
            while (items[i] < pivot) {
                i++
            }
            while (items[j] > pivot) {
                j--
            }
            if i <= j {
                exchange(&items, i:i, j:j)
                i++
                j--
            }
        }
        return i
    }
    
    func exchange<T>(inout items:[T], i:Int, j:Int) {
        let temp = items[i]
        items[i] = items[j]
        items[j] = temp
    }
}