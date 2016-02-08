//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import UIKit

class ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_cocoaTouchSubclass___ {
    
    /// If you want to customize this view by simply adding additional views, you should add them to the content view
    @IBOutlet weak private(set) var contentView: UIView!
    
    // MARK: - Lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    /**
    Called at init time.
    
    Call super.commonInit() when use this method at inheritance.
    */
    func commonInit() {
        loadViewFromNib()
        
        contentView.frame = bounds
        contentView.backgroundColor = UIColor.clearColor()
        
        addSubview(contentView)
    }
    
    /**
    Loads view from Nib, considering that nibName is the same as class name.
    */
    func loadViewFromNib() {
        let nibName = String(self.dynamicType)
        let bundle  = NSBundle(forClass: self.dynamicType)
        let nib     = UINib(nibName: nibName, bundle: bundle)
        nib.instantiateWithOwner(self, options: nil)
    }
}
