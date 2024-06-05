//
//  ViewController.swift
//  VerifyTextField
//
//  Created by Николай Гринько on 04.06.2024.
//

import UIKit

class ViewController: UIViewController {

	private let verifyView = VerifyView()
	
	private lazy var verifyButton: UIButton = {
		let button = UIButton(type: .system)
		button.backgroundColor = .purple
		button.setTitle("Verify", for: .normal)
		button.tintColor = .white
		button.layer.cornerRadius = 10
		button.addTarget(self, action: #selector(verifyButtonTapped), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
	    return button
	}()
	
	private let accessCode = "12345"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		view.addSubview(verifyButton)
		verifyView.verifyDelegate = self
		view.addSubview(verifyView)
		setConstraints()
	}

	@objc private func verifyButtonTapped() {
		let fieldsCode = verifyView.getFieldsCode()
		if fieldsCode == accessCode {
			let secondViewController = SecondViewController()
			secondViewController.modalPresentationStyle = .fullScreen
			present(secondViewController, animated: true)
		} else {
			showAlert()
		}
	}
	
}

extension ViewController: VerifyProtocol {
	func verify() {
		
		
	}
}

extension ViewController {
	
	private func setConstraints() {
		
		NSLayoutConstraint.activate([
		
			verifyView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			verifyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			verifyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			verifyView.heightAnchor.constraint(equalToConstant: 100),
			
			verifyButton.topAnchor.constraint(equalTo: verifyView.bottomAnchor, constant: 15),
			verifyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			verifyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			verifyButton.heightAnchor.constraint(equalToConstant: 50)
		
		])
		
	}
}
