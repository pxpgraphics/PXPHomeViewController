//
//  HomeDataManager.swift
//  PXPHomeViewController
//
//  Created by Paris Pinkney on 12/29/15.
//  Copyright © 2015 PXPGraphics. All rights reserved.
//

import UIKit

class HomeDataManager: NSObject, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	let numberOfRowsInSection = 50
	let numberOfItemsPerRow = 25
	let tableViewCellIdentifier = "HomeTableViewCellIdentifier"
	let collectionViewCellIdentifier = "HomeCollectionViewCellIdentifier"
	var data = [[UIColor]]()
	weak var tableView: UITableView?
	var cachedOffsets = [Int:CGFloat]() // Used to store collection view horizontal offsets.

	private func generateRandomData() -> [[UIColor]] {
		return (0..<numberOfRowsInSection).map { _ in
			return (0..<numberOfItemsPerRow).map { _ in UIColor.randomColor() }
		}
	}

	override init() {
		super.init()
		data = generateRandomData()
	}

	func registerWithTableView(tableView: UITableView) {
		tableView.backgroundColor = UIColor.whiteColor()
		tableView.registerClass(CollectionTableViewCell.self, forCellReuseIdentifier: tableViewCellIdentifier)
		tableView.dataSource = self
		tableView.delegate = self
		tableView.rowHeight = 180
		tableView.separatorStyle = .None
		tableView.reloadData()
		self.tableView = tableView
	}

	// MARK: UITableViewDataSource

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return numberOfRowsInSection
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier(tableViewCellIdentifier, forIndexPath: indexPath)
		guard let tableViewCell = cell as? CollectionTableViewCell else { printFunction("Unknown cell: \(cell) found at indexPath: \(indexPath)"); return cell }
		tableViewCell.collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionViewCellIdentifier)
		tableViewCell.selectionStyle = .None
		return tableViewCell
	}

	// MARK: UITableViewDelegate

	func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
		guard let tableViewCell = cell as? CollectionTableViewCell else { printFunction("Unknown cell: \(cell) found at indexPath: \(indexPath)"); return }
		tableViewCell.setCollectionViewDataManager(self, forRow: indexPath.row)
		tableViewCell.collectionOffset = cachedOffsets[indexPath.row] ?? 0
	}

	func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
		guard let tableViewCell = cell as? CollectionTableViewCell else { printFunction("Unknown cell: \(cell) found at indexPath: \(indexPath)"); return }
		cachedOffsets[indexPath.row] = tableViewCell.collectionOffset
	}

	// MARK: UICollectionViewDataSource

	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return numberOfItemsPerRow
	}

	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier(collectionViewCellIdentifier, forIndexPath: indexPath)
		cell.backgroundColor = data[collectionView.tag][indexPath.item]
		return cell
	}

	// MARK: UICollectionViewDelegate

	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		printFunction("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
	}

	// MARK: UICollectionViewDelegateFlowLayout

	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20) // Only changes horizontal insets
	}

	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
		return CGSize(width: 120, height: 160) // 4:3 ratio
	}

}