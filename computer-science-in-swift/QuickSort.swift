import Foundation

class QuickSort {

    func quickSort(inout items:Array<Int>, left:Int?=0, right:Int?) -> Array<Int> {
        return items;
    }
    
    func exchange<T>(inout items:[T], i:Int, j:Int) {
        var temp = items[i]
        items[i] = items[j]
        items[j] = temp
    }
}