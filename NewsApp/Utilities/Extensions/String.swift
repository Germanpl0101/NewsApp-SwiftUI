//
//  String.swift
//  NewsApp
//
//  Created by German Blonski on 16.02.2022.
//

import Foundation

extension String {
    
    func dateConvertion() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:SSZ"
        let newDate = formatter.date(from: self)
        formatter.setLocalizedDateFormatFromTemplate("MMMM d, yyyy - HH:mm")
        return  formatter.string(from: newDate!)
    }
}
