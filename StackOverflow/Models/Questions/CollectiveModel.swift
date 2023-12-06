//
//  CollectiveModel.swift
//  StackOverflow
//
//  Created by Arthur on 02.12.23.
//

import Foundation

struct CollectiveModel: Decodable {
	let description: String
	let externalLinks: [ExternalLinkModel]?
	let link: String
	let name: String
	let slug: String
	let tags: [String]?
}
