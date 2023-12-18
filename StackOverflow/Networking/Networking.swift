//
//  Networking.swift
//  StackOverflow
//
//  Created by Arthur on 11.11.23.
//

import Foundation

protocol Networkable {
	
	func get<T: Decodable>(form endpoint: Endpoint,
						   with queryItems: [URLQueryItem]?,
						   _ completion: @escaping (T) -> (),
						   _ failure: ((Error) -> ())?)
}

final class Networking: Networkable {
	
	static let `default` = Networking(host: "api.stackexchange.com")
	
	private let decoder = JSONDecoder()
	private var components = URLComponents()
	
	init(scheme: String = "https", 
		 host: String,
		 keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase) {
		
		components.scheme = scheme
		components.host = host
		decoder.keyDecodingStrategy = keyDecodingStrategy
	}
}

extension Networking {
	
	func get<T: Decodable>(form endpoint: Endpoint,
						   with queryItems: [URLQueryItem]? = nil,
						   _ completion: @escaping (T) -> (),
						   _ failure: ((Error) -> ())? = nil) {
		
		components.path = endpoint.rawValue
		components.queryItems = queryItems
		
		var urlRequest = URLRequest(url: components.url!)
		urlRequest.httpMethod = "GET"
		
		let urlSession = URLSession(configuration: .default)
		urlSession.dataTask(with: urlRequest) { data, response, error in
			if let response = response {
				print(response)
			}
			
			if let data = data {
				do {
					let string = String(data: data, encoding: .utf8)
					let model = try self.decoder.decode(T.self, from: data)
					
					completion(model)
				} catch {
					failure?(error)
				}
			} else if let error = error {
				failure?(error)
			}
		}.resume()
	}
}
