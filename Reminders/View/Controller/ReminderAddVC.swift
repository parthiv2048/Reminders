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
    
    private lazy var editDayTF = {
        let editDayTF = UITextField()
        editDayTF.placeholder = "Enter Day"
        editDayTF.textColor = .black
        editDayTF.font = UIFont.systemFont(ofSize: 18)
        editDayTF.layer.borderColor = UIColor.gray.cgColor
        editDayTF.layer.borderWidth = 0.5
        editDayTF.layer.cornerRadius = 8
        editDayTF.textAlignment = .center
        editDayTF.translatesAutoresizingMaskIntoConstraints = false
        
        return editDayTF
    }()
    
    private lazy var editTimeTF = {
        let editTimeTF = UITextField()
        editTimeTF.placeholder = "Enter Time"
        editTimeTF.textColor = .black
        editTimeTF.font = UIFont.systemFont(ofSize: 18)
        editTimeTF.layer.borderColor = UIColor.gray.cgColor
        editTimeTF.layer.borderWidth = 0.5
        editTimeTF.layer.cornerRadius = 8
        editTimeTF.textAlignment = .center
        editTimeTF.translatesAutoresizingMaskIntoConstraints = false
        
        return editTimeTF
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
            self.reminderAddVM?.addReminder(title: self.editTitleTF.text, description: self.editDescriptionTV.text, day: self.editDayTF.text, time: self.editTimeTF.text)
            
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
        view.addSubview(editDayTF)
        view.addSubview(editTimeTF)
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
            
            editDayTF.topAnchor.constraint(equalTo: editDescriptionTV.bottomAnchor, constant: 15),
            editDayTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editDayTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            
            editTimeTF.topAnchor.constraint(equalTo: editDayTF.bottomAnchor, constant: 15),
            editTimeTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editTimeTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            
            saveButton.topAnchor.constraint(equalTo: editTimeTF.bottomAnchor, constant: 40),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
        ])
    }
}
