//
//  UserType.swift
//  StackOverflow
//
//  Created by Arthur on 11.11.23.
//

import Foundation

enum UserType: String, Codable {
	
	case unregistered, 
		 registered,
		 moderator,
		 teamAdmin,
		 doesNotExist = "does_not_exist"
}
