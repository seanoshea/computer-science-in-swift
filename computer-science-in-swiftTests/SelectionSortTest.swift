import XCTest

class SelectionSortTest: XCTestCase {

    var selectionSort = SelectionSort();
    
    func testSortingASortedArray() {
        var original = [1, 2, 3, 4, 5, 6, 7]
        var sorted = selectionSort.selectionSort(&original)
        XCTAssert(sorted == original)
    }
    
    func testSortingAnUnsortedArray() {
        var original = [1, 2, 3, 4, 5, 9, 7]
        var sorted = selectionSort.selectionSort(&original)
        XCTAssert(sorted == [1, 2, 3, 4, 5, 7, 9])
    }
    
    func testOneItemArray() {
        var original = [1]
        var sorted = selectionSort.selectionSort(&original)
        XCTAssert(sorted == [1])
    }
    
    func testNegativeNumbersInArray() {
        var original = [-1, -2, 0, 8, 12, 3]
        var sorted = selectionSort.selectionSort(&original)
        XCTAssert(sorted == [-2, -1, 0, 3, 8, 12])
    }
    
    func testTwoNumbersInArray() {
        var original = [2, 1]
        var sorted = selectionSort.selectionSort(&original)
        XCTAssert(sorted == [1, 2])
    }

}
