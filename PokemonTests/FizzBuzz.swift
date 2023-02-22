//
//  FizzBuzz.swift
//  PokemonTests
//
//  Created by Paweł Kołaczyński on 22/02/2023.
//

import Foundation

func numToFizzBuzz(num: Int) -> String {
    if num % 15 == 0 {
        return "FizzBuzz"
    }
    if num % 3 == 0 {
        return "Fizz"
    }
    if num % 5 == 0 {
        return "Buzz"
    }
    return "\(num)"
}

func fizzBuzz(_ n: Int) -> String {
    (1...n)
        .map({
            numToFizzBuzz(num: $0)
        })
        .joined(separator: " ")
}

