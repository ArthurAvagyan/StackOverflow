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
