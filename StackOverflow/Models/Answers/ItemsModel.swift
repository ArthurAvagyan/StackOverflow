//
//  ItemsModel.swift
//  StackOverflow
//
//  Created by Arthur on 18.11.23.
//

import Foundation

struct ItemsModel<T: Decodable>: Decodable {
	let items: [T]
}
