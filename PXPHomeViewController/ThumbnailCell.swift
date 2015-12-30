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
	private let padding: CGFloat = 10

	let imageView = UIImageView()
	let captionView = UIView()
	let titleLabel = UILabel()
	let ratingLabel = UILabel()
	let dateLabel = UILabel()

	override init(frame: CGRect) {
		let imageViewLayer = imageView.layer
		imageViewLayer.shadowColor = UIColor.blackColor().CGColor
		imageViewLayer.shadowOffset = CGSize()
		imageViewLayer.shadowOpacity = 0.4
		imageViewLayer.shadowRadius = 3.0
		imageViewLayer.shouldRasterize = true

		captionView.backgroundColor = UIColor(white: 1.0, alpha: 0.4)

		let fontRegular = UIFont(name: "AvenirNext-Regular", size: 10.0)
		let fontMedium = UIFont(name: "AvenirNext-Medium", size: 11.0)

		titleLabel.font = fontMedium
		titleLabel.text = "Fight Club"

		ratingLabel.textAlignment = .Right
		ratingLabel.font = fontRegular
		ratingLabel.text = "7.7/10"

		dateLabel.font = fontRegular
		dateLabel.text = "1999"

		super.init(frame: frame)
		self.contentView.addSubview(imageView)

		captionView.addSubview(dateLabel)
		captionView.addSubview(ratingLabel)
		captionView.addSubview(titleLabel)
		self.contentView.addSubview(captionView)

	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		imageView.frame = self.bounds
		imageView.layer.shadowPath = UIBezierPath(rect: self.bounds).CGPath

		var captionFrame = self.bounds
		captionFrame.size.height = CGRectGetHeight(self.bounds) / 3
		captionFrame.origin.y = captionFrame.height * 2
		captionView.frame = captionFrame // Lower 1/3

		let captionBounds = CGRectInset(captionView.bounds, padding, padding)
		let captionMidX = CGRectGetMidX(captionBounds)
		let captionMidY = CGRectGetMidY(captionBounds)

		var titleFrame = captionBounds
		let titleHeight = min(captionMidY, titleLabel.heightThatFitsText())
		titleFrame.size.height = titleHeight
		titleLabel.frame = titleFrame // Top Half

		var dateFrame = captionBounds
		let dateHeight = min(captionMidY, dateLabel.heightThatFitsText())
		dateFrame.size.width = captionMidX
		dateFrame.size.height = dateHeight
		dateFrame.origin.y = CGRectGetMaxY(titleLabel.frame)
		dateLabel.frame = dateFrame // Bottom Left

		var ratingFrame = captionBounds
		let ratingHeight = min (captionMidY, ratingLabel.heightThatFitsText())
		ratingFrame.size.width = captionMidX
		ratingFrame.size.height = ratingHeight
		ratingFrame.origin.x = CGRectGetMaxX(captionBounds) - ratingFrame.size.width
		ratingFrame.origin.y = CGRectGetMinY(dateLabel.frame)
		ratingLabel.frame = ratingFrame // Bottom Right
	}

}
