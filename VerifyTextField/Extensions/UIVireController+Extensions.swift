//
//  UIVireController+Extensions.swift
//  VerifyTextField
//
//  Created by Николай Гринько on 05.06.2024.
//

import UIKit

extension UIViewController {
	
	func showAlert() {
		
		let alertController = UIAlertController(title: "Error", message: nil, preferredStyle: .alert)
		let okAlert = UIAlertAction(title: "OK", style: .default)
		alertController.addAction(okAlert)
		
		present(alertController, animated: true)
		
	}
	
}
