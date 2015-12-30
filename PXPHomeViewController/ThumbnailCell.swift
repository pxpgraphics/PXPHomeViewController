//
//  ThumbnailCell.swift
//  PXPHomeViewController
//
//  Created by Paris Pinkney on 12/29/15.
//  Copyright © 2015 PXPGraphics. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class ThumbnailCell: UICollectionViewCell {

	let imageView = UIImageView()

	override init(frame: CGRect) {
		let imageViewLayer = imageView.layer
		imageViewLayer.shadowColor = UIColor.blackColor().CGColor
		imageViewLayer.shadowOffset = CGSize()
		imageViewLayer.shadowOpacity = 0.4
		imageViewLayer.shadowRadius = 3.0
		imageViewLayer.shouldRasterize = true

		super.init(frame: frame)
		self.contentView.addSubview(imageView)
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		imageView.frame = self.bounds
		imageView.layer.shadowPath = UIBezierPath(rect: self.bounds).CGPath
	}

}
