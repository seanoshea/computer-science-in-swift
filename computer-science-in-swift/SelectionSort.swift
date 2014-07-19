import Foundation

class SelectionSort {
    
    func selectionSort(items:Array<Int>) -> Array<Int> {
        
        for (var i = 0; i < items.count; i++) {
            var min = i;
            for (var j = i + 1; j < items.count; j++) {
                if (items[j] < items[min]) {
                    min = j;
                }
            }
            if (i != min) {
                var temp = items[i]
                items[i] = items[min]
                items[min] = temp
            }
        }
        
        return items;
    }
}

