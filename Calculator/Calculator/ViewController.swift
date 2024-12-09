import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelDisplay: UILabel!
    
    private var currentInput: String = ""    // 현재 입력값
    private var previousInput: String = ""   // 이전 입력값
    private var currentOperation: String? = nil  // 현재 연산자 (덧셈, 뺄셈 등)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 화면 초기화
        labelDisplay.text = "0"
    }

    // 숫자 버튼 눌렀을 때
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        // 만약 화면에 "0"이 표시되면 숫자가 시작되었다는 표시로 "0"을 지우고 새로운 숫자 추가
        if currentInput == "0" {
            currentInput = digit
        } else {
            currentInput += digit
        }
        
        labelDisplay.text = currentInput
    }
    
    // 연산자 버튼 눌렀을 때 (더하기, 빼기 등)
    @IBAction func addDigit(_ sender: UIButton) {
        currentOperation = "+"
        previousInput = currentInput
        currentInput = ""
    }
    
    @IBAction func minusDigit(_ sender: UIButton) {
        currentOperation = "-"
        previousInput = currentInput
        currentInput = ""
    }
    
    @IBAction func multiDigit(_ sender: UIButton) {
        currentOperation = "*"
        previousInput = currentInput
        currentInput = ""
    }
    
    @IBAction func dividedDigit(_ sender: UIButton) {
        currentOperation = "/"
        previousInput = currentInput
        currentInput = ""
    }
    
    // 계산 후 결과 보여주기
    @IBAction func sumDigit(_ sender: UIButton) {
        guard let operation = currentOperation, let previousValue = Double(previousInput), let currentValue = Double(currentInput) else {
            return
        }
        
        var result: Double = 0
        
        switch operation {
        case "+":
            result = previousValue + currentValue
        case "-":
            result = previousValue - currentValue
        case "*":
            result = previousValue * currentValue
        case "/":
            if currentValue != 0 {
                result = previousValue / currentValue
            } else {
                labelDisplay.text = "Error"
                return
            }
        default:
            return
        }
        
        labelDisplay.text = String(result)
        currentInput = String(result)
        previousInput = ""
        currentOperation = nil
    }
    
    // 초기화 버튼 눌렀을 때
    @IBAction func resetDigit(_ sender: UIButton) {
        currentInput = ""
        previousInput = ""
        currentOperation = nil
        labelDisplay.text = "0"
    }
}

