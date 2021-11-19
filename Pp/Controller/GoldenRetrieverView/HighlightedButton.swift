//
//  HighlightedButton.swift
//  Pp
//
//  Created by Nathaniel Whittington on 11/16/21.
//

import UIKit

class HighlightedButton: UIButton {

    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .red : .green
        }
    }
}
