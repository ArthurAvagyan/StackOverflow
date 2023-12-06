//
//  AnswerModel.swift
//  StackOverflow
//
//  Created by Arthur on 11.11.23.
//

import Foundation

struct AnswerModel: Decodable {

	let answerId: Int
	let isAccepted: Bool
	let owner: OwnerModel?
	let questionId: Int
	let score: Int
}
