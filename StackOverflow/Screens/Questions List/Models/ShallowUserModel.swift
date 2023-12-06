//
//  ShallowUserModel.swift
//  StackOverflow
//
//  Created by Arthur on 02.12.23.
//

import Foundation

struct ShallowUserModel: Decodable {
	let acceptRate: Int?
	let accountId: Int?
	let displayName: String?
	let link: URL?
	let profileImage: URL?
	let reputation: Int?
	let userId: Int?
	let userType: UserType
}
