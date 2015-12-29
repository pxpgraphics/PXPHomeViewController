//
//  HomeViewController.swift
//  PXPHomeViewController
//
//  Created by Paris Pinkney on 12/29/15.
//  Copyright © 2015 PXPGraphics. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
	let dataManager = HomeDataManager()
	let tableView = UITableView()

	required init() {
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented!")
	}

	override func loadView() {
		super.loadView()
		self.view = tableView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		dataManager.registerWithTableView(tableView)
	}
}
