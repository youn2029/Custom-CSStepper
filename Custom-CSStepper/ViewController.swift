//
//  ViewController.swift
//  Custom-CSStepper
//
//  Created by 윤성호 on 15/04/2019.
//  Copyright © 2019 윤성호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CSStepper 정의
        let stepper = CSStepper()
        stepper.frame = CGRect(x: 30, y: 100, width: 130, height: 30)
        
        // ValueChanged 이벤트가 발생하면 logging(_:) 메소드가 호출되도록
        stepper.addTarget(self, action: #selector(logging(_:)), for: .valueChanged)
        
        // 변경 가능한 속성
        stepper.bgColor = .red
        stepper.stepValue = 10
        
        // view에 추가
        self.view.addSubview(stepper)
    }
    
    // valueChanged가 발생하면 호출되는 메소드
    @objc func logging(_ sender: CSStepper){
        NSLog("현재 스테퍼의 값은 \(sender.value)입니다.")
    }


}

