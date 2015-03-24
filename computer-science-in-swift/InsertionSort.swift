import Foundation

class InsertionSort {
    
    func insertionSort(inout items:Array<Int>) -> Array<Int> {
        let len = items.count
        var value:Int
        var i:Int
        var j:Int
        for (i = 0; i < len; i++) {
            value = items[i];
            for (j = i - 1; j > -1 && items[j] > value; j--) {
                items[j+1] = items[j];
            }
            items[j + 1] = value;
        }
        return items;
    }
}