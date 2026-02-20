//
//  ReminderModel.swift
//  Reminders
//
//  Created by Parthiv Ganguly on 2/19/26.
//

class ReminderModel {
    var title: String?
    var description: String?
    var day: String?
    var time: String?
    
    init(title: String? = nil, description: String? = nil, day: String? = nil, time: String? = nil) {
        self.title = title
        self.description = description
        self.day = day
        self.time = time
    }
}
