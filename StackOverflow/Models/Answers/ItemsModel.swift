//
//  ItemsModel.swift
//  StackOverflow
//
//  Created by Arthur on 18.11.23.
//

import Foundation

class ItemsModel<T: Decodable>: Decodable {
	let items: [T]
}
