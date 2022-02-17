//
//  Date+Extension.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 2/17/22.
//

import Foundation

extension Date {
    func timeSinceDateString() -> String {
        
        let fromDate = self
        let toDate = Date()
        
        let differencesOfDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: fromDate, to: toDate)
        
        let years = differencesOfDate.year ?? 0
        let months = differencesOfDate.month ?? 0
        let days = differencesOfDate.day ?? 0
        let hours = differencesOfDate.hour ?? 0
        let minutes = differencesOfDate.minute ?? 0
        
        if years > 0 {
            return "\(years)y"
        } else if months > 0 {
            return "\(months)mo"
        } else if days > 0 {
            return "\(days)d"
        } else if hours > 0 {
            return "\(hours)h"
        } else if minutes > 0 {
            return "\(minutes)"
        } else {
            return "0m"
        }
    }
}

extension String {
    
    func toDate(withFormat format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let date = dateFormatter.date(from: self) else {
            preconditionFailure("Take a look to your format")
        }
        return date
    }
}
