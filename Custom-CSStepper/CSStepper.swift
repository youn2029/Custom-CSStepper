//
//  CSStepper.swift
//  Custom-CSStepper
//
//  Created by 윤성호 on 15/04/2019.
//  Copyright © 2019 윤성호. All rights reserved.
//

import UIKit

@IBDesignable   // 미리보기 형태로 처리해 달라고 시스템에 요청하는 역할
public class CSStepper: UIView {
    
    public var leftBtn = UIButton(type: .system)       // 왼쪽 버튼
    public var rightBtn = UIButton(type: .system)      // 오른쪽 버튼
    public var centerLabel = UILabel()                 // 가운데 레이블
    
    // 스테퍼의 현재값을 저장할 변수
    @IBInspectable  // 인터페이스 빌더에서도 설정 가능하게 해주는 어트리뷰트
    public var value: Int = 0 {
        didSet {    // 프로퍼티의 값이 변경되면 자동을 호출
            self.centerLabel.text = String(value)
        }
    }
    
    // 좌측 버튼의 타이틀 변경 속성
    @IBInspectable
    public var leftTitle: String = "↓" {
        didSet{
            self.leftBtn.setTitle(leftTitle, for: .normal)
        }
    }
    
    // 우측 버튼의 타이틀 변경 속성
    @IBInspectable
    public var rightTitle: String = "↑" {
        didSet{
            self.rightBtn.setTitle(rightTitle, for: .normal)
        }
    }
    
    // 가운데 배경색 변경 속성
    @IBInspectable
    public var bgColor: UIColor = UIColor.cyan {
        didSet {
            self.centerLabel.backgroundColor = bgColor
        }
    }
    
    // 스테퍼의 증감값
    @IBInspectable
    public var stepValue: Int = 1
    
    // 스테퍼의 최소값, 최대값
    @IBInspectable public var minimumValue: Int = -100
    @IBInspectable public var maximumValue: Int = 100

    // 스토리보드에서 호출할 초기화 메소드
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    // 프로그래밍 방식으로 호출하는 초기화 메소드
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    // 기본 설정을 위한 메소드
    private func setup() {
        
        // 공통 속성값
        let borderWidth: CGFloat = 0.5
        let boardColor = UIColor.blue.cgColor
        
        // 좌측 다운 버튼 속성 설정
        self.leftBtn.tag = -1       // 태그값에 -1을 부여
        self.leftBtn.setTitle(self.leftTitle, for: .normal)
        self.leftBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.leftBtn.layer.borderWidth = borderWidth
        self.leftBtn.layer.borderColor = boardColor
        
        // 우측 업 버튼 속성 설정
        self.rightBtn.tag = 1       // 태그값에 1을 부여
        self.rightBtn.setTitle(self.rightTitle, for: .normal)
        self.rightBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.rightBtn.layer.borderWidth = borderWidth
        self.rightBtn.layer.borderColor = boardColor
        
        // 중앙 레이블 속성 설정
        self.centerLabel.text = String(value)       // 현재값을 String으로 변환하여 표시
        self.centerLabel.font = .systemFont(ofSize: 16)
        self.centerLabel.textAlignment = .center
        self.centerLabel.backgroundColor = bgColor
        self.centerLabel.layer.borderWidth = borderWidth
        self.centerLabel.layer.borderColor = boardColor
        
        // 뷰에 추가
        self.addSubview(self.leftBtn)
        self.addSubview(self.rightBtn)
        self.addSubview(self.centerLabel)
        
        // 버튼에 메소드를 연결
        self.leftBtn.addTarget(self, action: #selector(valueChage(_:)), for: .touchUpInside)
        self.rightBtn.addTarget(self, action: #selector(valueChage(_:)), for: .touchUpInside)
    }
    
    // 크기가 변경될 때마다 호추되는 메소드
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        // 버튼의 너비 = 뷰의 높이 (정사각형)
        let btnWidth = self.frame.height
        
        // 레이블의 너비 = 뷰에서 버튼 2개를 뺀 나머지
        let labelWidth = self.frame.width - (btnWidth * 2)
        
        // 각 각의 객체를 배치
        self.leftBtn.frame = CGRect(x: 0, y: 0, width: btnWidth, height: btnWidth)
        self.centerLabel.frame = CGRect(x: btnWidth, y: 0, width: labelWidth, height: self.frame.height)
        self.rightBtn.frame = CGRect(x: self.frame.width - btnWidth, y: 0, width: btnWidth, height: btnWidth)
        
    }
    
    // 버튼을 클릭했을때 값을 변경하는 메소드
    @objc public func valueChage(_ sender: UIButton){
        
        // 스테퍼의 버튼을 클릭했을 때 변경될 값
        let sum = self.value + sender.tag * self.stepValue
        
        // 변경될 값이 최소값보다 작으면
        if sum < self.minimumValue || sum > self.maximumValue {
            return
        }
        
        self.value += sender.tag * self.stepValue
        
    }

}
