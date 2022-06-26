//
//  HomeViewController.swift
//  iOS-Calculator
//
//  Created by Rick Larios on 26/6/22.
//

import UIKit

final class HomeViewController: UIViewController {
	
	// MARK: - Outlets
	
	// Result Label
	@IBOutlet weak var reusltLabel: UILabel!
	// Numbers buttons
	@IBOutlet weak var number0: UIButton!
	@IBOutlet weak var number1: UIButton!
	@IBOutlet weak var number2: UIButton!
	@IBOutlet weak var number3: UIButton!
	@IBOutlet weak var number4: UIButton!
	@IBOutlet weak var number5: UIButton!
	@IBOutlet weak var number6: UIButton!
	@IBOutlet weak var number7: UIButton!
	@IBOutlet weak var number8: UIButton!
	@IBOutlet weak var number9: UIButton!
	@IBOutlet weak var numberDecimal: UIButton!
	// Operators
	@IBOutlet weak var operatorAC: UIButton!
	@IBOutlet weak var operatorPlusMinus: UIButton!
	@IBOutlet weak var operatorPercent: UIButton!
		
	@IBOutlet weak var operatorDivision: UIButton!
	@IBOutlet weak var operatorMultiplication: UIButton!
	@IBOutlet weak var operatorSubstraction: UIButton!
	@IBOutlet weak var operatorAddition: UIButton!
	@IBOutlet weak var operatorResult: UIButton!
	
	// MARK: Initialization
	
	init() {
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
		
		// UI
		number0.round()
		number1.round()
		number2.round()
		number3.round()
		number4.round()
		number5.round()
		number6.round()
		number7.round()
		number8.round()
		number9.round()
		numberDecimal.round()
		

	       
    }

	// MARK: - Button Actions
	
	@IBAction func operatorACAction(_ sender: UIButton) {
		sender.shine()
		
	}
	@IBAction func operatorPlusMinusAction(_ sender: UIButton) {
		sender.shine()
	}
	@IBAction func operatorPercentAction(_ sender: UIButton) {
		sender.shine()
	}
	@IBAction func operatorDivisionAction(_ sender: UIButton) {
		sender.shine()
	}
	@IBAction func operatorMultiplicationAction(_ sender: UIButton) {
		sender.shine()
	}
	@IBAction func operatorSubstractionAction(_ sender: UIButton) {
		sender.shine()
	}
	@IBAction func operatorAdditionAction(_ sender: UIButton) {
		sender.shine()
	}
	@IBAction func operatorResultAction(_ sender: UIButton) {
		sender.shine()
	}
	
	@IBAction func numberDecimalAction(_ sender: UIButton) {
		sender.shine()
	}
	
	@IBAction func numberAction(_ sender: UIButton) {
		sender.shine()
		print(sender.tag)
	}
	
}
