#import "NavBarTitleDropdownButton.h"
#import <WordPressShared/WPFontManager.h>

@implementation NavBarTitleDropdownButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupStyle];
    }

    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupStyle];
}

- (void)setupStyle
{
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.adjustsFontSizeToFitWidth = NO;
    self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    [self setImage:[UIImage imageNamed:@"icon-nav-chevron"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"icon-nav-chevron-highlight"] forState:UIControlStateHighlighted];
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGRect frame = [super imageRectForContentRect:contentRect];
    frame.origin.x = CGRectGetMaxX(contentRect) - CGRectGetWidth(frame) -  self.imageEdgeInsets.right + self.imageEdgeInsets.left;
    return frame;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect frame = [super titleRectForContentRect:contentRect];
    frame.origin.x = CGRectGetMinX(frame) - CGRectGetWidth([self imageRectForContentRect:contentRect]);
    return frame;
}

- (void)setAttributedTitleForTitle:(NSString *)title
{
    NSDictionary *attributes = @{NSForegroundColorAttributeName : [UIColor whiteColor],
                                 NSFontAttributeName : [WPFontManager systemBoldFontOfSize:16.0] };
    NSMutableAttributedString *titleText = [[NSMutableAttributedString alloc] initWithString:title
                                                                                  attributes:attributes];

    [self setAttributedTitle:titleText forState:UIControlStateNormal];
    [self setAttributedTitle:titleText forState:UIControlStateHighlighted];
    [self sizeToFit];
}

@end
