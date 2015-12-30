//
//  ThumbnailMetrics.swift
//  PXPHomeViewController
//
//  Created by Paris Pinkney on 12/30/15.
//  Copyright © 2015 PXPGraphics. All rights reserved.
//

import Foundation
import UIKit

struct ThumbnailCellMetrics {

	struct HomeMetrics {
		static func cellSize() -> CGSize {
			return UIDevice.isIpad() ?
				CGSize(width: 135, height: 180) :
				CGSize(width: 105, height: 140)
		}

		func cellSize() -> CGSize {
			return HomeMetrics.cellSize()
		}

		static func rowHeight() -> CGFloat {
			return cellSize().height + 40
		}

		func rowHeight() -> CGFloat {
			return HomeMetrics.rowHeight()
		}

		static func sectionInsets() -> UIEdgeInsets {
			return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
		}

		func sectionInsets() -> UIEdgeInsets {
			return HomeMetrics.sectionInsets()
		}

		static func lineSpacing() -> CGFloat {
			return UIDevice.isIpad() ? 20 : 30
		}

		func lineSpacing() -> CGFloat {
			return HomeMetrics.lineSpacing()
		}
	}
	
}