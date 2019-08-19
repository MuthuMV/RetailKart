//
//  UIButtonExtensions.swift
//  RetailKart
//
//  Created by Muthu on 8/16/19.
//  Copyright © 2019 Muthu. All rights reserved.
//

import UIKit

extension UIButton {
    func clickAnimation() {
        UIButton.animate(withDuration: 0.2, animations: {
            self.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)
        }, completion: { finish in
            UIButton.animate(withDuration: 0.2, animations: {
                self.transform = CGAffineTransform.identity
            })
        })
    }
}
