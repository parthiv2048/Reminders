//
//  RemindersTests.swift
//  RemindersTests
//
//  Created by Parthiv Ganguly on 2/19/26.
//

import XCTest
@testable import Reminders

final class RemindersTests: XCTestCase {
    
    private var reminderAddVM: ReminderAddVM?
    private var reminderEditVM: ReminderEditVM?
    private var reminderEditVMNil: ReminderEditVM?
    private var reminderListVM: ReminderListVM?

    override func setUpWithError() throws {
        let reminderList = [
            ReminderModel(
                title: "Unload Dishwasher",
                description: "Do it before lunch",
            ),
            ReminderModel(
                title: "Take dog out for a walk",
                description: "Make sure roads aren't wet",
            ),
        ]
        reminderListVM = ReminderListVM(reminderList: reminderList)
        reminderAddVM = ReminderAddVM(reminderList: reminderList)
        reminderEditVM = ReminderEditVM(reminderIndex: 1, reminderList: reminderList)
        reminderEditVMNil = ReminderEditVM(reminderIndex: nil, reminderList: reminderList)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testReminderAddVM() {
        let oldReminderList = reminderAddVM?.getReminderList()
        reminderAddVM?.addReminder(title: "Cook dinner", description: "Beef and broccoli")
        let newReminderList = reminderAddVM?.getReminderList()
        XCTAssertEqual(newReminderList?.count, (oldReminderList?.count ?? 0) + 1)
        XCTAssertEqual(newReminderList?.last?.title, "Cook dinner")
        XCTAssertEqual(newReminderList?.last?.description, "Beef and broccoli")
    }
    
    func testReminderEditVM() {
        XCTAssertEqual(reminderEditVM?.getTitle(), "Take dog out for a walk")
        XCTAssertEqual(reminderEditVM?.getDescription(), "Make sure roads aren't wet")
        XCTAssertNil(reminderEditVM?.getDay())
        XCTAssertNil(reminderEditVM?.getTime())
        
        reminderEditVM?.setTitle(newTitle: "Load Dishwasher")
        reminderEditVM?.setDescription(newDescription: "Do it tomorrow")
        reminderEditVM?.setDay(newDay: Date())
        reminderEditVM?.setTime(newTime: Date())
        XCTAssertEqual(reminderEditVM?.getTitle(), "Load Dishwasher")
        XCTAssertEqual(reminderEditVM?.getDescription(), "Do it tomorrow")
        XCTAssertNotNil(reminderEditVM?.getDay())
        XCTAssertNotNil(reminderEditVM?.getTime())
        
        XCTAssertEqual(reminderEditVMNil?.getTitle(), "Unload Dishwasher")
        XCTAssertEqual(reminderEditVMNil?.getDescription(), "Do it before lunch")
        XCTAssertNil(reminderEditVMNil?.getDay())
        XCTAssertNil(reminderEditVMNil?.getTime())
        
        reminderEditVMNil?.setTitle(newTitle: "Load Dishwasher")
        reminderEditVMNil?.setDescription(newDescription: "Do it tomorrow")
        reminderEditVMNil?.setDay(newDay: Date())
        reminderEditVMNil?.setTime(newTime: Date())
        XCTAssertEqual(reminderEditVMNil?.getTitle(), "Load Dishwasher")
        XCTAssertEqual(reminderEditVMNil?.getDescription(), "Do it tomorrow")
        XCTAssertNotNil(reminderEditVMNil?.getDay())
        XCTAssertNotNil(reminderEditVMNil?.getTime())
    }
    
    func testReminderListVM() {
        let currentReminderList = reminderListVM?.getReminderList()
        XCTAssertEqual(currentReminderList?.count, reminderListVM?.numberOfReminders())
        XCTAssertEqual(reminderListVM?.numberOfReminders(), 2)
        let secondReminder = reminderListVM?.getReminder(at: 1)
        XCTAssertEqual(secondReminder?.title, "Take dog out for a walk")
        XCTAssertEqual(secondReminder?.description, "Make sure roads aren't wet")
    }

}
