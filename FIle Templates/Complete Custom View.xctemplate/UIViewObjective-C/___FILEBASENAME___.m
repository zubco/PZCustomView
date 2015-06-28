//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAME___.h"

@implementation ___FILEBASENAMEASIDENTIFIER___

#pragma mark - Lifecycle

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

/**
 Called at init time.
 
 Call [super commonInit] when use this method at inheritance.
 */
- (void)commonInit
{
    [self loadViewFromNib];
    
    [self.contentView setFrame:self.bounds];
    [self.contentView setBackgroundColor:[UIColor clearColor]];
    
    [self addSubview:self.contentView];
}

#pragma mark - Custom Accessors


#pragma mark - IBActions


#pragma mark - Public


#pragma mark - Private

/**
 Loads view from Nib, considering that nibName is the same as class name.
 */
- (void)loadViewFromNib
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:bundle];
    
    [nib instantiateWithOwner:self options:nil];
}

@end
