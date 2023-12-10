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

//final class DataManagerMock: GagoManager {
//	var getAllQuestionsReturnValue = ItemsModel(items: [QuestionModel(acceptedAnswerId: <#T##Int?#>,
//																	  answerCount: <#T##Int#>,
//																	  bountyAmount: <#T##Int?#>,
//																	  closedReason: <#T##String?#>,
//																	  collectives: <#T##[CollectiveModel]?#>,
//																	  isAnswered: <#T##Bool#>,
//																	  link: <#T##URL#>,
//																	  owner: <#T##ShallowUserModel#>,
//																	  postedByCollectives: <#T##[CollectiveModel]?#>,
//																	  questionId: <#T##Int#>,
//																	  score: <#T##Int#>,
//																	  tags: <#T##[String]?#>,
//																	  title: <#T##String#>,
//																	  viewCount: <#T##Int#>)])
//	
//	func getAllQuestions(page: Int, _ completion: @escaping (ItemsModel<QuestionModel>) -> ()) {
//		completion(getAllQuestionsReturnValue)
//	}
//}
