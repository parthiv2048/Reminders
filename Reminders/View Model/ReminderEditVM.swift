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
    private var reminder: ReminderModel?
    private var reminderList: [ReminderModel]?
    
    init(reminder: ReminderModel? = nil, reminderList: [ReminderModel]? = nil) {
        self.reminder = reminder
        self.reminderList = reminderList
    }
    
    func getTitle() -> String? {
        return reminder?.title
    }
    
    func setTitle(newTitle: String?) {
        reminder?.title = newTitle
    }
    
    func getDescription() -> String? {
        return reminder?.description
    }
    
    func setDescription(newDescription: String?) {
        reminder?.description = newDescription
    }
    
    func getDay() -> Date? {
        return reminder?.day
    }
    
    func setDay(newDay: Date?) {
        reminder?.day = newDay
    }
    
    func getTime() -> Date? {
        return reminder?.time
    }
    
    func setTime(newTime: Date?) {
        reminder?.time = newTime
    }
    
    func getReminderList() -> [ReminderModel]? {
        return reminderList
    }
}
