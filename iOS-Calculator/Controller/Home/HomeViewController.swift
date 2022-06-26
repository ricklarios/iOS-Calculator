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
	@IBOutlet weak var resultLabel: UILabel!
	
	
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
	
	// MARK: - Variables
	
	private var total: Double = 0 		// Total
	private var temp: Double = 0 		// Valor por pantalla
	private var operating = false 		// Indica si se ha seleccionado un operador
	private var decimal = false 		// Indica si el valor es decimal
	private var operation: OperationType = .none
	
	// MARK: - Constantes
	
	private let kDecimalSeparator = Locale.current.decimalSeparator!
	private let kMaxLength = 9
	private let kMaxValue: Double = 999999999
	private let kMinValue: Double = 0.00000001
	
	private enum OperationType {
		case none, addition, substraction, multiplication, division, percent
	}
	
	// Formateo de valores auxiliares
		private let auxFormatter: NumberFormatter = {
			let formatter = NumberFormatter()
			let locale = Locale.current
			formatter.groupingSeparator = ""
			formatter.decimalSeparator = locale.decimalSeparator
			formatter.numberStyle = .decimal
			formatter.maximumIntegerDigits = 100
			formatter.minimumFractionDigits = 0
			formatter.maximumFractionDigits = 100
			return formatter
		}()
	// Formateo de valores por pantalla por defecto
		private let printFormatter: NumberFormatter = {
			let formatter = NumberFormatter()
			let locale = Locale.current
			formatter.groupingSeparator = locale.groupingSeparator
			formatter.decimalSeparator = locale.decimalSeparator
			formatter.numberStyle = .decimal
			formatter.maximumIntegerDigits = 9
			formatter.minimumFractionDigits = 0
			formatter.maximumFractionDigits = 8
			return formatter
		}()
	
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
		
		operatorAC.round()
		operatorPlusMinus.round()
		operatorPercent.round()
		operatorDivision.round()
		operatorMultiplication.round()
		operatorSubstraction.round()
		operatorAddition.round()
		operatorResult.round()
		
		numberDecimal.setTitle(kDecimalSeparator, for: .normal)
	       
    }

	// MARK: - Button Actions
	
	@IBAction func operatorACAction(_ sender: UIButton) {
		
		clear()
		
		sender.shine()
	}
	@IBAction func operatorPlusMinusAction(_ sender: UIButton) {
		
		temp = temp * (-1)
		resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
		
		sender.shine()
	}
	@IBAction func operatorPercentAction(_ sender: UIButton) {
		
		if operation != .percent {
			result()
		}
		operating = true
		operation = .percent
		result()
		
		sender.shine()
	}
	@IBAction func operatorDivisionAction(_ sender: UIButton) {
		
		result()
		operating = true
		operation = .division
		
		sender.shine()
	}
	@IBAction func operatorMultiplicationAction(_ sender: UIButton) {
		
		result()
		operating = true
		operation = .multiplication
		
		sender.shine()
	}
	@IBAction func operatorSubstractionAction(_ sender: UIButton) {
		
		result()
		operating = true
		operation = .addition
		
		sender.shine()
	}
	@IBAction func operatorAdditionAction(_ sender: UIButton) {
		
		result()
		operating = true
		operation = .substraction
		
		sender.shine()
	}
	@IBAction func operatorResultAction(_ sender: UIButton) {
		
		result()
		
		sender.shine()
	}
	
	@IBAction func numberDecimalAction(_ sender: UIButton) {
		
		let currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
		if !operating && currentTemp.count >= kMaxLength {
			return
		}
		
		resultLabel.text = resultLabel.text! + kDecimalSeparator
		decimal = true
		
		sender.shine()
	}
	
	@IBAction func numberAction(_ sender: UIButton) {
		sender.shine()
		print(sender.tag)
	}
	
	// Limpia los valores
	private func clear() {
		operation = .none
		operatorAC.setTitle("AC", for: .normal)
		if temp != 0 {
			temp = 0
			resultLabel.text = "0"
		} else {
			total = 0
			result()
		}
	}
	
	private func result() {
		
		switch operation {
		
		case .none:
			// No hacemos nada
			break
		case .addition:
			total = total + temp
			break
		case .substraction:
			total = total - temp
			break
		case .multiplication:
			total = total * temp
			break
		case .division:
			total = total / temp
			break
		case .percent:
			temp = temp / 100
			total = temp
			break
		}
		
		// Formateo en pantalla
		
		if total <= kMaxValue || total >= kMinValue {
			resultLabel.text = printFormatter.string(from: NSNumber(value: total))
		}
		
		print("TOTAL: \(total)")
		
	}
}
