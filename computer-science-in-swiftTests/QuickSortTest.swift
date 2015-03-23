import XCTest

class QuickSortTest: XCTestCase {
    
    var quickSort = QuickSort()

    func testQuickSort() {
        var original = []
        var sorted = quickSort.quickSort(&original);
        XCTAssert(sorted == original)
    }
}
