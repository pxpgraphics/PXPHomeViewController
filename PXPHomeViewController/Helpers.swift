//
//  Helpers.swift
//  PXPHomeViewController
//
//  Created by Paris Pinkney on 12/29/15.
//  Copyright © 2015 PXPGraphics. All rights reserved.
//

import Foundation
import UIKit

// MARK: UIColor

extension UIColor {
	class func randomColor() -> UIColor {
		let hue = CGFloat(arc4random() % 100) / 100
		let saturation = CGFloat(arc4random() % 100) / 100
		let brightness = CGFloat(arc4random() % 100) / 100
		return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
	}
}

// MARK: UIDevice

extension UIDevice {
	class func isIpad() -> Bool {
		return currentDevice().userInterfaceIdiom == .Pad
	}

	class func isIphone() -> Bool {
		return currentDevice().userInterfaceIdiom == .Phone
	}
}

// MARK: UILabel

extension UILabel {
	func sizeThatFitsText() -> CGSize {
		guard let labelText = text else { printFunction("Label text is nil!"); return CGSize() }
		guard let text: NSString = labelText as NSString else { printFunction("Label text couldn't be converted to NSString!"); return CGSize() }
		let attributes = [NSFontAttributeName:font]
		let textSize = text.sizeWithAttributes(attributes)
		return CGSize(width: ceil(textSize.width), height: ceil(textSize.height)) // Integral sizes
	}

	func widthThatFitsText() -> CGFloat {
		return sizeThatFitsText().width
	}

	func heightThatFitsText() -> CGFloat {
		return sizeThatFitsText().height
	}
}

// MARK: Pretty Print

/**
Traditional C-style log with an optional message.
Prints file, line and function, by default, followed the messaage, if applicable.
- parameter file:     The name of the file; defaults to the current localized file.
- parameter function: The name of the function; defaults to the function within which the call is made.
- parameter line:     The line number; defaults to the line number within the file that the call is made.
*/
@transparent
@inline(__always)
public func printFunction(
	@autoclosure message: () -> String = String(),
	file: StaticString = __FILE__,
	function: StaticString = __FUNCTION__,
	line: UInt = __LINE__
	) {
		let localizedFile = NSURL(string: String(file))?.lastPathComponent ?? "<Unknown file>"
		print("\(localizedFile):\(line) #\(function) — \(message())")
}
