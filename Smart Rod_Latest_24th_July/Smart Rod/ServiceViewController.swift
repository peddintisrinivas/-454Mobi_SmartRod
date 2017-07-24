//
//  ServiceViewController.swift
//  Smart Rod
//
//  Created by Saraschandra on 07/07/17.
//  Copyright © 2017 MobiwareInc. All rights reserved.
//

import UIKit

class ServiceViewController: UIViewController
{

    @IBOutlet var navigationVIew: UIView!
    @IBOutlet var backBtn: UIButton!
    @IBOutlet var infomationLabel: UILabel!
    
    @IBOutlet var serviceScrollView: UIScrollView!
    
    @IBOutlet var controllersView: UIView!
    
    @IBOutlet var msnNumberTxtFld: UITextField!
    @IBOutlet var functionalityTxtFld: UITextField!
    @IBOutlet var executiveTxtFld: UITextField!
    @IBOutlet var contactNumberTxtFld: UITextField!
    @IBOutlet var emailTxtFld: UITextField!
    @IBOutlet var companyRepTxtFld: UITextField!
    @IBOutlet var arNameTxtFld: UITextField!
    @IBOutlet var companyAddTxtFld: UITextField!
    
    @IBOutlet var buttonsBGView: UIView!
    
    @IBOutlet var updateBtn: UIButton!
    
    var titleName = NSString()
    
    var serviceInfo = ServiceCmpny()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        infomationLabel.text = titleName as String

        msnNumberTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        functionalityTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        executiveTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        contactNumberTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        emailTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        companyRepTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        arNameTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        companyAddTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        
        
        updateBtn.layer.cornerRadius = Constants.cornerRadiusValue
        updateBtn.layer.masksToBounds = true
        
        msnNumberTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        functionalityTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        executiveTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        contactNumberTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        emailTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        companyRepTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        arNameTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        companyAddTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        
        msnNumberTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "MSNNumber")
        functionalityTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Functionality")
        executiveTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Executive / Company Man")
        contactNumberTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Contact Number")
        emailTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Email")
        companyRepTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Company Representative")
        arNameTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "AR / AP Name")
        companyAddTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Company Address")

        
        msnNumberTxtFld.text = serviceInfo.msnNumber
        functionalityTxtFld.text = serviceInfo.functionality
        executiveTxtFld.text = serviceInfo.executiveMan
        contactNumberTxtFld.text = serviceInfo.contactNumber
        emailTxtFld.text = serviceInfo.email
        companyRepTxtFld.text = serviceInfo.companyRep
        arNameTxtFld.text = serviceInfo.ar_name
        companyAddTxtFld.text = serviceInfo.companyAddress
        

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
        
        var contentInset:UIEdgeInsets = self.serviceScrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.serviceScrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification: NSNotification)
    {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.serviceScrollView.contentInset = contentInset
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
        msnNumberTxtFld.resignFirstResponder()
        functionalityTxtFld.resignFirstResponder()
        executiveTxtFld.resignFirstResponder()
        contactNumberTxtFld.resignFirstResponder()
        emailTxtFld.resignFirstResponder()
        companyRepTxtFld.resignFirstResponder()
        arNameTxtFld.resignFirstResponder()
        companyAddTxtFld.resignFirstResponder()
        
        
        return true
    }

    
    
    func removeNotifications()
    {
        NotificationCenter.default.removeObserver(self)
    }

    @IBAction func updateBtnAction(_ sender: Any)
    {
        serviceInfo.msnNumber = msnNumberTxtFld.text
        serviceInfo.functionality = functionalityTxtFld.text
        serviceInfo.executiveMan = executiveTxtFld.text
        serviceInfo.contactNumber = contactNumberTxtFld.text
        serviceInfo.email = emailTxtFld.text
        serviceInfo.companyRep = companyRepTxtFld.text
        serviceInfo.ar_name = arNameTxtFld.text
        serviceInfo.companyAddress = companyAddTxtFld.text
        
        _ = navigationController?.popViewController(animated: true)

    }
    
}
