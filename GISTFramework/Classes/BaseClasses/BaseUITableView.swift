//
//  BaseTableView.swift
//  GISTFramework
//
//  Created by Shoaib Abdul on 14/06/2016.
//  Copyright © 2016 Social Cubix. All rights reserved.
//

import UIKit

open class BaseUITableView: UITableView, BaseView {
    
    @IBInspectable open var sizeForIPad:Bool = false;
    
    @IBInspectable open var bgColorStyle:String? = nil {
        didSet {
            self.backgroundColor = SyncedColors.color(forKey: bgColorStyle);
        }
    }
    
    @IBInspectable open var tintColorStyle:String? = nil {
        didSet {
            self.tintColor = SyncedColors.color(forKey: tintColorStyle);
        }
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
    } //F.E.
    
    open func updateView(){
        if let tintCStyle = tintColorStyle {
            self.tintColorStyle = tintCStyle;
        }
        
        if let bgCStyle = self.bgColorStyle {
            self.bgColorStyle = bgCStyle;
        }
    } //F.E.
    
    override open func layoutSubviews() {
        super.layoutSubviews();
    } //F.E.
    
} //CLS END
