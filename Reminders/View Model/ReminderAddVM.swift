//
//  ReminderAddVM.swift
//  Reminders
//
//  Created by Parthiv Ganguly on 2/20/26.
//

protocol ReminderAddVMProtocol {
    func addReminder(title: String?, description: String?, day: String?, time: String?)
    func getReminderList() -> [ReminderModel]?
}

class ReminderAddVM: ReminderAddVMProtocol {
    private var reminderList: [ReminderModel]?
    
    init(reminderList: [ReminderModel]? = nil) {
        self.reminderList = reminderList
    }
    
    func addReminder(title: String?, description: String?, day: String?, time: String?) {
        reminderList?.append(ReminderModel(
            title: title,
            description: description,
            day: day,
            time: time
        ))
    }
    
    func getReminderList() -> [ReminderModel]? {
        return reminderList
    }
}
