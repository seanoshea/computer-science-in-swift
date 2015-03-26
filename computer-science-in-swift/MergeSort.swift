import Foundation

import Darwin

class MergeSort {
    
    func mergeSort(inout items:Array<Int>) -> Array<Int> {
        if items.count < 2 {
            return items;
        }
        var middle = items.count
        middle /= 2
        var left:Array<Int> = Array(items[0 ..< middle])
        var right:Array<Int> = Array(items[middle ..< items.count])
        var mergedLeft = mergeSort(&left);
        var mergedRight = mergeSort(&right);
        return merge(&mergedLeft, right:&mergedRight);
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
        result += Array<Int>(Array<Int>(left[il ..< left.count]));
        result += Array(Array(right[ir ..< right.count]));
        return result;
    }
}
