//
//  PokemonTests.swift
//  PokemonTests
//
//  Created by Paweł Kołaczyński on 22/02/2023.
//

import XCTest

final class PokemonTests: XCTestCase {
    func testPokemonAdd() throws {
        XCTAssertEqual(pokemonAdd(a: 3, b: 8), 11)
   }
    
    func testFizzBuzz() throws {
        XCTAssertEqual(fizzBuzz(16), "1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz 16")
    }
    
}
