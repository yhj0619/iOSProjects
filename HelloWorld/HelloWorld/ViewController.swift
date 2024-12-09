//
//  ViewController.swift
//  HelloWorld
//
//  Created by 양혜지 on 12/9/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var textFieldName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonOK(_ sender: UIButton) {
        labelName.text = "My name is " + textFieldName.text! + "!!"
        labelName.text = "My name is \(textFieldName.text!)!!"
    }
    
}





// mark : 여기서부터는 주석
