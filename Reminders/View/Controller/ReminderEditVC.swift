//
//  ReminderEditVC.swift
//  Reminders
//
//  Created by Parthiv Ganguly on 2/19/26.
//

import UIKit

class ReminderEditVC: UIViewController {
    
    private lazy var editTitleTF = {
        let editTitleTF = UITextField()
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
        button.setTitle("Save", for: .normal)
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.backgroundColor = .systemGreen
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addAction(UIAction { _ in
            self.reminderEditVM?.setTitle(newTitle: self.editTitleTF.text)
            self.reminderEditVM?.setDescription(newDescription: self.editDescriptionTV.text)
            self.reminderEditVM?.setDay(newDay: self.editDayTF.text)
            self.reminderEditVM?.setTime(newTime: self.editTimeTF.text)
            
            let reminderListVM = ReminderListVM(reminderList: self.reminderEditVM?.getReminderList())
            self.navigationController?.pushViewController(ReminderListVC(reminderListVM: reminderListVM), animated: true)
        }, for: .touchUpInside)
        
        return button
    }()
    
    private var reminderEditVM: ReminderEditVMProtocol?
    
    init(reminderEditVM: ReminderEditVMProtocol? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.reminderEditVM = reminderEditVM
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
        
        editTitleTF.text = reminderEditVM?.getTitle()
        editDescriptionTV.text = reminderEditVM?.getDescription()
        editDayTF.text = reminderEditVM?.getDay()
        editTimeTF.text = reminderEditVM?.getTime()
        
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
            
            saveButton.topAnchor.constraint(equalTo: editTimeTF.bottomAnchor, constant: 25),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
        ])
    }
}
