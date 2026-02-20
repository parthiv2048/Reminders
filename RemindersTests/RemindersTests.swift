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
        reminderEditVM = ReminderEditVM(reminderIndex: 0, reminderList: reminderList)
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
        XCTAssertEqual(reminderEditVM?.getTitle(), "Unload Dishwasher")
        XCTAssertEqual(reminderEditVM?.getDescription(), "Do it before lunch")
        XCTAssertNil(reminderEditVM?.getDay())
        XCTAssertNil(reminderEditVM?.getTime())
        reminderEditVM?.setTitle(newTitle: "Load Dishwasher")
        reminderEditVM?.setDescription(newDescription: "Do it tomorrow")
        XCTAssertEqual(reminderEditVM?.getTitle(), "Load Dishwasher")
        XCTAssertEqual(reminderEditVM?.getDescription(), "Do it tomorrow")
        XCTAssertNil(reminderEditVM?.getDay())
        XCTAssertNil(reminderEditVM?.getTime())
    }
    
    func testReminderListVM() {
        XCTAssertEqual(reminderListVM?.numberOfReminders(), 2)
        let secondReminder = reminderListVM?.getReminder(at: 1)
        XCTAssertEqual(secondReminder?.title, "Take dog out for a walk")
        XCTAssertEqual(secondReminder?.description, "Make sure roads aren't wet")
    }

}
