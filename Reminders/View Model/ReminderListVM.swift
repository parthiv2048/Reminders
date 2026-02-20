//
//  ReminderListVM.swift
//  Reminders
//
//  Created by Parthiv Ganguly on 2/19/26.
//

protocol ReminderListVMProtocol {
    func getReminder(at: Int) -> ReminderModel?
    func numberOfReminders() -> Int
    func getReminderList() -> [ReminderModel]?
}

class ReminderListVM: ReminderListVMProtocol {
    private var reminderList: [ReminderModel]?
    
    init(reminderList: [ReminderModel]? = []) {
        self.reminderList = reminderList
    }
    
    func getReminder(at: Int) -> ReminderModel? {
        return reminderList?[at]
    }
    
    func numberOfReminders() -> Int {
        return reminderList?.count ?? 0
    }
    
    func getReminderList() -> [ReminderModel]? {
        return reminderList
    }
}
