//
//  DesignViewController.swift
//  Smart Rod
//
//  Created by Saraschandra on 07/07/17.
//  Copyright © 2017 MobiwareInc. All rights reserved.
//

import UIKit

class DesignViewController: UIViewController
{

    @IBOutlet var navigationVIew: UIView!
    @IBOutlet var backBtn: UIButton!
    @IBOutlet var infomationLabel: UILabel!
    
    
    @IBOutlet var designScrollView: UIScrollView!
    
    @IBOutlet var controllersView: UIView!
    
    @IBOutlet var numberTxtFld: UITextField!
    @IBOutlet var descriptionTxtFld: UITextField!
    @IBOutlet var subjectMatterTxtFld: UITextField!
    @IBOutlet var contactNumberTxtFld: UITextField!
    @IBOutlet var emailTxtFld: UITextField!
    @IBOutlet var engineerTxtFld: UITextField!
    
    @IBOutlet var buttonsBGView: UIView!
    
    @IBOutlet var updateBtn: UIButton!
    
    var titleName = NSString()
    
    var designInfo = DesignEngg()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        infomationLabel.text = titleName as String
        
        numberTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        descriptionTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        subjectMatterTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        contactNumberTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        emailTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        engineerTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        
        
        
        updateBtn.layer.cornerRadius = Constants.cornerRadiusValue
        updateBtn.layer.masksToBounds = true
        
        
        numberTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        descriptionTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        subjectMatterTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        contactNumberTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        emailTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        engineerTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        
        
        numberTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Number")
        descriptionTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Description")
        subjectMatterTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Subject Matter Expert")
        contactNumberTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Contact Number")
        emailTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Email")
        engineerTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Company Engineer")

        
        numberTxtFld.text = designInfo.number
        descriptionTxtFld.text = designInfo.descriptioon
        subjectMatterTxtFld.text = designInfo.subjectMatter
        contactNumberTxtFld.text = designInfo.contactNumber
        emailTxtFld.text = designInfo.email
        engineerTxtFld.text = designInfo.companyEngineer

        
        let tapRecogniser : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ContactsViewController.tapGestureRecognized))
        self.view.addGestureRecognizer(tapRecogniser)
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true);
        self.registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillAppear(true);
        self.removeNotifications()
        
    }
    
    func registerForKeyboardNotifications()
    {
        // register for keyboard WillShow notifications
        NotificationCenter.default.addObserver(self, selector: #selector(ContactsViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        // register for keyboard WillHide notifications
        NotificationCenter.default.addObserver(self, selector: #selector(ContactsViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    func keyboardWillShow(notification: NSNotification)
    {
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.designScrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.designScrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification: NSNotification)
    {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.designScrollView.contentInset = contentInset
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
        descriptionTxtFld.resignFirstResponder()
        subjectMatterTxtFld.resignFirstResponder()
        contactNumberTxtFld.resignFirstResponder()
        emailTxtFld.resignFirstResponder()
        engineerTxtFld.resignFirstResponder()

        return true
    }
    
    
    
    func removeNotifications()
    {
        NotificationCenter.default.removeObserver(self)
    }

    @IBAction func updateBtnAction(_ sender: Any)
    {
        designInfo.number = numberTxtFld.text
        designInfo.descriptioon = descriptionTxtFld.text
        designInfo.subjectMatter = subjectMatterTxtFld.text
        designInfo.contactNumber = contactNumberTxtFld.text
        designInfo.email = emailTxtFld.text
        designInfo.companyEngineer = engineerTxtFld.text
        
        _ = navigationController?.popViewController(animated: true)
        
        
    }
  
}
