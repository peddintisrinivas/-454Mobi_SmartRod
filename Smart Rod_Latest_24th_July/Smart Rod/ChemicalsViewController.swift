//
//  ChemicalsViewController.swift
//  Smart Rod
//
//  Created by Saraschandra on 07/07/17.
//  Copyright © 2017 MobiwareInc. All rights reserved.
//

import UIKit

class ChemicalsViewController: UIViewController,UITextFieldDelegate
{
    @IBOutlet var navigationVIew: UIView!
    @IBOutlet var backBtn: UIButton!
    @IBOutlet var infomationLabel: UILabel!
    
    @IBOutlet var chemicalsScrollView: UIScrollView!
    
    @IBOutlet var controllersView: UIView!
    
    @IBOutlet var nameTxtFld: UITextField!
    @IBOutlet var resolutionTxtFld: UITextField!
    @IBOutlet var frequencyTxtFld: UITextField!
    @IBOutlet var calculationTxtFld: UITextField!
    @IBOutlet var serviceTxtFld: UITextField!
    @IBOutlet var deliveryTxtFld: UITextField!
    @IBOutlet var appDescriptionTxtFld: UITextField!
    @IBOutlet var contactNameTxtFld: UITextField!
    @IBOutlet var contactNumberTxtFld: UITextField!
    @IBOutlet var contactEmailTxtFld: UITextField!
    
    @IBOutlet var buttonsBGView: UIView!
        var titleName = NSString()
    
    @IBOutlet var updateBtn: UIButton!
    
    var chemicalsInfo = ChemicalTreating()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        

        infomationLabel.text = titleName as String
        
        nameTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        resolutionTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        frequencyTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        calculationTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        serviceTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        deliveryTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        appDescriptionTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        contactNameTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        contactNumberTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        contactEmailTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        
        updateBtn.layer.cornerRadius = Constants.cornerRadiusValue
        updateBtn.layer.masksToBounds = true
        
        
        nameTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        resolutionTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        frequencyTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        calculationTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        serviceTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        deliveryTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        appDescriptionTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        contactNameTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        contactNumberTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        contactEmailTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        
        nameTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Name Of Chemical")
        resolutionTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Fix/ Resolution ")
        frequencyTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Frequency")
        calculationTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Calculation Of Parts Per Million")
        serviceTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Service Company")
        deliveryTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Delivery ")
        appDescriptionTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Application Description")
        contactNameTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Contact Name")
        contactNumberTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Contact Number")
        contactEmailTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Contact Email")
        
        nameTxtFld.text = chemicalsInfo.nameOfChemical
        resolutionTxtFld.text = chemicalsInfo.fix
        frequencyTxtFld.text = chemicalsInfo.frequency
        calculationTxtFld.text = chemicalsInfo.calculationOfParts
        serviceTxtFld.text = chemicalsInfo.serviceCompany
        deliveryTxtFld.text = chemicalsInfo.delivery
        appDescriptionTxtFld.text = chemicalsInfo.applicationDesp
        contactNameTxtFld.text = chemicalsInfo.contactName
        contactNumberTxtFld.text = chemicalsInfo.contactNumber
        contactEmailTxtFld.text = chemicalsInfo.contactEmail


        
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
        
        var contentInset:UIEdgeInsets = self.chemicalsScrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.chemicalsScrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification: NSNotification)
    {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.chemicalsScrollView.contentInset = contentInset
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
        
        nameTxtFld.resignFirstResponder()
        resolutionTxtFld.resignFirstResponder()
        frequencyTxtFld.resignFirstResponder()
        calculationTxtFld.resignFirstResponder()
        serviceTxtFld.resignFirstResponder()
        deliveryTxtFld.resignFirstResponder()
        appDescriptionTxtFld.resignFirstResponder()
        contactNameTxtFld.resignFirstResponder()
        contactNumberTxtFld.resignFirstResponder()
        contactEmailTxtFld.resignFirstResponder()
        
        return true
    }
    
    
    
    func removeNotifications()
    {
        NotificationCenter.default.removeObserver(self)
    }

    @IBAction func updateBtnAction(_ sender: Any)
    {
        chemicalsInfo.nameOfChemical = nameTxtFld.text
        chemicalsInfo.fix = resolutionTxtFld.text
        chemicalsInfo.frequency = frequencyTxtFld.text
        chemicalsInfo.calculationOfParts = calculationTxtFld.text
        chemicalsInfo.serviceCompany = serviceTxtFld.text
        chemicalsInfo.delivery = deliveryTxtFld.text
        chemicalsInfo.applicationDesp = appDescriptionTxtFld.text
        chemicalsInfo.contactName = contactNameTxtFld.text
        chemicalsInfo.contactNumber = contactNumberTxtFld.text
        chemicalsInfo.contactEmail = contactEmailTxtFld.text

        _ = navigationController?.popViewController(animated: true)
        
    }
    
}
