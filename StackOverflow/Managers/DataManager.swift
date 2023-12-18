//
//  DataManager.swift
//  StackOverflow
//
//  Created by Arthur on 11.11.23.
//

import Foundation

protocol AnswerProvider {
	func getAllAnswers(page: Int, _ completion: @escaping (ItemsModel<AnswerModel>) -> ())
}

protocol QuestionProvider {
	func getAllQuestions(page: Int, _ completion: @escaping (ItemsModel<QuestionModel>) -> ())
}


final class DataManager: QuestionProvider, AnswerProvider {
	
	private let networking: Networkable
	
	init(networking: Networkable = Networking.default) {
		self.networking = networking
	}
	
	func getAllAnswers(page: Int, _ completion: @escaping (ItemsModel<AnswerModel>) -> ()) {
		networking.get(form: .answers,
					   with: [
						URLQueryItem(name: "order", value: "desc"),
						URLQueryItem(name: "sort", value: "activity"),
						URLQueryItem(name: "site", value: "stackoverflow"),
						URLQueryItem(name: "page", value: "\(page)")
					   ],
					   completion,
					   nil)
	}
	
	func getAllQuestions(page: Int, _ completion: @escaping (ItemsModel<QuestionModel>) -> ()) {
		networking.get(form: .questions,
					   with: [
						URLQueryItem(name: "order", value: "desc"),
						URLQueryItem(name: "sort", value: "activity"),
						URLQueryItem(name: "site", value: "stackoverflow"),
						URLQueryItem(name: "page", value: "\(page)")
					   ],
					   completion,
					   nil)
	}
}
