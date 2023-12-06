//
//  Observable.swift
//  StackOverflow
//
//  Created by Arthur on 06.12.23.
//

import Foundation

final class Observable<T> {

//	typealias Listener = (T) -> Void
	var listener: ((T) -> Void)?
	
	var value: T {
		didSet {
			listener?(value)
		}
	}
	
	init(_ value: T) {
		self.value = value
	}
	
//	func bindAndNotify(listener: Listener?) {
//		self.listener = listener
//		listener?(value)
//	}
//	
//	func bind(listener: Listener?) {
//		self.listener = listener
//	}
}
