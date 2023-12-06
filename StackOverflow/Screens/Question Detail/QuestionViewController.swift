//
//  QuestionViewController.swift
//  StackOverflow
//
//  Created by Arthur on 04.12.23.
//

import UIKit
import WebKit

enum QuestionBuilder {
	
	static func build(model: QuestionModel) -> UIViewController {
		let viewModel = QuestionViewModel(model: model)
		let vc = QuestionViewController(viewModel: viewModel)
		return vc
	}
}


final class QuestionViewController: BaseViewController {
	
	var viewModel: QuestionViewModel!
	
	init(viewModel: QuestionViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Lifecycle
extension QuestionViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()

		configureWebView()
		title = viewModel.model.owner.displayName
	}
}

// MARK: - UI Configuration
private extension QuestionViewController {
	
	func configureWebView() {
		let webView = WKWebView()
		
		webView.load(URLRequest(url: viewModel.model.link))
		view.addSubview(webView)
		webView.translatesAutoresizingMaskIntoConstraints = false
		webView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
		webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
		webView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
		webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
	}
}
