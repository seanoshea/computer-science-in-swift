import Foundation

import Darwin

class MergeSort {
    
    func mergeSort(inout items:Array<Int>) -> Array<Int> {
        if (items.count < 2) {
            return items;
        }
        
        var middle:Int = Int(floor(CDouble(items.count / 2)))
        var left = items[0 ..< middle]
        var right = items[middle ..< items.count]
        return merge(&mergeSort(&left), right:&mergeSort(&right))
    }
    
    func merge(inout left:Array<Int>, inout right:Array<Int>) {
        var result = []
        var il = 0
        var ir = 0
        while (il < left.count && ir < right.count) {
            if (left[il] < right[ir]) {
                result.push(left[il++]);
            } else {
                result.push(right[ir++]);
            }
        }
        return result.concat(left.slice(il)).concat(right.slice(ir));
    }
}
