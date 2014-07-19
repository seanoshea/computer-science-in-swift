import Foundation

class BubbleSort {
    
    func bubbleSort(items:Array<Int>) -> Array<Int> {
        
        for (var i = 0; i < (items.count - 1); i++) {
            var stop = (items.count - 1) - i
            for (var j = 0; j < stop; j++) {
                if (items[j] > items[j + 1]) {
                    var temp = items[j]
                    items[j] = items[j + 1]
                    items[j + 1] = temp
                }
            }
        }

        return items
    }
}
