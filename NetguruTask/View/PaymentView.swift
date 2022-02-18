//
//  PaymentView.swift
//  NetguruTask
//
//  Created by Akif Demirezen on 18.02.2022.
//

import UIKit

class PaymentView: UIView {

    var isEuro : Bool?
    var statusText : String?
    var label : UILabel?
    var didTapButton: (() -> Void)?
    
    func setConstraints(view : UIView){
        let centerXConstraint = self.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let centerYConstraint = self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        NSLayoutConstraint.activate([centerXConstraint,centerYConstraint])
    }
}
