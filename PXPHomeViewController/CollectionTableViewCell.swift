//
//  CollectionTableViewCell.swift
//  PXPHomeViewController
//
//  Created by Paris Pinkney on 12/29/15.
//  Copyright © 2015 PXPGraphics. All rights reserved.
//

import Foundation
import UIKit

class CollectionTableViewCell: UITableViewCell {
	var collectionView: UICollectionView

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.scrollDirection = .Horizontal

		collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: flowLayout)
		collectionView.backgroundColor = UIColor.whiteColor()

		super.init(style: style, reuseIdentifier: reuseIdentifier)

		self.contentView.addSubview(collectionView)
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		collectionView.frame = self.contentView.bounds
	}
}

extension CollectionTableViewCell {
	typealias CollectionViewDataManager = protocol<UICollectionViewDataSource, UICollectionViewDelegate>

	var collectionOffset: CGFloat {
		set {
			collectionView.contentOffset.x = newValue
		}

		get {
			return collectionView.contentOffset.x
		}
	}

	func setCollectionViewDataManager<T: CollectionViewDataManager>(dataManager: T, forRow row: Int) {
		collectionView.dataSource = dataManager
		collectionView.delegate = dataManager
		collectionView.tag = row
		collectionView.reloadData()
	}
}
