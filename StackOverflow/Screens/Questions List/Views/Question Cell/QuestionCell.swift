//
//  QuestionCell.swift
//  StackOverflow
//
//  Created by Arthur on 29.11.23.
//

import UIKit

class QuestionCell: UITableViewCell {
	
	@IBOutlet weak var label: UILabel!
}

extension QuestionCell {
	
	func configure(with title: String) {
		label.textColor = .systemGray
		label.text = title
	}
}
