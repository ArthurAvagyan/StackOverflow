//
//  QuestionsViewController.swift
//  StackOverflow
//
//  Created by Arthur on 11.11.23.
//

import UIKit

enum QuestionsListBuilder {
	
	static func build() -> UIViewController {
		let viewModel = QuestionsViewModel()
		let vc = QuestionsListViewController(viewModel: viewModel)
		return vc
	}
}

final class QuestionsListViewController: BaseViewController {
	
	private var tableView = UITableView()
	private let refreshControl = UIRefreshControl()
	
	private let viewModel: QuestionsViewModel!
	
	init(viewModel: QuestionsViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Lifecycle
extension QuestionsListViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureCallbacks()
		configureTableView()
	}
}

// MARK: - Callback Configuration
private extension QuestionsListViewController {
	
	func configureCallbacks() {
		viewModel.updateUI = {
			DispatchQueue.main.async { [weak self] in
				guard let self = self else { return }
				self.tableView.reloadData()
				self.refreshControl.endRefreshing()
			}
		}
		
		viewModel.didSelectQuestion = { [weak self] model in
			guard let self = self else { return }
			
			let vc = QuestionBuilder.build(model: model)
			self.navigationController?.pushViewController(vc, animated: true)
		}
		
		viewModel.isLoading.listener = { [weak self] isLoading in
			guard let self = self else { return }
			
			isLoading ? self.refreshControl.beginRefreshing() : self.refreshControl.endRefreshing()
		}
	}
}

// MARK: - UI Configuration
private extension QuestionsListViewController {
	
	func configureTableView() {
		view.addSubview(tableView)
		
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
		tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
		tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
		
		tableView.delegate = self
		tableView.dataSource = self
		
		tableView.register(.init(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: "QuestionCell")
		
		tableView.backgroundColor = .systemBackground
		
		refreshControl.addTarget(viewModel, action: #selector(viewModel.refresh(_:)), for: .primaryActionTriggered)
		tableView.addSubview(refreshControl)
	}
}

// MARK: - UITableViewDelegate
extension QuestionsListViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		viewModel.didSelectRow(at: indexPath)
	}
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		if scrollView.contentOffset.y >= scrollView.contentSize.height - 2 * scrollView.frame.height {
			viewModel.scrollsToBottom()
		}
	}
}

// MARK: - UITableViewDataSource
extension QuestionsListViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		viewModel.answersCount
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
		viewModel.configure(cell: cell, at: indexPath)
		return cell
	}
}
