//
//  DecimalUtil.swift
//  Bankey
//
//  Created by Mitya Kim on 8/9/22.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
