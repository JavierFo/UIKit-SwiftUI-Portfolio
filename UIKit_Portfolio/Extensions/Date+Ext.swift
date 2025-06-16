//
//  Date+Ext.swift
//  UIKit_Portfolio
//
//  Created by Javier FO on 16/06/25.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
    }
}
