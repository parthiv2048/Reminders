//
//  ReminderAddVC.swift
//  Reminders
//
//  Created by Parthiv Ganguly on 2/20/26.
//

import UIKit

class ReminderAddVC: UIViewController {
    
    private lazy var addTitleTF = {
        let addTitleTF = UITextField()
        addTitleTF.placeholder = "Enter Title"
        addTitleTF.textColor = .black
        addTitleTF.font = UIFont.boldSystemFont(ofSize: SizeConstraints.headerFontSize.rawValue)
        addTitleTF.layer.cornerRadius = SizeConstraints.cornerRadius.rawValue
        addTitleTF.textAlignment = .left
        addTitleTF.translatesAutoresizingMaskIntoConstraints = false
        
        return addTitleTF
    }()
    
    private lazy var addDescriptionTV = {
        let addDescriptionTV = UITextView()
        addDescriptionTV.contentInsetAdjustmentBehavior = .automatic
        addDescriptionTV.textColor = .black
        addDescriptionTV.font = UIFont.systemFont(ofSize: SizeConstraints.bodyFontSize.rawValue)
        addDescriptionTV.layer.borderColor = UIColor.gray.cgColor
        addDescriptionTV.layer.borderWidth = SizeConstraints.borderWidth.rawValue
        addDescriptionTV.layer.cornerRadius = SizeConstraints.cornerRadius.rawValue
        addDescriptionTV.isEditable = true
        addDescriptionTV.isSelectable = true
        addDescriptionTV.translatesAutoresizingMaskIntoConstraints = false
        
        return addDescriptionTV
    }()
    
    private lazy var addDayDP = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        return datePicker
    }()
    
    private lazy var addTimeDP = {
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        
        return timePicker
    }()
    
    private lazy var saveButton = {
        let button = UIButton()
        button.setTitle("Add Reminder", for: .normal)
        button.layer.cornerRadius = SizeConstraints.cornerRadius.rawValue
        button.tintColor = .white
        button.backgroundColor = .systemGreen
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: SizeConstraints.bodyFontSize.rawValue)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addAction(UIAction { _ in
            self.reminderAddVM?.addReminder(
                title: self.addTitleTF.text,
                description: self.addDescriptionTV.text,
                day: self.addDayDP.date,
                time: self.addTimeDP.date
            )
            
            let reminderListVM = ReminderListVM(reminderList: self.reminderAddVM?.getReminderList())
            self.navigationController?.pushViewController(ReminderListVC(reminderListVM: reminderListVM), animated: true)
        }, for: .touchUpInside)
        
        return button
    }()
    
    private var reminderAddVM: ReminderAddVMProtocol?
    
    init(reminderAddVM: ReminderAddVMProtocol? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.reminderAddVM = reminderAddVM
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        view.backgroundColor = .white
        view.addSubview(addTitleTF)
        view.addSubview(addDescriptionTV)
        view.addSubview(addDayDP)
        view.addSubview(addTimeDP)
        view.addSubview(saveButton)
        
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            addTitleTF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            addTitleTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addTitleTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            addDescriptionTV.topAnchor.constraint(equalTo: addTitleTF.bottomAnchor, constant: 20),
            addDescriptionTV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addDescriptionTV.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            addDescriptionTV.heightAnchor.constraint(equalToConstant: 300),
            
            addDayDP.topAnchor.constraint(equalTo: addDescriptionTV.bottomAnchor, constant: 20),
            addDayDP.leadingAnchor.constraint(equalTo: addDescriptionTV.leadingAnchor),
            
            addTimeDP.topAnchor.constraint(equalTo: addDescriptionTV.bottomAnchor, constant: 20),
            addTimeDP.leadingAnchor.constraint(equalTo: addDayDP.trailingAnchor, constant: 10),
            
            saveButton.topAnchor.constraint(equalTo: addTimeDP.bottomAnchor, constant: 50),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
        ])
    }
}
