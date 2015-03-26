import Foundation

class SelectionSort {
    
    func selectionSort(inout items:Array<Int>) -> Array<Int> {
        for (var i = 0; i < items.count; i++) {
            var min = i;
            for (var j = i + 1; j < items.count; j++) {
                if items[j] < items[min] {
                    min = j;
                }
            }
            if i != min {
                exchange(&items, i:i, min:min)
            }
        }
        return items;
    }
    
    func exchange<T>(inout items:[T], i:Int, min:Int) {
        var temp = items[i]
        items[i] = items[min]
        items[min] = temp
    }
}

