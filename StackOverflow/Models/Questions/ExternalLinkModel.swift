//
//  ExternalLinkModel.swift
//  StackOverflow
//
//  Created by Arthur on 02.12.23.
//

import Foundation

struct ExternalLinkModel: Decodable {
	let link: URL
	let type: ExternalLinkType
}
