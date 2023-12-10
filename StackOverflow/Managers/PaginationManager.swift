//
//  PaginationManager.swift
//  StackOverflow
//
//  Created by Arthur on 04.12.23.
//

import Foundation

protocol PaginationProvider {
	
	var isLoading: Observable<Bool> { get }
	
	func reload<T: Decodable>(for function: (Int, @escaping (T) -> ()) -> (),
							  _ completion: @escaping (T) -> ())
	
	func getNextPage<T: Decodable>(for function: (Int, @escaping (T) -> ()) -> (),
					 _ completion: @escaping (T) -> ())
}

final class PaginationManager: PaginationProvider {
	
	private var currentPage = 0
	private var isLastPage = false
	private(set) var isLoading = Observable(false)
	
	func reload<T: Decodable>(for function: (Int, @escaping (T) -> ()) -> (),
							  _ completion: @escaping (T) -> ()) {
		guard !isLoading.value else { return }
		currentPage = 0
		getNextPage(for: function, completion)
	}
	
	func getNextPage<T: Decodable>(for function: (Int, @escaping (T) -> ()) -> (),
					 _ completion: @escaping (T) -> ()) {
		guard !isLoading.value else { return }
		isLoading.value = true
		function(currentPage + 1) { model in
			self.currentPage += 1
			self.isLoading.value = false
			completion(model)
		}
	}
}
