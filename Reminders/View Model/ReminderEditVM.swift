//
//  ReminderEditVM.swift
//  Reminders
//
//  Created by Parthiv Ganguly on 2/19/26.
//

import UIKit

protocol ReminderEditVMProtocol {
    func getTitle() -> String?
    func setTitle(newTitle: String?)
    func getDescription() -> String?
    func setDescription(newDescription: String?)
    func getDay() -> Date?
    func setDay(newDay: Date?)
    func getTime() -> Date?
    func setTime(newTime: Date?)
    func getReminderList() -> [ReminderModel]?
}

class ReminderEditVM: ReminderEditVMProtocol {
    private var reminderIndex: Int?
    private var reminderList: [ReminderModel]?
    
    init(reminderIndex: Int? = 0, reminderList: [ReminderModel]? = nil) {
        self.reminderIndex = reminderIndex
        self.reminderList = reminderList
    }
    
    func getTitle() -> String? {
        return reminderList?[reminderIndex ?? 0].title
    }
    
    func setTitle(newTitle: String?) {
        reminderList?[reminderIndex ?? 0].title = newTitle
    }
    
    func getDescription() -> String? {
        return reminderList?[reminderIndex ?? 0].description
    }
    
    func setDescription(newDescription: String?) {
        reminderList?[reminderIndex ?? 0].description = newDescription
    }
    
    func getDay() -> Date? {
        return reminderList?[reminderIndex ?? 0].day
    }
    
    func setDay(newDay: Date?) {
        reminderList?[reminderIndex ?? 0].day = newDay
    }
    
    func getTime() -> Date? {
        return reminderList?[reminderIndex ?? 0].time
    }
    
    func setTime(newTime: Date?) {
        reminderList?[reminderIndex ?? 0].time = newTime
    }
    
    func getReminderList() -> [ReminderModel]? {
        return reminderList
    }
}
