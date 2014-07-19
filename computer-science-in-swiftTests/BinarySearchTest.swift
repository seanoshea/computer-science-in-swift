import XCTest

class BinarySearchTest: XCTestCase {

    var binarySearch = BinarySearch();
    
    func testFindItemInValue() {
        let arrayOfItems = [1, 2, 3, 5, 8, 13, 21];
        XCTAssert(binarySearch.binarySearch(arrayOfItems, value: 2) == 1);
        XCTAssert(binarySearch.binarySearch(arrayOfItems, value: 21) == 6);
        XCTAssert(binarySearch.binarySearch(arrayOfItems, value: 3) == 2);
    }
    
    func testEnsureItemsAreNotFound() {
        var arrayOfItems = [0]
        XCTAssertTrue(binarySearch.binarySearch(arrayOfItems, value: 2) == nil);
        XCTAssertTrue(binarySearch.binarySearch(arrayOfItems, value: 2) == nil);
        XCTAssertTrue(binarySearch.binarySearch(arrayOfItems, value: -1) == nil);
    }
}
