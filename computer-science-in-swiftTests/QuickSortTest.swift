import XCTest

class QuickSortTest: XCTestCase {
    
    var quickSort = QuickSort()

    func testQuickSort() {
        var original = [1]
        var sorted = quickSort.quickSort(&original);
        XCTAssert(sorted == original)
    }
    
    func testQuickSortTwo() {
        var original = [2, 1]
        var sorted = quickSort.quickSort(&original);
        XCTAssert(sorted == [1, 2])
    }
    
    func testQuickSortThree() {
        var original = [2, 1, 2, 2, 2, 0, 9]
        var sorted = quickSort.quickSort(&original);
        XCTAssert(sorted == [0, 1, 2, 2, 2, 2, 9])
    }
    
    func testQuickSortFour() {
        var original = [1, 0, -1, 100]
        var sorted = quickSort.quickSort(&original);
        XCTAssert(sorted == [-1, 0, 1, 100])
    }
}
