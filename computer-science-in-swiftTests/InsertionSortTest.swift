import XCTest

class InsertionSortTest: XCTestCase {
    
    var insertionSort = InsertionSort()
    
    func testInsertionSort() {
        var original = [1]
        var sorted = insertionSort.insertionSort(&original);
        XCTAssert(sorted == original)
    }
    
    func testInsertionSortTwo() {
        var original = [2, 1]
        var sorted = insertionSort.insertionSort(&original);
        XCTAssert(sorted == [1, 2])
    }
    
    func testInsertionSortThree() {
        var original = [2, 1, 2, 2, 2, 0, 9]
        var sorted = insertionSort.insertionSort(&original);
        XCTAssert(sorted == [0, 1, 2, 2, 2, 2, 9])
    }
    
    func testInsertionSortFour() {
        var original = [1, 0, -1, 100]
        var sorted = insertionSort.insertionSort(&original);
        XCTAssert(sorted == [-1, 0, 1, 100])
    }
    
    func testInsertionSortFive() {
        var original = [9, 6, 3]
        var sorted = insertionSort.insertionSort(&original);
        XCTAssert(sorted == [3, 6, 9])
    }
}
