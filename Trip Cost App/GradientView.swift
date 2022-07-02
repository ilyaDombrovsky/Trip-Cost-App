//
//  GradientView.swift
//  Trip Cost App
//
//  Created by Ilya Dombrovsky on 1.07.22.
//

import Foundation
 import UIKit

class GradientView: UIView {

    let gradientLayer = CAGradientLayer()

   override init(frame: CGRect) {
       super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    func setupGradient() {
        self.layer.addSublayer(gradientLayer)
        gradientLayer.colors =  [UIColor.red.cgColor, UIColor.yellow.cgColor]
    }

    


}





