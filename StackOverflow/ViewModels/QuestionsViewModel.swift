//
//  QuestionsViewModel.swift
//  StackOverflow
//
//  Created by Arthur on 26.11.23.
//

import Foundation
import UIKit.UITableView

class QuestionsViewModel {
	private let dataManager: DataManager
	private let paginationManager: PaginationManager
	private var questions: [QuestionModel] {
		didSet {
			updateUI()
		}
	}
	
	var updateUI: (() -> ())!
	var didSelectQuestion: ((QuestionModel) -> ())!
	private(set) var isLoading = Observable(false)
	
	init() {
		dataManager = DataManager()
		paginationManager = PaginationManager()
		questions = []
		paginationManager.isLoading.listener = { [weak self] isLoading in
			guard let self = self else { return }
			self.isLoading.value = isLoading
		}
	}
}

extension QuestionsViewModel {
	
	func didSelectRow(at indexpath: IndexPath) {
		didSelectQuestion(questions[indexpath.row])
	}
	
	@objc func refresh(_ sender: AnyObject) {
		paginationManager.reload(for: dataManager.getAllQuestions) { [weak self] model in
			guard let self = self else { return }
			self.questions = model.items
		}
	}
	
	func scrollsToBottom() {
		paginationManager.getNextPage(for: dataManager.getAllQuestions) { [weak self] model in
			guard let self = self else { return }
			self.questions.append(contentsOf: model.items)
		}
	}
}

extension QuestionsViewModel {
	
	var answersCount: Int {
		 get {
			 questions.count
		}
	}
	
	func configure(cell: QuestionCell, at indextPath: IndexPath) {
		cell.configure(with: questions[indextPath.row].title)
	}
}
