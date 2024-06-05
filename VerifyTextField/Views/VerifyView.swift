//
//  VerifyView.swift
//  VerifyTextField
//
//  Created by Николай Гринько on 05.06.2024.
//

import UIKit


protocol VerifyProtocol: AnyObject {
	func verify()
}

class VerifyView: UIView {
	
	weak var verifyDelegate: VerifyProtocol?
	
	var fieldStack = UIStackView()
	var verifyFields = [VerifyTextField]()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		verifyTextFieldConfiguration()
		setConstraints()
		verifyFields[0].becomeFirstResponder()
		translatesAutoresizingMaskIntoConstraints = false
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func verifyTextFieldConfiguration() {
		fieldStack.translatesAutoresizingMaskIntoConstraints = false
		fieldStack.spacing = 5
		fieldStack.distribution = .fillEqually
		
		for number in 0...4 {
			let verifyTextField = VerifyTextField()
			verifyTextField.tag = number
			verifyTextField.fieldDelegate = self
			verifyFields.append(verifyTextField)
			fieldStack.addArrangedSubview(verifyTextField)
		}
		addSubview(fieldStack)
	}
	
	func getFieldsCode() -> String {
		var fieldsCode = ""
		verifyFields.forEach {
			fieldsCode.append($0.text ?? "")
		}
		return fieldsCode
	}
	
}

extension VerifyView: FieldsProtocol {
	
	func activeNextField(tag: Int) {
		if tag != verifyFields.count - 1 {
			verifyFields[tag + 1].becomeFirstResponder()
		} else {
		
			verifyDelegate?.verify()
			
		}
	}
	
	func activePreviosField(tag: Int) {
		if tag != 0 {
			verifyFields[tag - 1].becomeFirstResponder()
		}
	}
	
	
	
	
}

extension VerifyView {
	
	private func setConstraints() {
		
		NSLayoutConstraint.activate([
		
			fieldStack.topAnchor.constraint(equalTo: topAnchor, constant: 0),
			fieldStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
			fieldStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
			fieldStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
		
		])
		
	}
}
