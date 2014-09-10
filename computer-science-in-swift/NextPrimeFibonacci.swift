import Foundation
import UIKit

class NextPrimeFibonacci {
    
    var map = Dictionary<Int, Int>()
    
    func nextPrimeFibonacci(input: Int) -> Int {
        var nextPrimeFibonacci = 0
        while (true) {
            var num = fibonacci(nextPrimeFibonacci)
            if (num > input && isPrime(num)) {
                nextPrimeFibonacci = num
                break;
            }
            nextPrimeFibonacci++
        }
        return nextPrimeFibonacci
    }
    
    func isPrime(input: Int) -> Bool {
        var isPrime = input >= 2
        if (isPrime) {
            for (var i = 2; i < input - 1; i++) {
                if (input % i == 0) {
                    isPrime = false
                    break;
                }
            }
        }
        return isPrime;
    }
    
    func fibonacci(input: Int) -> Int {
        if (input <= 1) {
            return 1
        } else {
            let memoized = map[input]
            if ((memoized) != nil) {
                return memoized!
            } else {
                map[input] = fibonacci(input - 1) + fibonacci(input - 2)
                return map[input]!
            }
        }
    }
}