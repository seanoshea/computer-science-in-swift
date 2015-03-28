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

class MergeSort {
    
    func mergeSort(inout items:Array<Int>) -> Array<Int> {
        if items.count < 2 {
            return items
        }
        var middle = items.count
        middle /= 2
        var left:Array<Int> = Array(items[0 ..< middle])
        var right:Array<Int> = Array(items[middle ..< items.count])
        var mergedLeft = mergeSort(&left)
        var mergedRight = mergeSort(&right)
        return merge(&mergedLeft, right:&mergedRight)
    }
    
    func merge(inout left:Array<Int>, inout right:Array<Int>) -> Array<Int> {
        var result:Array<Int> = [Int]()
        var il = 0
        var ir = 0
        while (il < left.count && ir < right.count) {
            if left[il] < right[ir] {
                var element = left[il++]
                result.append(element)
            } else {
                var element = right[ir++]
                result.append(element)
            }
        }
        result += Array<Int>(Array<Int>(left[il ..< left.count]))
        result += Array(Array(right[ir ..< right.count]))
        return result
    }
}
