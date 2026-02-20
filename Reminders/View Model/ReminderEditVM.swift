//
//  ReminderEditVM.swift
//  Reminders
//
//  Created by Parthiv Ganguly on 2/19/26.
//

protocol ReminderEditVMProtocol {
    func getTitle() -> String?
    func setTitle(newTitle: String?)
    func getDescription() -> String?
    func setDescription(newDescription: String?)
    func getDay() -> String?
    func setDay(newDay: String?)
    func getTime() -> String?
    func setTime(newTime: String?)
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
        return reminder?.title ?? ""
    }
    
    func setTitle(newTitle: String?) {
        reminder?.title = newTitle
    }
    
    func getDescription() -> String? {
        return reminder?.description ?? ""
    }
    
    func setDescription(newDescription: String?) {
        reminder?.description = newDescription
    }
    
    func getDay() -> String? {
        return reminder?.day ?? ""
    }
    
    func setDay(newDay: String?) {
        reminder?.day = newDay
    }
    
    func getTime() -> String? {
        return reminder?.time ?? ""
    }
    
    func setTime(newTime: String?) {
        reminder?.time = newTime
    }
    
    func getReminderList() -> [ReminderModel]? {
        return reminderList
    }
}
