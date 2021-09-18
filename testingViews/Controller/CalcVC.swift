//
//  CalcVC.swift
//  testingViews
//
//  Created by James Baldwin on 8/28/21.
//

import UIKit

class CalcVC: UIViewController {
    @IBOutlet weak var wholeNumLbl: UILabel!
    @IBOutlet weak var currNumLbl: UILabel!
    
    //Num Labels
    @IBOutlet weak var sevenBtn: BorderButton!
    @IBOutlet weak var eightBtn: BorderButton!
    @IBOutlet weak var nineBtn: BorderButton!
    @IBOutlet weak var fourBtn: BorderButton!
    @IBOutlet weak var fiveBtn: BorderButton!
    @IBOutlet weak var sixBtn: BorderButton!
    @IBOutlet weak var oneBtn: BorderButton!
    @IBOutlet weak var twoBtn: BorderButton!
    @IBOutlet weak var threeBtn: BorderButton!
    @IBOutlet weak var zeroBtn: BorderButton!
    @IBOutlet weak var decimalBtn: BorderButton!
    
    //Operators
    @IBOutlet weak var positiveBtn: BorderButton!
    @IBOutlet weak var modBtn: BorderButton!
    @IBOutlet weak var divideBtn: BorderButton!
    @IBOutlet weak var multiplyBtn: BorderButton!
    @IBOutlet weak var minusBtn: BorderButton!
    @IBOutlet weak var plusBtn: BorderButton!
    
    var selectedOperator: String = ""
    var numbersArray = [Double]()
    
    var calculator = Calculator()
    var equalsPressed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currNumLbl.text = "0"
        wholeNumLbl.text = ""
    }
    
    @IBAction func plusBtnPressed(_ sender: Any) {
        checkCurrNum()
        currNumLbl.text = ""
        selectedOperator = calculator.getOperator(btn: plusBtn, numbersArray: numbersArray)
        wholeNumLbl.text?.append(selectedOperator)
    }
    
    @IBAction func minusBtnPressed(_ sender: Any) {
        checkCurrNum()
        currNumLbl.text = ""
        selectedOperator = calculator.getOperator(btn: minusBtn, numbersArray: numbersArray)
        wholeNumLbl.text?.append(selectedOperator)
    }
    
    @IBAction func multiplyBtnPressed(_ sender: Any) {
        checkCurrNum()
        selectedOperator = calculator.getOperator(btn: multiplyBtn, numbersArray: numbersArray)
        currNumLbl.text = ""
        wholeNumLbl.text?.append(selectedOperator.lowercased())
    }
    
    @IBAction func divideBtnPressed(_ sender: Any) {
        checkCurrNum()
        currNumLbl.text = ""
        selectedOperator = calculator.getOperator(btn: divideBtn, numbersArray: numbersArray)
        wholeNumLbl.text?.append(selectedOperator)
    }
    
    @IBAction func modBtnPressed(_ sender: Any) {
        checkCurrNum()
        currNumLbl.text = ""
        selectedOperator = calculator.getOperator(btn: modBtn, numbersArray: numbersArray)
    }
    
    @IBAction func positiveBtnPressed(_ sender: Any) {
        if currNumLbl.text!.hasPrefix("-") {
            currNumLbl.text?.removeFirst()
        } else {
            currNumLbl.text?.insert("-", at: currNumLbl.text!.startIndex)
        }
    }
    
    @IBAction func clearBtnPressed(_ sender: Any) {
        wholeNumLbl.text = ""
        currNumLbl.text = "0"
        numbersArray.removeAll()
    }
    
    @IBAction func equalBtnPressed(_ sender: Any) {
        if let currNum = Double(currNumLbl.text!) {
            numbersArray.append(currNum)
        }
        currNumLbl.text = calculator.calculate(selectedOperator: selectedOperator, nums: numbersArray)
        numbersArray.removeAll()
        wholeNumLbl.text = ""
        equalsPressed = true
    }
    
    @IBAction func sevenBtnPressed(_ sender: Any) {
        isEqualPressed()
        isFirstNumZero()
        currNumLbl.text = currNumLbl.text! + calculator.getValue(btn: sevenBtn)
        wholeNumLbl.text?.append(sevenBtn.currentTitle!)
    }
    
    @IBAction func eightBtnPressed(_ sender: Any) {
        isEqualPressed()
        isFirstNumZero()
        currNumLbl.text = currNumLbl.text! + calculator.getValue(btn: eightBtn)
        wholeNumLbl.text?.append(eightBtn.currentTitle!)
    }
    
    @IBAction func nineBtnPressed(_ sender: Any) {
        isEqualPressed()
        isFirstNumZero()
        currNumLbl.text = currNumLbl.text! + calculator.getValue(btn: nineBtn)
        wholeNumLbl.text?.append(nineBtn.currentTitle!)
    }
    
    @IBAction func fourBtnPressed(_ sender: Any) {
        isEqualPressed()
        isFirstNumZero()
        currNumLbl.text = currNumLbl.text! + calculator.getValue(btn: fourBtn)
        wholeNumLbl.text?.append(fourBtn.currentTitle!)
    }
    
    @IBAction func fiveBtnPressed(_ sender: Any) {
        isEqualPressed()
        isFirstNumZero()
        currNumLbl.text = currNumLbl.text! + calculator.getValue(btn: fiveBtn)
        wholeNumLbl.text?.append(fiveBtn.currentTitle!)
    }
    
    @IBAction func sixBtnPressed(_ sender: Any) {
        isEqualPressed()
        isFirstNumZero()
        currNumLbl.text = currNumLbl.text! + calculator.getValue(btn: sixBtn)
        wholeNumLbl.text?.append(sixBtn.currentTitle!)
    }
    
    @IBAction func oneBtnPressed(_ sender: Any) {
        isEqualPressed()
        isFirstNumZero()
        currNumLbl.text = currNumLbl.text! + calculator.getValue(btn: oneBtn)
        wholeNumLbl.text?.append(oneBtn.currentTitle!)
    }
    
    @IBAction func twoBtnPressed(_ sender: Any) {
        isEqualPressed()
        isFirstNumZero()
        currNumLbl.text = currNumLbl.text! + calculator.getValue(btn: twoBtn)
        wholeNumLbl.text?.append(twoBtn.currentTitle!)
    }
    
    @IBAction func threeBtnPressed(_ sender: Any) {
        isEqualPressed()
        isFirstNumZero()
        currNumLbl.text = currNumLbl.text! + calculator.getValue(btn: threeBtn)
        wholeNumLbl.text?.append(threeBtn.currentTitle!)
    }
    
    @IBAction func zeroBtnPressed(_ sender: Any) {
        isEqualPressed()
        isFirstNumZero()
        currNumLbl.text = currNumLbl.text! + calculator.getValue(btn: zeroBtn)
        wholeNumLbl.text?.append(zeroBtn.currentTitle!)
    }
    
    @IBAction func decimalBtnPressed(_ sender: Any) {
        isFirstNumZero()
        currNumLbl.text = currNumLbl.text! + calculator.getValue(btn: decimalBtn)
        wholeNumLbl.text?.append(decimalBtn.currentTitle!)
    }
    
    func checkCurrNum() {
        if let currNum = Double(currNumLbl.text!) {
                numbersArray.append(currNum)
            }
            
    }

    func isFirstNumZero() {
        let firstNumZero: Bool = ((currNumLbl.text!.hasPrefix("0")))
        if firstNumZero {
            currNumLbl.text = ""
        }
    }
    
    func isEqualPressed() {
        if equalsPressed == true {
            wholeNumLbl.text = ""
            currNumLbl.text = "0"
            equalsPressed = false
        }
    }
}
