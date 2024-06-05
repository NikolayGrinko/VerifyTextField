//
//
//  VerifyTextField.swift
//
//  Created by Николай Гринько on 05.06.2024.
//

import UIKit

protocol FieldsProtocol: AnyObject {
	func activeNextField(tag: Int)
	func activePreviosField(tag: Int)
}

class VerifyTextField: UITextField {
	
	weak var fieldDelegate: FieldsProtocol?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
		delegate = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder: ) has not been implemented")
	}
	
	private func configure() {
		
		backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
		layer.cornerRadius = 10
		tintColor = .red
		layer.borderColor = UIColor.purple.cgColor
		textColor = .purple
		font = UIFont.boldSystemFont(ofSize: 40)
		textAlignment = .center
	}
	
	override func deleteBackward() {
		fieldDelegate?.activePreviosField(tag: tag)
	}
	
}

extension VerifyTextField: UITextFieldDelegate {
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		
		text = string
		
		if range.length == 0 {
			fieldDelegate?.activeNextField(tag: tag)
			resignFirstResponder()
		}
		return false
	}
	
	// выделение ячейки, происходит выделение
	func textFieldDidBeginEditing(_ textField: UITextField) {
		layer.borderWidth = 2
	}
	
	// отпускаешь и становится свой размер
	func textFieldDidEndEditing(_ textField: UITextField) {
		layer.borderWidth = 0
	}
	
}
