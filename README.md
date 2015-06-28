# PZCustomView

##What is it
* Xcode custom UIView templates, wich creates for you a XIB - loadable UIView subclass with it .XIB file configurated respectively.

##Templates

It comes with templates:
* Complete Custom View
A UIView subclass with .XIB loading logic and .XIB file itself.
* Base Custom View
A UIView subclass with .XIB loading logic (NO XIB file).
* Inherited Custom View
A custom UIView subclass and .XIB file (NO .XIB loading logic).

##How to install

###Via git clone

	cd ~/Library/Developer/Xcode/Templates/File\ Templates
	git clone https://github.com/zubco/PZCustomView.git PZCustomView

##How to use
* Access from Xcode menu "New File" option.
* Find in iOS templates "PZCustomView" and choose one from 3 templates.

![Find templates](https://github.com/zubco/PZCustomView/blob/master/Images/Find.png)

* After you complete wizard steps, you will have in project your custom view files.

![Project files](https://github.com/zubco/PZCustomView/blob/master/Images/ProjectFiles.png)

* Now you can go to your project storyboard or VC .XIB and drag & drop from Xcode "Object Library" a UIVIew object.

![Storyboard Scene](https://github.com/zubco/PZCustomView/blob/master/Images/StoryboardScene.png)

* And now from "Identity inspector" set this view object "Custom Class" to your custom view class.

![SCustom Class](https://github.com/zubco/PZCustomView/blob/master/Images/CustomClass.png)

* Just Build & Run :] 
