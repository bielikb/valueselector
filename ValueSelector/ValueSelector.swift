//
//  ValueSelector.swift
//  ValueSelector
//
//  Created by Boris Bielik on 03/03/2019.
//  Copyright © 2019 Appsode, s.r.o. All rights reserved.
//

import Foundation

public protocol ValueSelector {
    
    associatedtype Element : Equatable

    /// Empty value
    static var emptyValue: Element {get}
    
    /// values
    var values: [Element] {get}

    /// selected value
    var selectedValue: Element? {get set}

    /// selected index
    var selectedIndex: Int? {get}

    init?(values: [Element], selectedValue: Element?)

    mutating func selectValue(at index: Int)

    /// Returns element at specified index
    func value(at index: Int) -> Element?
}

public extension ValueSelector {

    public subscript (index: Int) -> Element? {
        return value(at: index)
    }

    public var selectedIndex: Int? {
        guard let selectedValue = selectedValue else {
            return nil
        }

        return values.index(of: selectedValue)
    }

    mutating public func selectValue(at index: Int) {
        selectedValue = values[index]
    }

    mutating public func selectValue(_ value: Element) {
        selectedValue = value
    }

    public func value(at index: Int) -> Element? {
        return values[safe: index]
    }
}

public protocol FormattedValueSelector : ValueSelector {
    var formattedValues: [String] {get}
    var formattedSelectedValue: String {get}
}

private extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
