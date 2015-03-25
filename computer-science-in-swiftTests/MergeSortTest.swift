import XCTest

class MergeSortTest : XCTestCase {
    
    var mergeSort = MergeSort()
    
    func testMergeSort() {
        var original = [1]
        var sorted = mergeSort.mergeSort(&original);
        XCTAssert(sorted == original)
    }
    
    func testMergeSortTwo() {
        var original = [2, 1]
        var sorted = mergeSort.mergeSort(&original);
        XCTAssert(sorted == [1, 2])
    }
    
    func testMergeSortThree() {
        var original = [2, 1, 2, 2, 2, 0, 9]
        var sorted = mergeSort.mergeSort(&original);
        XCTAssert(sorted == [0, 1, 2, 2, 2, 2, 9])
    }
    
    func testMergeSortFour() {
        var original = [1, 0, -1, 100]
        var sorted = mergeSort.mergeSort(&original);
        XCTAssert(sorted == [-1, 0, 1, 100])
    }
    
    func testMergeSortFive() {
        var original = [9, 6, 3]
        var sorted = mergeSort.mergeSort(&original);
        XCTAssert(sorted == [3, 6, 9])
    }
}
