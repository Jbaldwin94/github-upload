//
//  BorderButton.swift
//  testingViews
//
//  Created by James Baldwin on 8/19/21.
//

import UIKit

class BorderButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 2.5
        layer.borderColor = UIColor.black.cgColor
    }
}
