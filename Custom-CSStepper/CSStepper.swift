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
    public var value: Int = 0                          // 스테퍼의 현재값을 저장할 변수

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
        self.leftBtn.setTitle("↓", for: .normal)
        self.leftBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.leftBtn.layer.borderWidth = borderWidth
        self.leftBtn.layer.borderColor = boardColor
        
        // 우측 업 버튼 속성 설정
        self.rightBtn.tag = 1       // 태그값에 1을 부여
        self.rightBtn.setTitle("↑", for: .normal)
        self.rightBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.rightBtn.layer.borderWidth = borderWidth
        self.rightBtn.layer.borderColor = boardColor
        
        // 중앙 레이블 속성 설정
        self.centerLabel.text = String(value)       // 현재값을 String으로 변환하여 표시
        self.centerLabel.font = .systemFont(ofSize: 16)
        self.centerLabel.textAlignment = .center
        self.centerLabel.backgroundColor = .cyan
        self.centerLabel.layer.borderWidth = borderWidth
        self.centerLabel.layer.borderColor = boardColor
        
        self.addSubview(self.leftBtn)
        self.addSubview(self.rightBtn)
        self.addSubview(self.centerLabel)
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

}
