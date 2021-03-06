//
//  Embeddable.swift
//  Radiant Tap Essentials
//
//  Copyright © 2016 Radiant Tap
//  MIT License · http://choosealicense.com/licenses/mit/
//

import UIKit

extension UIViewController {
	public func embed<T>(controller vc: T, into parentView: UIView?)
		where T: UIViewController
	{
		let container = parentView ?? self.view!

		addChild(vc)
		container.addSubview(vc.view)
		vc.view.translatesAutoresizingMaskIntoConstraints = false
		vc.view.frame = parentView?.frame ?? self.view.frame
		vc.didMove(toParent: self)

		//	Note: after this, save the controller reference
		//	somewhere in calling scope
	}

	public func unembed(controller: UIViewController?) {
		guard let controller = controller else { return }

		controller.willMove(toParent: nil)
		if controller.isViewLoaded {
			controller.view.removeFromSuperview()
		}
		controller.removeFromParent()

		//	Note: don't forget to nullify your own controller instance
		//	in order to clear it out from memory
	}
}

