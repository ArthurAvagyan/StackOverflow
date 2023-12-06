//
//  DataManager.swift
//  StackOverflow
//
//  Created by Arthur on 11.11.23.
//

import Foundation

final class DataManager {
    
    
	func getAllAnswers(page: Int, _ completion: @escaping (ItemsModel<AnswerModel>) -> ()) {
		Networking.default.get(form: .answers,
							   with: [
								URLQueryItem(name: "order", value: "desc"),
								URLQueryItem(name: "sort", value: "activity"),
								URLQueryItem(name: "site", value: "stackoverflow"),
								URLQueryItem(name: "page", value: "\(page)")
							   ],
							   completion)
    }
	
	func getAllQuestions(page: Int, _ completion: @escaping (ItemsModel<QuestionModel>) -> ()) {
		Networking.default.get(form: .questions,
							   with: [
								URLQueryItem(name: "order", value: "desc"),
								URLQueryItem(name: "sort", value: "activity"),
								URLQueryItem(name: "site", value: "stackoverflow"),
								URLQueryItem(name: "page", value: "\(page)")
							   ],
							   completion)
	}
}
