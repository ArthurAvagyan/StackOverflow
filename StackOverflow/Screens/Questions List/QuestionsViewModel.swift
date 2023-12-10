//
//  QuestionsViewModel.swift
//  StackOverflow
//
//  Created by Arthur on 26.11.23.
//

import Foundation

class QuestionsViewModel {
	
	// MARK: - Managers
	private let dataManager: QuestionProvider
	private let paginationManager: PaginationProvider
	
	// MARK: - Parameters
	private var questions: [QuestionModel] {
		didSet {
			onQuestionsSet()
		}
	}
	
	var onQuestionsSet: (() -> ())!
	var didSelectQuestion: ((QuestionModel) -> ())!
	private(set) var isLoading = Observable(false)
	
	init(dataManager: QuestionProvider = DataManager(),
		 paginationManager: PaginationProvider = PaginationManager()) {
		self.dataManager = dataManager
		self.paginationManager = paginationManager
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
	
	func title(for indextPath: IndexPath) -> String {
		questions[indextPath.row].title
	}
}
