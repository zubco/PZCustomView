//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import <UIKit/UIKit.h>

@interface ___FILEBASENAMEASIDENTIFIER___ : UIView

/// Any subviews should be added to contentView
@property (strong, nonatomic) IBOutlet UIView *contentView;

@end

@interface UIView (NibLoading)

- (void)loadFromNib;

@end
