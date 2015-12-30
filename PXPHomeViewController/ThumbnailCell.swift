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

struct ThumbnailCellSize {

	struct home {
		static func cellSize() -> CGSize {
			return UIDevice.isIpad() ?
			CGSize(width: 135, height: 180) :
			CGSize(width: 105, height: 140)
		}

		static func rowHeight() -> CGFloat {
			return cellSize().height + 40
		}

		static func sectionInsets() -> UIEdgeInsets {
			return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
		}

		static func lineSpacing() -> CGFloat {
			return UIDevice.isIpad() ? 20 : 30
		}
	}

}

class ThumbnailCell: UICollectionViewCell  {

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
