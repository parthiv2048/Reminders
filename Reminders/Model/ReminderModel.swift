//
//  ReminderModel.swift
//  Reminders
//
//  Created by Parthiv Ganguly on 2/19/26.
//

import UIKit

class ReminderModel {
    var title: String?
    var description: String?
    var day: Date?
    var time: Date?
    
    init(title: String? = nil, description: String? = nil, day: Date? = nil, time: Date? = nil) {
        self.title = title
        self.description = description
        self.day = day
        self.time = time
    }
}
