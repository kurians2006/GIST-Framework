//
//  CustomButton.swift
//  GISTFramework
//
//  Created by Shoaib Abdul on 14/06/2016.
//  Copyright © 2016 Social Cubix. All rights reserved.
//

import UIKit

open class CustomUIButtonDetailed: CustomUIButton {
    
    @IBInspectable open var detailText:String? {
        get {
            return self.detailLabel.text;
        }
        
        set {
            self.detailLabel.text = newValue;
        }
    } //P.E.
    
    //Detail text font style - 'medium' is default
    @IBInspectable open var dFontStyle:String = "medium" {
        didSet {
            self.detailLabel.fontStyle = self.dFontStyle;
        }
    }
    
    //Detail text font color style
    @IBInspectable open var dFontColorStyle:String? {
        didSet {
            self.detailLabel.fontColorStyle = (self.isSelected == true) ? dSelectedFontColorStyle ?? self.dFontColorStyle:self.dFontColorStyle;
        }
    }
    
    //Detail text selected state font color style
    @IBInspectable open var dSelectedFontColorStyle:String? {
        didSet {
            self.detailLabel.fontColorStyle = (self.isSelected == true) ? dSelectedFontColorStyle ?? self.dFontColorStyle:self.dFontColorStyle;
        }
    }
    
    //Padding between the title and detail text
    fileprivate var _detailOffSet:CGPoint = CGPoint.zero;
    @IBInspectable open var detailOffSet:CGPoint {
        set {
            _detailOffSet = newValue;
        }
        
        get {
            return GISTUtility.convertPointToRatio(_detailOffSet);
        }
    } //P.E.
    
    fileprivate var _detailLabel: BaseUILabel?;
    var detailLabel: BaseUILabel {
        get {
            if (_detailLabel == nil) {
                _detailLabel = BaseUILabel();
                _detailLabel?.sizeForIPad = self.sizeForIPad;
                _detailLabel!.textAlignment = NSTextAlignment.center;
                _detailLabel!.backgroundColor = UIColor.clear;
                self.addSubview(_detailLabel!);
            }
            
            return _detailLabel!;
        }
    } //P.E.
    
    //Off set for internal calculation
    internal override var offSetFix:CGPoint {
        get {
            let offSetV1:CGPoint = self.titleOffSet;
            let offSetV2:CGPoint = self.detailOffSet;
            //--
            let offSetFixV:CGPoint = CGPoint(x: (offSetV1.x == 0 || !self.containtCenter) ?0:self.titleLabel!.frame.size.width + self.detailLabel.frame.size.width + offSetV1.x + offSetV2.x, y: (offSetV1.y == 0 || !self.containtCenter) ?0:self.titleLabel!.frame.size.height + self.detailLabel.frame.size.height + offSetV1.y + offSetV1.y);
            
            return offSetFixV;
        }
    } //P.E.
    
    //Updated calculation of frame for detail text label
    fileprivate var detailLabelFrame:CGRect {
        get {
            let offSet:CGPoint = self.detailOffSet;
            //--
            var rFrame:CGRect = self.detailLabel.frame;
            
            if (offSet.x == 0) {
                rFrame.origin.x = self.imageView!.frame.origin.x + ((self.imageView!.frame.size.width - rFrame.size.width) / 2.0);
            } else if (self.reversedOrder) {
                rFrame.origin.x = self.titleLabel!.frame.origin.x - rFrame.size.width - offSet.x;
            } else {
                rFrame.origin.x = self.titleLabel!.frame.origin.x + self.titleLabel!.frame.size.width + offSet.x;
            }
            
            
            if (offSet.y == 0) {
                rFrame.origin.y = self.imageView!.frame.origin.y + ((self.imageView!.frame.size.height - rFrame.size.height) / 2.0);
            } else if (self.reversedOrder) {
                rFrame.origin.y = self.titleLabel!.frame.origin.y - rFrame.size.height - offSet.y;
            } else {
                rFrame.origin.y = self.titleLabel!.frame.origin.y + self.titleLabel!.frame.size.height + offSet.y;
            }
            
            return rFrame;
        }
    } //F.E.
    
    override open var isSelected:Bool {
        get  {
            return super.isSelected;
        }
        
        set {
            super.isSelected = newValue;
            //--
            self.detailLabel.fontColorStyle = (newValue == true) ? dSelectedFontColorStyle ?? self.dFontColorStyle:self.dFontColorStyle;
        }
    } //P.E.
    
    override func commontInit() {
        super.commontInit();
        //--
        self.detailLabel.font = self.titleLabel!.font;
    } //F.E.
    
    override open func updateView()  {
        super.updateView();
        //--
        self.detailLabel.updateView();
    } //F.E.
    
    override open func layoutSubviews() {
        super.layoutSubviews();
        
        //Reseting the frame to get proper height and width of text
        self.detailLabel.sizeToFit();
        
        //Setting calculated frame
        self.detailLabel.frame = self.detailLabelFrame;
    } //F.E.
} //CLS END
