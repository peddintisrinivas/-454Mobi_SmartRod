//
//  RodStarViewController.swift
//  Smart Rod
//
//  Created by Saraschandra on 07/07/17.
//  Copyright © 2017 MobiwareInc. All rights reserved.
//

import UIKit

class RodStarViewController: UIViewController,UITextFieldDelegate
{

    @IBOutlet var navigationVIew: UIView!
    @IBOutlet var backBtn: UIButton!
    @IBOutlet var infomationLabel: UILabel!
    
    @IBOutlet var controllersView: UIView!
    
    @IBOutlet var numberTxtFld: UITextField!
    
    @IBOutlet var buttonsBGView: UIView!
   
    @IBOutlet var updateBtn: UIButton!
    
    
    var titleName = NSString()
    
    var rodStarInfo = RodStar()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        infomationLabel.text = titleName as String
        
        numberTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        
        
        updateBtn.layer.cornerRadius = Constants.cornerRadiusValue
        updateBtn.layer.masksToBounds = true
        
        numberTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        
        numberTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Number")
        
        numberTxtFld.text = rodStarInfo.number
        
        let tapRecogniser : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ContactsViewController.tapGestureRecognized))
        self.view.addGestureRecognizer(tapRecogniser)
    }
    
    
    func tapGestureRecognized()
    {
        self.view.endEditing(true)
    }

    
    
    @IBAction func backBtnAction(_ sender: Any)
    {
         _ = navigationController?.popViewController(animated: true)
    }
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        numberTxtFld.resignFirstResponder()
        
        return true
    }

    @IBAction func updateBtnAction(_ sender: Any)
    {
        rodStarInfo.number = numberTxtFld.text
        
         _ = navigationController?.popViewController(animated: true)
    }

   
}
