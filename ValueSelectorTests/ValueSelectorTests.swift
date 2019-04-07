//
//  ValueSelectorTests.swift
//  ValueSelectorTests
//
//  Created by Boris Bielik on 03/03/2019.
//  Copyright © 2019 Appsode, s.r.o. All rights reserved.
//

import XCTest
@testable import ValueSelector

enum SportType: String, CaseIterable {
    case rugby
    case tennis
    case hockey
}

struct SportSelector: ValueSelector {
    var formattedValues: [String] {
        return values.map { $0.description }
    }

    var formattedSelectedValue: String {
        return selectedValue?.description ?? "No color selected"
    }

    static var emptyValue = ""

    let values: [String]
    var selectedValue: String?

    init?(values: [String], selectedValue: String?) {
        self.values = values
        self.selectedValue = selectedValue
    }
}

class SportSelectorTests: XCTestCase {

    var sut: SportSelector?
    var sports: [String] {
        return SportType.allCases.map { $0.rawValue }
    }

    override func setUp() {

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testItHasNoSelectedValueWhenNoneIsProvided() {
        // given
        let selectedValue: String? = nil

        // when
        sut = SportSelector(values: sports, selectedValue: nil)

        // then
        XCTAssertTrue(sut?.selectedValue == selectedValue)
        XCTAssertNil(sut?.selectedIndex)
    }

    func testItHasAllSports() {
        // when
        sut = SportSelector(values: sports, selectedValue: nil)

        // then
        XCTAssertEqual(sut?.values, sports)
        XCTAssertEqual(sut?[0], "rugby")
        XCTAssertEqual(sut?[1], "tennis")
        XCTAssertEqual(sut?[2], "hockey")
    }

    func testItHasRugbySelected() {
        // given
        let selectedValue = "rugby"

        // when
        sut = SportSelector(values: sports, selectedValue: selectedValue)

        // then
        XCTAssertTrue(sut?.selectedValue == selectedValue)
        XCTAssertTrue(sut?.selectedIndex == 0)
    }

    func testSelectingTennisWillChangeSelectedValue() {
        // given
        let selectedValue = "rugby"
        sut = SportSelector(values: sports, selectedValue: selectedValue)

        // when
        sut?.selectValue("tennis")


        // then
        XCTAssertTrue(sut?.selectedValue == "tennis")
        XCTAssertTrue(sut?.selectedIndex == 1)
    }

}
