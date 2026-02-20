//
//  ReminderAddVC.swift
//  Reminders
//
//  Created by Parthiv Ganguly on 2/20/26.
//

import UIKit

class ReminderAddVC: UIViewController {
    
    private lazy var editTitleTF = {
        let editTitleTF = UITextField()
        editTitleTF.placeholder = "Enter Title"
        editTitleTF.textColor = .black
        editTitleTF.font = UIFont.boldSystemFont(ofSize: 25)
        editTitleTF.layer.borderColor = UIColor.gray.cgColor
        editTitleTF.layer.borderWidth = 0.5
        editTitleTF.layer.cornerRadius = 8
        editTitleTF.textAlignment = .center
        editTitleTF.translatesAutoresizingMaskIntoConstraints = false
        
        return editTitleTF
    }()
    
    private lazy var editDescriptionTV = {
        let editDescriptionTV = UITextView()
        editDescriptionTV.contentInsetAdjustmentBehavior = .automatic
        editDescriptionTV.textColor = .black
        editDescriptionTV.font = UIFont.systemFont(ofSize: 18)
        editDescriptionTV.layer.borderColor = UIColor.gray.cgColor
        editDescriptionTV.layer.borderWidth = 0.5
        editDescriptionTV.layer.cornerRadius = 8
        editDescriptionTV.isEditable = true
        editDescriptionTV.isSelectable = true
        editDescriptionTV.translatesAutoresizingMaskIntoConstraints = false
        
        return editDescriptionTV
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
        button.setTitle("Add", for: .normal)
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.backgroundColor = .systemGreen
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addAction(UIAction { _ in
            self.reminderAddVM?.addReminder(
                title: self.editTitleTF.text,
                description: self.editDescriptionTV.text,
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
        view.addSubview(editTitleTF)
        view.addSubview(editDescriptionTV)
        view.addSubview(addDayDP)
        view.addSubview(addTimeDP)
        view.addSubview(saveButton)
        
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            editTitleTF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            editTitleTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editTitleTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            editDescriptionTV.topAnchor.constraint(equalTo: editTitleTF.bottomAnchor, constant: 15),
            editDescriptionTV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editDescriptionTV.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            editDescriptionTV.heightAnchor.constraint(equalToConstant: 150),
            
            addDayDP.topAnchor.constraint(equalTo: editDescriptionTV.bottomAnchor, constant: 15),
            addDayDP.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            addTimeDP.topAnchor.constraint(equalTo: addDayDP.bottomAnchor, constant: 15),
            addTimeDP.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            saveButton.topAnchor.constraint(equalTo: addTimeDP.bottomAnchor, constant: 50),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
        ])
    }
}
