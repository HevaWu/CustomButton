//
//  CustomButton.swift
//  CustomButton
//
//  Created by He Wu on 2021/10/01.
//

import UIKit

/*
⫦-----------------------------⫣
|  |                          |
| 10                (Title)   |
|  |                  |       |
|-20- (image) -18-    8       |
|  |                  |       |
| 10                (Subtitle)|
|  |                          |
⟘_____________________________⟘
 */

@IBDesignable
final class CustomButton: UIButton {
    private let customSubtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    @IBInspectable
    var customSubtitleText: String = "" {
        didSet {
            self.customSubtitleLabel.text = customSubtitleText
            customSubtitleLabel.isHidden = customSubtitleText.isEmpty
            setNeedsLayout()
            layoutIfNeeded()
        }
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        var rect = super.imageRect(forContentRect: contentRect)
        rect.origin.x = 20
        rect.origin.y = 10
        rect.size = CGSize(width: 64, height: 64)
        return rect
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        var rect = super.titleRect(forContentRect: contentRect)
        if customSubtitleText.isEmpty {
            rect.origin.x = 102
            return rect
        } else {
            rect.origin.x = 102
            rect.origin.y = (84 - (23 + customSubtitleLabel.systemLayoutSizeFitting(UIView.layoutFittingExpandedSize).height)) / 2
            return rect
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        customSubtitleLabel.frame.origin.x = 102
        customSubtitleLabel.frame.origin.y = titleRect(forContentRect: frame).maxY + 8
        customSubtitleLabel.frame.size = CGSize(
            width: frame.width - 10 - 102,
            height: customSubtitleLabel.systemLayoutSizeFitting(UIView.layoutFittingExpandedSize).height
        )
        
        if !subviews.contains(customSubtitleLabel) {
            addSubview(customSubtitleLabel)
        }
    }
}
