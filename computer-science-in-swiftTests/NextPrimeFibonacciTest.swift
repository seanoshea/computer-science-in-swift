import XCTest

class NextPrimeFibonacciTest: XCTestCase {

    var nextPrimeFibonacci = NextPrimeFibonacci();

    func testIsPrime() {
        XCTAssertFalse(nextPrimeFibonacci.isPrime(-1));
        XCTAssertFalse(nextPrimeFibonacci.isPrime(0));
        XCTAssertFalse(nextPrimeFibonacci.isPrime(1));
        XCTAssert(nextPrimeFibonacci.isPrime(2));
        XCTAssert(nextPrimeFibonacci.isPrime(3));
        XCTAssert(nextPrimeFibonacci.isPrime(5));
        XCTAssert(nextPrimeFibonacci.isPrime(7));
        XCTAssert(nextPrimeFibonacci.isPrime(11));
    }
    
    func testNextPrimeFibonacci() {
        XCTAssert(nextPrimeFibonacci.nextPrimeFibonacci(-1) == 2);
        XCTAssert(nextPrimeFibonacci.nextPrimeFibonacci(0) == 2);
        XCTAssert(nextPrimeFibonacci.nextPrimeFibonacci(1) == 2);
        XCTAssert(nextPrimeFibonacci.nextPrimeFibonacci(2) == 3);
        XCTAssert(nextPrimeFibonacci.nextPrimeFibonacci(3) == 5);
        XCTAssert(nextPrimeFibonacci.nextPrimeFibonacci(4) == 5);
        XCTAssert(nextPrimeFibonacci.nextPrimeFibonacci(5) == 13);
        XCTAssert(nextPrimeFibonacci.nextPrimeFibonacci(12000) == 28657);
    }
}
