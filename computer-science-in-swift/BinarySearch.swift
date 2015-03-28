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

class BinarySearch {
    
    func binarySearch(items: Array<Int>, value: Int) -> Int? {
        var startIndex = 0
        var stopIndex = items.count - 1
        var middle:Int = Int(floor(CDouble((stopIndex + startIndex) / 2)))
        while (items[middle] != value && startIndex < stopIndex) {
            if value < items[middle] {
                stopIndex = middle - 1
            } else if value > items[middle] {
                startIndex = middle + 1
            }
            middle = Int(floor(CDouble((stopIndex + startIndex) / 2)))
        }
        return (items[middle] == value) ? middle : nil
    }
}
