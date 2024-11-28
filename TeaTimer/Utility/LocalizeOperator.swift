//
//  LocalizeOperator.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 28.11.2024.
//

import Foundation

postfix operator ~
postfix func ~ (string: String) -> String {
    return NSLocalizedString(string, comment: "")
}
