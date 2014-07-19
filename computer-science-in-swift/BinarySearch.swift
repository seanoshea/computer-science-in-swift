import Foundation

class BinarySearch {
    
    func binarySearch(items: Array<Int>, value: Int) -> Int? {
        var startIndex  = 0
        var stopIndex   = items.count - 1
        var middle:Int  = Int(floor(CDouble((stopIndex + startIndex) / 2)))
        
        while (items[middle] != value && startIndex < stopIndex) {
            if (value < items[middle]) {
                stopIndex = middle - 1
            } else if (value > items[middle]) {
                startIndex = middle + 1
            }
            middle = Int(floor(CDouble((stopIndex + startIndex) / 2)))
        }

        return (items[middle] == value) ? middle : nil;
    }
}
