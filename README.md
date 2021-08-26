# PZCustomView

## Deprecated
Latest versions of Xcode doesn't support custom file/project templates any more. Rest in peace ⚰️.

## What is it ?
Xcode - custom UIView templates, that creates for you a nib - loadable UIView subclass with it's .xib file respectively.

It comes with Swift & Objective-C templates

## Why even use it?
1. Other methods are error prone and not consistent with all other components of the UIKit
2. This approach will work just fine with both initializers:
```
init?(coder aDecoder: NSCoder)
init(frame: CGRect)
```
   It means view user can initialize your custom view from code or just drag & drop it into any UI file (.storyboard or .xib).

3. Because of how it is easy to setup this custom views you can compose them in any possible hierarchies without penalties by only using Xcode UI builder 

## Some insights
Created file (.swift) will have following structure:
```
class TestView: UIView {
    @IBOutlet weak private(set) var contentView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        loadFromNib()
        
        contentView.frame = bounds
        
        addSubview(contentView)
    }
}
```

And a UIView extension if you opted in for it.
You should do so only first time and it’s a good idea to move this extension to a separate file
```
extension UIView {
    func loadFromNib() {
        let nibName = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        nib.instantiate(withOwner: self)
    }
}
```

Let *FancyCustomView* be the class name indicated at creation, then you will have following files created for you
```
FancyCustomView.swift
FancyCustomView.xib
```

So, for nibName is enough to have:

`let nibName = String(describing: type(of: self))`

In this case the *nibName* will have *FancyCustomView* value

Here we load class Bundle object:

`let bundle = Bundle(for: type(of: self))`

Initiating UINib file:

`let nib = UINib(nibName: nibName, bundle: bundle)`

But it actually only caches the contents of the nib file in memory, not doing actual work here; From Apple docs:

`A UINib object caches the contents of a nib file in memory, ready for unarchiving and instantiation.`

So, next we calling:

`nib.instantiate(withOwner: self)`

Only at this stage `contentView`  and any other outlets get their values from .xib

## And *More*
Because of how nib loading work in UIKit, nib - *File’s owner* should be an object that is already initialized and this pattern can be observed already in:
1. UIViewController *with* view
2. UITableViewCell / UICollectionViewCell *with* contentView

So, from outside we will initialize only a wrapper that will load from .xib it’s content in form of *contentView* and any subviews added to it;

By default *contentView* has autoresizingMask with autoresizing width & height and backgroundColor set to clear:

```
<autoresizingMask key=“autoresizingMask” widthSizable=“YES” heightSizable=“YES”/>
<color key=“backgroundColor” red=“0.0” green=“0.0” blue=“0.0” alpha=“0.0” colorSpace=“custom” customColorSpace=“sRGB”/>
```
That’s why this part is missing from *commonInit*.

Only customization needed to *contentView* observed in code is:

`contentView.frame = bounds`

After this point there is no need to worry about layout if constraints are set correctly inside your *FancyCustomView.xib* (remember UITableViewCell analogy, things here work in same way)

## How to install
1. Clone or download repository
2. Copy *Custom View.xctemplate* folder to:

`~/Library/Developer/Xcode/Templates/File Templates/User Interface/`

## How to use
1. Access from Xcode menu *New File* option.
2. In *iOS* tab, *User interface* category find *Custom view* option.
   
<p align="center">
   <img src="https://github.com/zubco/PZCustomView/blob/master/Images/FindTemplate.png" width="600">
   <img src="https://github.com/zubco/PZCustomView/blob/master/Images/Wizard.png" width="600">
</p>

3. After you complete wizard steps, you will have in project your custom view files ( .swift + .xib or .h, .m + .xib).

<p align="center">
   <img src="https://github.com/zubco/PZCustomView/blob/master/Images/ProjectFiles.png" width="300">
</p>

4. Go to a storyboard or any other .xib file and drag & drop from *Object Library* a UIView object.

<p align="center">
   <img src="https://github.com/zubco/PZCustomView/blob/master/Images/StoryboardScene.png" width="300">
</p>

5. For this object from *Identity inspector* set it's *Custom Class* to your recently created UIView subclass.

<p align="center">
   <img src="https://github.com/zubco/PZCustomView/blob/master/Images/CustomClass.png" width="300">
</p>

6. Ready to go :]
