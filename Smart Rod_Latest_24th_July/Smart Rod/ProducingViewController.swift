//
//  ProducingViewController.swift
//  Smart Rod
//
//  Created by Saraschandra on 07/07/17.
//  Copyright © 2017 MobiwareInc. All rights reserved.
//

import UIKit

class ProducingViewController: UIViewController,UITextFieldDelegate
{

    @IBOutlet var navigationVIew: UIView!
    @IBOutlet var backBtn: UIButton!
    @IBOutlet var infomationLabel: UILabel!
    
    @IBOutlet var producingScrollView: UIScrollView!
    
    @IBOutlet var controllersView: UIView!
    
    @IBOutlet var manufacturerTxtFld: UITextField!
    @IBOutlet var serialNumberTxtFld: UITextField!
    @IBOutlet var sizingTxtFld: UITextField!
    @IBOutlet var assetTxtFld: UITextField!
    @IBOutlet var dateTxtFld: UITextField!
    @IBOutlet var serviceTxtFld: UITextField!
    @IBOutlet var dataSheetTxtFld: UITextField!
    @IBOutlet var inspectionTxtFld: UITextField!
    
    
    @IBOutlet var buttonsView: UIView!
    
    @IBOutlet var updateBtn: UIButton!
    
    var producingAssestsInfo = ProducingAssests()
    
    
    var titleName = NSString()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        infomationLabel.text = titleName as String
        
        manufacturerTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        serialNumberTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        sizingTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        assetTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        dateTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        serviceTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        dataSheetTxtFld.layer.cornerRadius = Constants.cornerRadiusValue
        inspectionTxtFld.layer.cornerRadius = Constants.cornerRadiusValue


        updateBtn.layer.cornerRadius = Constants.cornerRadiusValue
        updateBtn.layer.masksToBounds = true
        
        
        
        
        manufacturerTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        serialNumberTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        sizingTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        assetTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        dateTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        serviceTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        dataSheetTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        inspectionTxtFld.setLeftSpace(viewWidth:Constants.spacingViewWidth, viewHeight: Constants.spacingViewHeight)
        
        manufacturerTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Manufacturer")
        serialNumberTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Serial Number")
        sizingTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Sizing")
        assetTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Asset Count")
        dateTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Date installed")
        serviceTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Service Company Of Installation")
        dataSheetTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Data Sheets")
        inspectionTxtFld.attributedPlaceholder = Constants.textFieldPalceHolderColor(placeHolderText: "Inspection Reports")
        
        manufacturerTxtFld.text = producingAssestsInfo.manufacturer
        serialNumberTxtFld.text = producingAssestsInfo.serialNumber
        sizingTxtFld.text = producingAssestsInfo.sizing
        assetTxtFld.text = producingAssestsInfo.assetCount
        dateTxtFld.text = producingAssestsInfo.dateInstalled
        serviceTxtFld.text = producingAssestsInfo.serviceCompany
        dataSheetTxtFld.text = producingAssestsInfo.dataSheets
        inspectionTxtFld.text = producingAssestsInfo.inspectionReports

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
        
        var contentInset:UIEdgeInsets = self.producingScrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.producingScrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification: NSNotification)
    {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.producingScrollView.contentInset = contentInset
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
        manufacturerTxtFld.resignFirstResponder()
        serialNumberTxtFld.resignFirstResponder()
        sizingTxtFld.resignFirstResponder()
        assetTxtFld.resignFirstResponder()
        dateTxtFld.resignFirstResponder()
        serviceTxtFld.resignFirstResponder()
        dataSheetTxtFld.resignFirstResponder()
        inspectionTxtFld.resignFirstResponder()
        
        return true
    }

    
    
    func removeNotifications()
    {
        NotificationCenter.default.removeObserver(self)
    }
    @IBAction func updateBtnAction(_ sender: Any)
    {
        producingAssestsInfo.manufacturer =  manufacturerTxtFld.text
        producingAssestsInfo.serialNumber = serialNumberTxtFld.text
        producingAssestsInfo.sizing =  sizingTxtFld.text
        producingAssestsInfo.assetCount = assetTxtFld.text
        producingAssestsInfo.dateInstalled = dateTxtFld.text
        producingAssestsInfo.serviceCompany = serviceTxtFld.text
        producingAssestsInfo.dataSheets = dataSheetTxtFld.text
        producingAssestsInfo.inspectionReports = inspectionTxtFld.text
        
        _ = navigationController?.popViewController(animated: true)
    }
}
