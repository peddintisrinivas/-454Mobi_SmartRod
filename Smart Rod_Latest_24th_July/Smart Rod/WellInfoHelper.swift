//
//  WellInfoHelper.swift
//  Smart Rod
//
//  Created by Saraschandra on 17/07/17.
//  Copyright © 2017 MobiwareInc. All rights reserved.
//

import UIKit

class WellInfoHelper: NSObject
{

    class func productInformationParsing(reposeObject : NSArray) -> [WellInfo]
    {
        var wellInfoArray : [WellInfo] = [WellInfo]()
        
        let wellInfo = WellInfo()
        

        
        
        var contactsArray = [ContactInfo]()

        let contactInfoDict = reposeObject .object(at: 0) as! NSDictionary
        
        print("contactInfoDict \(contactInfoDict)");
        
        let contactDetailInfoArray = contactInfoDict["DetailInfo"]as! [[String : String]]
        
        print("contactDetailInfoArray \(contactDetailInfoArray)");
        
        for contactDict in contactDetailInfoArray
        {
            let contact_Info = ContactInfo()
            
            if let mainStr = contactDict["Main"]
            {
                contact_Info.main = mainStr
            }
            if let nameStr = contactDict["Name"]
            {
                contact_Info.name = nameStr
            }
            if let cellStr = contactDict["Cell"]
            {
                contact_Info.cell = cellStr
            }
            if let officeStr = contactDict["Office"]
            {
                contact_Info.office = officeStr
            }
            if let faxStr = contactDict["Fax"]
            {
                contact_Info.fax = faxStr
            }
            if let emailStr = contactDict["Email"]
            {
                contact_Info.email = emailStr
            }

            contactsArray.append(contact_Info)

        }
        
        var producingArray = [ProducingAssests]()
        
        let producingAssestDict = reposeObject .object(at: 1) as! NSDictionary
        
        print("ProducingAssestDict \(producingAssestDict)");
        
        let producingAssestDetailInfoArray = producingAssestDict["DetailInfo"]as! [[String : String]]
        
        print("ProducingAssestDetailInfoArray \(producingAssestDetailInfoArray)");
        
        for prouducingAssestDict in producingAssestDetailInfoArray
        {
            let producing_Assest = ProducingAssests()
            
            if let mainStr = prouducingAssestDict["Main"]
            {
                producing_Assest.main = mainStr
            }
            if let manufacStr = prouducingAssestDict["Manufacturer"]
            {
                producing_Assest.manufacturer = manufacStr
            }
            if let serialNumStr = prouducingAssestDict["Serial Number"]
            {
                producing_Assest.serialNumber = serialNumStr
            }
            if let sizingStr = prouducingAssestDict["Sizing"]
            {
                producing_Assest.sizing = sizingStr
            }
            if let assetCountStr = prouducingAssestDict["Asset Count"]
            {
                producing_Assest.assetCount = assetCountStr
            }
            if let dateInstallStr = prouducingAssestDict["Date installed"]
            {
                producing_Assest.dateInstalled = dateInstallStr
            }
            if let serviceCompStr = prouducingAssestDict["Service Company Of Installation"]
            {
                producing_Assest.serviceCompany = serviceCompStr
            }
            if let dataSheetStr = prouducingAssestDict["Data Sheets"]
            {
                producing_Assest.dataSheets = dataSheetStr
            }
            if let inspectionRepStr = prouducingAssestDict["Inspection Reports"]
            {
                producing_Assest.inspectionReports = inspectionRepStr
            }

            producingArray.append(producing_Assest)
            
        }

        var serviceCompArray = [ServiceCmpny]()
        
        let serviceCompDict = reposeObject .object(at: 2) as! NSDictionary
        
        print("ServiceCompDict \(serviceCompDict)");
        
        let serviceCompDetailInfoArray = serviceCompDict["DetailInfo"]as! [[String : String]]
        
        print("ServiceCompDetailInfoArray \(serviceCompDetailInfoArray)");
        
        for serviceCompDict in serviceCompDetailInfoArray
        {
            let serviceComp = ServiceCmpny()
            
            if let mainStr = serviceCompDict["Main"]
            {
                serviceComp.main = mainStr
            }
            if let msnNumberStr = serviceCompDict["MSNNumber"]
            {
                serviceComp.msnNumber = msnNumberStr
            }
            if let fuctionalityStr = serviceCompDict["Functionality"]
            {
                serviceComp.functionality = fuctionalityStr
            }
            if let executiveStr = serviceCompDict["Executive Man"]
            {
                serviceComp.executiveMan = executiveStr
            }
            if let contactNumStr = serviceCompDict["Contact Number"]
            {
                serviceComp.contactNumber = contactNumStr
            }
            if let emailStr = serviceCompDict["Email"]
            {
                serviceComp.email = emailStr
            }
            if let compRepStr = serviceCompDict["Company Representative"]
            {
                serviceComp.companyRep = compRepStr
            }
            if let ar_NameStr = serviceCompDict["AR/AP Name"]
            {
                serviceComp.ar_name = ar_NameStr
            }
            if let compAddStr = serviceCompDict["Company Address"]
            {
                serviceComp.companyAddress = compAddStr
            }
            
            serviceCompArray.append(serviceComp)
            
        }
        
        var designEngArray = [DesignEngg]()
        
        let designEngDict = reposeObject .object(at: 3) as! NSDictionary
        
        print("DesignEngDict \(designEngDict)");
        
        let designEngDetailInfoArray = designEngDict["DetailInfo"]as! [[String : String]]
        
        print("DesignEngDetailInfoArray \(designEngDetailInfoArray)");
        
        for designEngDict in designEngDetailInfoArray
        {
            let designEngg = DesignEngg()
            
            if let mainStr = designEngDict["Main"]
            {
                designEngg.main = mainStr
            }
            if let numberStr = designEngDict["Number"]
            {
                designEngg.number = numberStr
            }
            if let descripStr = designEngDict["Description"]
            {
                designEngg.descriptioon = descripStr
            }
            if let subMatStr = designEngDict["Subject Matter Expert"]
            {
                designEngg.subjectMatter = subMatStr
            }
            if let contactNumStr = designEngDict["Contact Number"]
            {
                designEngg.contactNumber = contactNumStr
            }
            if let emailStr = designEngDict["Email"]
            {
                designEngg.email = emailStr
            }
            if let enggStr = designEngDict["Company Engineer"]
            {
                designEngg.companyEngineer = enggStr
            }
            
            designEngArray.append(designEngg)
            
        }


        var fluidMakeUpArray = [FluidMakeUp]()
        
        let fluidMakeUpDict = reposeObject .object(at: 4) as! NSDictionary
        
        print("FluidMakeUpDict \(fluidMakeUpDict)");
        
        let fluidMakeUpDetailInfoArray = fluidMakeUpDict["DetailInfo"]as! [[String : String]]
        
        print("FluidMakeUpDetailInfoArray \(fluidMakeUpDetailInfoArray)");
        
        for fluidMakeUpDict in fluidMakeUpDetailInfoArray
        {
            let fluidMakeUp = FluidMakeUp()
            
            if let mainStr = fluidMakeUpDict["Main"]
            {
                fluidMakeUp.main = mainStr
            }
            if let numberStr = fluidMakeUpDict["Number"]
            {
                fluidMakeUp.number = numberStr
            }
            
            fluidMakeUpArray.append(fluidMakeUp)
            
        }

       

        var chemicalTreatingArray = [ChemicalTreating]()
        
        let chemicalTreatingDict = reposeObject .object(at: 5) as! NSDictionary
        
        print("ChemicalTreatingDict \(chemicalTreatingDict)");
        
        let chemicalTreatingInfoArray = chemicalTreatingDict["DetailInfo"]as! [[String : String]]
        
        print("ChemicalTreatingInfoArray \(chemicalTreatingInfoArray)");
        
        for chemicalTreatingDict in chemicalTreatingInfoArray
        {
            let chemicalTreating = ChemicalTreating()
            
            if let mainStr = chemicalTreatingDict["Main"]
            {
                chemicalTreating.main = mainStr
            }
            if let nameStr = chemicalTreatingDict["Name Of Chemical"]
            {
                chemicalTreating.nameOfChemical = nameStr
            }
            if let fixStr = chemicalTreatingDict["Fix"]
            {
                chemicalTreating.fix = fixStr
            }
            if let freqStr = chemicalTreatingDict["Frequency"]
            {
                chemicalTreating.frequency = freqStr
            }
            if let calculOfPartsPerMilionStr = chemicalTreatingDict["Calculation Of Parts Per Million"]
            {
                chemicalTreating.calculationOfParts = calculOfPartsPerMilionStr
            }
            if let serCompStr = chemicalTreatingDict["Service Company"]
            {
                chemicalTreating.serviceCompany = serCompStr
            }
            if let delivertStr = chemicalTreatingDict["Delivery"]
            {
                chemicalTreating.delivery = delivertStr
            }
            if let appDescStr = chemicalTreatingDict["Application Description"]
            {
                chemicalTreating.applicationDesp = appDescStr
            }
            if let contactNameStr = chemicalTreatingDict["Contact Number"]
            {
                chemicalTreating.contactNumber = contactNameStr
            }
            if let contactNumberStr = chemicalTreatingDict["Contact Name"]
            {
                chemicalTreating.contactName = contactNumberStr
            }
            if let contactEmailStr = chemicalTreatingDict["Contact Email"]
            {
                chemicalTreating.contactEmail = contactEmailStr
            }
            
            chemicalTreatingArray.append(chemicalTreating)
            
        }
        
        
        var rodStarArray = [RodStar]()
        
        let rodStarDict = reposeObject .object(at: 6) as! NSDictionary
        
        print("RodStarDict \(rodStarDict)");
        
        let rodStarDetailArray = rodStarDict["DetailInfo"]as! [[String : String]]
        
        print("RodStarDetailArray \(rodStarDetailArray)");
        
        for rodStarDict in rodStarDetailArray
        {
            let rodStar = RodStar()
            
            if let mainStr = rodStarDict["Main"]
            {
                rodStar.main = mainStr
            }
            if let numberStr = rodStarDict["Number"]
            {
                rodStar.number = numberStr
            }
            
            rodStarArray.append(rodStar)
            
        }

        var FailureAnalysisArray = [FailureAnalysis]()
        
        let failureAnalysisDict = reposeObject .object(at: 7) as! NSDictionary
        
        print("FailureAnalysisDict \(failureAnalysisDict)");
        
        let failureAnalysisDetailArray = failureAnalysisDict["DetailInfo"]as! [[String : String]]
        
        print("FailureAnalysisDetailArray \(failureAnalysisDetailArray)");
        
        for failureAnalysisDict in failureAnalysisDetailArray
        {
            let failureAnalysis = FailureAnalysis()
            
            if let mainStr = failureAnalysisDict["Main"]
            {
                failureAnalysis.main = mainStr
            }
            if let numberStr = failureAnalysisDict["Number"]
            {
                failureAnalysis.number = numberStr
            }
            
            FailureAnalysisArray.append(failureAnalysis)
            
        }
        
        wellInfo.contactInfoArray = contactsArray
        wellInfo.producingAssestArray = producingArray
        wellInfo.serviceCompArray = serviceCompArray
        wellInfo.designEnggArray = designEngArray
        wellInfo.fluidMakeUpArray = fluidMakeUpArray
        wellInfo.chemTretingArray = chemicalTreatingArray
        wellInfo.rodStarArray = rodStarArray
        wellInfo.failureAnalysisArray = FailureAnalysisArray
        
        wellInfoArray.append(wellInfo)
        
        return wellInfoArray
        
    }

}
