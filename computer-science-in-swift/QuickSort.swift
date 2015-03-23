import Foundation

import Darwin

class QuickSort {
    
    func quickSort(inout items:Array<Int>) -> Array<Int> {
        var left:Int = 0
        var right:Int = items.count - 1
        return qs(&items, left:left, right:right)
    }
    
    func qs(inout items:Array<Int>, left:Int = 0, right:Int) -> Array<Int> {
        var index:Int
        if (items.count > 1) {
            index = partition(&items, left:left, right:right)
            if (left < index - 1) {
                qs(&items, left:left, right:index - 1)
            }
            if (index < right) {
                qs(&items, left:index, right:right)
            }
        }
        return items
    }
    
    func partition(inout items:Array<Int>, left:Int = 0, right:Int) -> Int {
        var index:Int = Int(Double((right + left) / 2))
        var pivot = items[index]
        var i = left
        var j = right
        while (i <= j) {
            while (items[i] < pivot) {
                i++
            }
            while (items[j] > pivot) {
                j--
            }
            if (i <= j) {
                exchange(&items, i:i, j:j)
                i++
                j--
            }
        }
        return i;
    }
    
    func exchange<T>(inout items:[T], i:Int, j:Int) {
        var temp = items[i]
        items[i] = items[j]
        items[j] = temp
    }
}