//
//  DataManager.swift
//  StackOverflow
//
//  Created by Arthur on 11.11.23.
//

import Foundation

final class DataManager {
    
    
	func getAllAnswers(page: Int? = nil, _ completion: @escaping (ItemsModel<AnswerModel>) -> ()) {
//		Networking.default.get(form: .answers,
//								   with: [
//									URLQueryItem(name: "order", value: "desc"),
//									URLQueryItem(name: "sort", value: "activity"),
//									URLQueryItem(name: "site", value: "stackoverflow")
//								   ],
//								   completion)
		
		var queryItems = [
			URLQueryItem(name: "order", value: "desc"),
			URLQueryItem(name: "sort", value: "activity"),
			URLQueryItem(name: "site", value: "stackoverflow")
		]
		
		if let page = page {
			queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
		}
		
		Networking.default.get(form: .answers,
							   with: queryItems,
							   completion)
    }
	
	func getAllQuestions(page: Int? = nil, _ completion: @escaping (ItemsModel<QuestionModel>) -> ()) {
		var queryItems = [
			URLQueryItem(name: "order", value: "desc"),
			URLQueryItem(name: "sort", value: "activity"),
			URLQueryItem(name: "site", value: "stackoverflow")
		]
		
		if let page = page {
			queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
		}
		
		Networking.default.get(form: .questions,
							   with: queryItems,
							   completion)
	}
}
