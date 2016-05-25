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

class MergeSort {
    
    func mergeSort(inout items:[Int]) -> [Int] {
        if items.count < 2 {
            return items
        }
        var middle = items.count
        middle /= 2
        var left:[Int] = [Int](items[0 ..< middle])
        var right:[Int] = [Int](items[middle ..< items.count])
        var mergedLeft = mergeSort(&left)
        var mergedRight = mergeSort(&right)
        return merge(&mergedLeft, right:&mergedRight)
    }
    
    func merge(inout left:[Int], inout right:[Int]) -> [Int] {
        var result:[Int] = [Int]()
        var il = 0
        var ir = 0
        while il < left.count && ir < right.count {
            if left[il] < right[ir] {
                let element = left[il]
                il = il + 1
                result.append(element)
            } else {
                let element = right[ir]
                ir = ir + 1
                result.append(element)
            }
        }
        result += [Int]([Int](left[il ..< left.count]))
        result += [Int]([Int](right[ir ..< right.count]))
        return result
    }
}
