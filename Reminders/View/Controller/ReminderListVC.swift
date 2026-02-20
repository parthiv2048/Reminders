//
//  ViewController.swift
//  Reminders
//
//  Created by Parthiv Ganguly on 2/19/26.
//

import UIKit

class ReminderListVC: UIViewController {
    
    private lazy var reminderListHeaderLabel = {
        let header = UILabel()
        header.text = "Reminder List"
        header.textColor = .black
        header.font = UIFont.boldSystemFont(ofSize: SizeConstraints.headerFontSize.rawValue)
        header.translatesAutoresizingMaskIntoConstraints = false
        
        return header
    }()
    
    private lazy var reminderListTableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ReminderListTVC.self, forCellReuseIdentifier: "ReminderListTVC")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private lazy var addReminderButton = {
        let button = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(goToAddReminder),
        )
        
        return button
    }()
    
    private var reminderListVM: ReminderListVMProtocol?
    
    init(reminderListVM: ReminderListVMProtocol? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.reminderListVM = reminderListVM
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
        view.addSubview(reminderListHeaderLabel)
        view.addSubview(reminderListTableView)
        
        navigationItem.rightBarButtonItem = addReminderButton
        
        addConstraints()
    }
    
    @objc private func goToAddReminder() {
        let reminderAddVM = ReminderAddVM(reminderList: reminderListVM?.getReminderList())
        let reminderAddVC = ReminderAddVC(reminderAddVM: reminderAddVM)
        self.navigationController?.pushViewController(reminderAddVC, animated: true)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            reminderListHeaderLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            reminderListHeaderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            reminderListTableView.topAnchor.constraint(equalTo: reminderListHeaderLabel.bottomAnchor, constant: 15),
            reminderListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reminderListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            reminderListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ReminderListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reminderListVM?.numberOfReminders() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderListTVC") as? ReminderListTVC
        let reminder = reminderListVM?.getReminder(at: indexPath.row)
        cell?.addReminderDetails(reminder: reminder)
        
        return cell ?? UITableViewCell()
    }
}

extension ReminderListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let reminderEditVM = ReminderEditVM(reminderIndex: indexPath.row, reminderList: reminderListVM?.getReminderList())
        let reminderEditVC = ReminderEditVC(reminderEditVM: reminderEditVM)
        self.navigationController?.pushViewController(reminderEditVC, animated: true)
    }
}
