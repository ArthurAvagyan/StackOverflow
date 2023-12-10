//
//  QuestionModel.swift
//  StackOverflow
//
//  Created by Arthur on 02.12.23.
//

import Foundation

struct QuestionModel: Decodable {
	let acceptedAnswerId: Int?
	let answerCount: Int
	let bountyAmount: Int?
	let closedReason: String?
	let collectives: [CollectiveModel]?
	let isAnswered: Bool
	let link: URL
	let owner: ShallowUserModel
	let postedByCollectives: [CollectiveModel]?
	let questionId: Int
	let score: Int
	let tags: [String]?
	let title: String
	let viewCount: Int
}

//extension QuestionModel {
//	static let mock = QuestionModel(acceptedAnswerId: <#T##Int?#>, answerCount: <#T##Int#>, bountyAmount: <#T##Int?#>, closedReason: <#T##String?#>, collectives: <#T##[CollectiveModel]?#>, isAnswered: <#T##Bool#>, link: <#T##URL#>, owner: <#T##ShallowUserModel#>, postedByCollectives: <#T##[CollectiveModel]?#>, questionId: <#T##Int#>, score: <#T##Int#>, tags: <#T##[String]?#>, title: <#T##String#>, viewCount: <#T##Int#>)
//}
