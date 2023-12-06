//
//  BaseViewController.swift
//  StackOverflow
//
//  Created by Arthur on 26.11.23.
//

import UIKit

class BaseViewController: UIViewController {
	
	final var safeArea: UILayoutGuide!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .systemBackground
		safeArea = view.layoutMarginsGuide
	}
}
