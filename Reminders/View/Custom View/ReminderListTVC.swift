//
//  ReminderListTVC.swift
//  Reminders
//
//  Created by Parthiv Ganguly on 2/19/26.
//

import UIKit

class ReminderListTVC: UITableViewCell {
    
    private lazy var titleLabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: SizeConstraints.bodyFontSize.rawValue)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    private lazy var descriptionLabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.textColor = .black
        descriptionLabel.font = UIFont.systemFont(ofSize: SizeConstraints.bodyFontSize.rawValue)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return descriptionLabel
    }()
    
    private lazy var timeLabel = {
        let timeLabel = UILabel()
        timeLabel.textColor = .systemBlue
        timeLabel.font = UIFont.systemFont(ofSize: SizeConstraints.bodyFontSize.rawValue)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return timeLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setUpCell() {
        contentView.backgroundColor = .white
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(timeLabel)
        
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
            
            timeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15),
            timeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
    func addReminderDetails(reminder: ReminderModel?) {
        titleLabel.text = reminder?.title ?? ""
        descriptionLabel.text = reminder?.description ?? ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let reminderDay = dateFormatter.string(from: reminder?.day ?? Date())
        
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        let reminderTime = timeFormatter.string(from: reminder?.time ?? Date())
        
        timeLabel.text = "Due on \(reminderDay), \(reminderTime)"
    }
}
