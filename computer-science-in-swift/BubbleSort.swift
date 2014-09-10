import Foundation

class BubbleSort {
    
    func bubbleSort(inout items:Array<Int>) -> Array<Int> {
        
        for (var i = 0; i < (items.count - 1); i++) {
            var stop = (items.count - 1) - i
            for (var j = 0; j < stop; j++) {
                if (items[j] > items[j + 1]) {
                    exchange(&items, i: j, j: j + 1)
                }
            }
        }

        return items
    }
    
    func exchange<T>(inout items:[T], i:Int, j:Int) {
        var temp = items[i]
        items[i] = items[j]
        items[j] = temp
    }
}
