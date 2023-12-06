//
//  OwnerModel.swift
//  StackOverflow
//
//  Created by Arthur on 11.11.23.
//

import Foundation

struct OwnerModel: Decodable {
	
	let accountId: Int?
	let reputation: Int?
	let userId: Int?
	let userType: UserType
	let acceptRate: Int?
	let profileImage: URL?
	let displayName: String
	let link: URL?
}
