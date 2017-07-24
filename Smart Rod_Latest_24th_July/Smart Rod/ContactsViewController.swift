//
//  WellDetailInfoTFSViewController.swift
//  Smart Rod
//
//  Created by Saraschandra on 07/07/17.
//  Copyright © 2017 MobiwareInc. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController,UITextFieldDelegate
{

    @IBOutlet var navigationVIew: UIView!
    @IBOutlet var backBtn: UIButton!
    @IBOutlet var infomationLabel: UILabel!
    
    @IBOutlet var aScrollView: UIScrollView!
    
    @IBOutlet var uiControllersView: UIView!
    
    @IBOutlet var nameTxtField: UITextField!
    @IBOutlet var cellTxtField: UITextField!
    @IBOutlet var officeTxtField: UITextField!
    @IBOutlet var faxTxtField: UITextField!
    @IBOutlet var emailTxtField: UITextField!
    
    @IBOutlet var buttonsBGView: UIView!
    
    @IBOutlet var updateBtn: UIButton!
    
    var contactInfo = ContactInfo()

    
    var titleName = NSString()
    var updatableIndexPath : Int!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        

        infomationLabel.text = titleName as String
        
        
        nameTxtField.layer.cornerRadius = Constants.cornerRadiusValue
        cellTxtField.layer.cornerRadius = Constants.cornerRadiusValue
        officeTxtField.layer.cornerRadius = Constants.cornerRadiusValue
        faxTxtField.layer.cornerRadius = Constants.cornerRadiusValue
        emailTxtField.layer.cornerRadius = Constants.cornerRadiusValue
        
        updateBtn.layer.cornerRadius = Constants.cornerRadiusValue
        updateBtn.layer.masksToBounds = true
        
        
        nameTxtField.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        cellTxtField.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        officeTxtField.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        faxTxtField.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        emailTxtField.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        
        nameTxtField.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Name")
        cellTxtField.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Cell")
        officeTxtField.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Office")
        faxTxtField.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Fax")
        emailTxtField.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Email")
        
        
        nameTxtField.text = contactInfo.name
        cellTxtField.text = contactInfo.cell
        officeTxtField.text = contactInfo.office
        faxTxtField.text = contactInfo.fax
        emailTxtField.text = contactInfo.email

        
        
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
        
        var contentInset:UIEdgeInsets = self.aScrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.aScrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification: NSNotification)
    {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.aScrollView.contentInset = contentInset
    }
    
    func removeNotifications()
    {
        NotificationCenter.default.removeObserver(self)
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
        nameTxtField.resignFirstResponder()
        cellTxtField.resignFirstResponder()
        officeTxtField.resignFirstResponder()
        faxTxtField.resignFirstResponder()
        emailTxtField.resignFirstResponder()

        return true
    }
    
    @IBAction func updateBtnAction(_ sender: Any)
    {
        contactInfo.name =  nameTxtField.text
        contactInfo.cell =  cellTxtField.text
        contactInfo.office = officeTxtField.text
        contactInfo.fax = faxTxtField.text
        contactInfo.email =  emailTxtField.text
        
       _ = navigationController?.popViewController(animated: true)
    }
    
}
