//The MIT License (MIT)
//
//Copyright (c) 2014 Letsgood.com
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

#import "LGUniversalPlaceholder.h"

#define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)568) < DBL_EPSILON)


@interface LGUniversalPlaceholder()

@property(nonatomic) CGSize             titleMaxSize;
@property(nonatomic) CGFloat            titleTextSize;
@property(nonatomic, strong) UIColor   *titleTextColor;
@property(nonatomic) CGFloat            buttonTextSize;
@property(nonatomic, strong) UIColor   *buttonColor;
@property(nonatomic, strong) UIColor   *graphicColor;

// Content of placeholder
@property(nonatomic, strong) UIImageView                *icon;
@property(nonatomic, strong) UIActivityIndicatorView    *spinner;
@property(nonatomic, strong) UILabel                    *title;
@property(nonatomic, strong) UIButton                   *button;

@end;

@implementation LGUniversalPlaceholder

@synthesize titleMaxSize;
@synthesize titleTextSize;
@synthesize titleTextColor;
@synthesize buttonTextSize;
@synthesize buttonColor;
@synthesize graphicColor;
@synthesize icon;
@synthesize spinner;
@synthesize title;
@synthesize button;

-(void) setDefaults
{
    // Colors
    self.backgroundColor = [UIColor colorWithRed:250.0f/255.0f green:250.0f/255.0f blue:250.0f/255.0f alpha:1.0f];
    titleTextColor = [UIColor colorWithRed:179.0f/255.0f green:179.0f/255.0f blue:179.0f/255.0f alpha:1.0f];
    buttonColor = [UIColor colorWithRed:140.0f/255.0f green:140.0f/255.0f blue:140.0f/255.0f alpha:1.0f];
    graphicColor = [UIColor colorWithRed:179.0f/255.0f green:179.0f/255.0f blue:179.0f/255.0f alpha:1.0f];

    // Text size
    titleTextSize = 16;
    buttonTextSize = 16;
    
    // Max size of frame for title
    titleMaxSize = CGSizeMake(LGContentMaxWidth, 200);
}


-(id) initWithImage:(UIImage *)image toView:(UIView *)mainView
{
    self = [super initWithFrame: CGRectMake(0, 0, mainView.bounds.size.width, mainView.bounds.size.height)];
    
    [self setDefaults];
    
    [self initComponentImage:image];
    
    [self repositionComponents];
    
    // Add to parrent view
    [mainView addSubview: self];
    
    // Hidden as default
    [self hide];
    
    return (id)self;
}

-(id) initWithSpinnerToView:(UIView *)mainView
{
    self = [super initWithFrame: CGRectMake(0, 0, mainView.bounds.size.width, mainView.bounds.size.height)];
    
    [self setDefaults];
    
    [self initComponentSpinner];
    
    [self repositionComponents];
    
    // Add to parrent view
    [mainView addSubview: self];
    
    // Hidden as default
    [self hide];
    
    return (id)self;
}

-(id) initWithTitle:(NSString *)text toView:(UIView *)mainView
{
    self = [super initWithFrame: CGRectMake(0, 0, mainView.bounds.size.width, mainView.bounds.size.height)];
    
    [self setDefaults];
    
    [self initComponentTitle:text];
    
    [self repositionComponents];
    
    // Add to parrent view
    [mainView addSubview: self];
    
    // Hidden as default
    [self hide];
    
    return (id)self;
}

-(id) initWithButtonWithText:(NSString *)buttonText toView:(UIView *)mainView
{
    self = [super initWithFrame: CGRectMake(0, 0, mainView.bounds.size.width, mainView.bounds.size.height)];
    
    [self setDefaults];
    
    [self initComponentButton:buttonText];
    
    [self repositionComponents];
    
    // Add to parrent view
    [mainView addSubview: self];
    
    // Hidden as default
    [self hide];
    
    return (id)self;
}


-(id) initWithImage:(UIImage *)image andTitle:(NSString *)text toView:(UIView *)mainView
{
    self = [super initWithFrame: CGRectMake(0, 0, mainView.bounds.size.width, mainView.bounds.size.height)];
    
    [self setDefaults];
    
    [self initComponentImage:image];
    [self initComponentTitle:text];
    
    [self repositionComponents];
    
    // Add to parrent view
    [mainView addSubview: self];
    
    // Hidden as default
    [self hide];
    
    return (id)self;
}

-(id) initWithImage:(UIImage *)image andButtonWithText:(NSString *)buttonText toView:(UIView *)mainView
{
    self = [super initWithFrame: CGRectMake(0, 0, mainView.bounds.size.width, mainView.bounds.size.height)];
    
    [self setDefaults];
    
    [self initComponentImage:image];
    [self initComponentButton:buttonText];
    
    [self repositionComponents];
    
    // Add to parrent view
    [mainView addSubview: self];
    
    // Hidden as default
    [self hide];
    
    return (id)self;
}

-(id) initWithTitle:(NSString *)text andButtonWithText:(NSString *)buttonText toView:(UIView *)mainView
{
    self = [super initWithFrame: CGRectMake(0, 0, mainView.bounds.size.width, mainView.bounds.size.height)];
    
    [self setDefaults];
    
    [self initComponentTitle:text];
    [self initComponentButton:buttonText];
    
    [self repositionComponents];
    
    // Add to parrent view
    [mainView addSubview: self];
    
    // Hidden as default
    [self hide];
    
    return (id)self;
}

-(id) initWithImage:(UIImage *)image title:(NSString *)text andButtonWithText:(NSString *)buttonText toView:(UIView *)mainView
{
    self = [super initWithFrame: CGRectMake(0, 0, mainView.bounds.size.width, mainView.bounds.size.height)];
    
    [self setDefaults];
    
    [self initComponentImage:image];
    [self initComponentTitle:text];
    [self initComponentButton:buttonText];
    
    [self repositionComponents];
    
    // Add to parrent view
    [mainView addSubview: self];
    
    // Hidden as default
    [self hide];
    
    return (id)self;
}


-(id) initWithSpinnerAndTitle:(NSString *)text toView:(UIView *)mainView
{
    self = [super initWithFrame: CGRectMake(0, 0, mainView.bounds.size.width, mainView.bounds.size.height)];

    [self setDefaults];

    [self initComponentSpinner];
    [self initComponentTitle:text];
    
    [self repositionComponents];
    
    // Add to parrent view
    [mainView addSubview: self];
    
    // Hidden as default
    [self hide];
    
    return (id)self;
}

-(id) initWithSpinnerAndButtonWithText:(NSString *)buttonText toView:(UIView *)mainView
{
    self = [super initWithFrame: CGRectMake(0, 0, mainView.bounds.size.width, mainView.bounds.size.height)];
    
    [self setDefaults];
    
    [self initComponentSpinner];
    [self initComponentButton:buttonText];
    
    [self repositionComponents];
    
    // Add to parrent view
    [mainView addSubview: self];
    
    // Hidden as default
    [self hide];
    
    return (id)self;
}

-(id) initWithSpinnerAndTitle:(NSString *)text andButtonWithText:(NSString *)buttonText toView:(UIView *)mainView
{
    self = [super initWithFrame: CGRectMake(0, 0, mainView.bounds.size.width, mainView.bounds.size.height)];
    
    [self setDefaults];
    
    [self initComponentSpinner];
    [self initComponentTitle:text];
    [self initComponentButton:buttonText];
    
    [self repositionComponents];
    
    // Add to parrent view
    [mainView addSubview: self];
    
    // Hidden as default
    [self hide];
    
    return (id)self;
}


-(void) initComponentImage:(UIImage *)image
{
    icon = [[UIImageView alloc] initWithImage: image];
    icon.image = [icon.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [icon setTintColor: graphicColor];
    [self addSubview:icon];
}

-(void) initComponentSpinner
{
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [spinner setColor: graphicColor];
    [self addSubview:spinner];
}

-(void) initComponentTitle:(NSString *)text
{
    title = [[UILabel alloc] initWithFrame:CGRectMake(0, (self.frame.size.width-titleMaxSize.width)/2, titleMaxSize.width, titleMaxSize.height)];
    
    title.textAlignment = NSTextAlignmentCenter;
    title.lineBreakMode = NSLineBreakByWordWrapping;
    title.numberOfLines = 0;
    title.font = [UIFont systemFontOfSize: titleTextSize];
    title.text = text;
    title.textColor = titleTextColor;
    
    // Calculate multi-line height
    CGRect currentFrame = title.frame;
    CGSize expected = [text sizeWithFont:title.font constrainedToSize:titleMaxSize lineBreakMode:title.lineBreakMode];
    currentFrame.size.height = expected.height;
    title.frame = currentFrame;
    
    [self addSubview:title];
}

-(void) initComponentButton:(NSString *)buttonText
{
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:buttonText forState:UIControlStateNormal];
    
    CGSize stringsize = [buttonText sizeWithFont:[UIFont systemFontOfSize:buttonTextSize]];
    CGFloat buttonWidth = stringsize.width+2*LGButtonPaddingLeft;
    if (buttonWidth < LGContentMaxWidth)
    {
        [button setFrame:CGRectMake(0, 0, buttonWidth, 44)];
    }
    else
    {
        [button setFrame:CGRectMake(0, 0, LGContentMaxWidth, 44)];
    }
    
    // Style button
    button.backgroundColor = [UIColor clearColor];
    button.layer.borderWidth = 1.0f;
    button.layer.borderColor = buttonColor.CGColor;
    button.layer.cornerRadius = 5.0f;
    [button.titleLabel setFont:[UIFont systemFontOfSize:buttonTextSize]];
    [button setTitleColor:buttonColor forState:UIControlStateNormal];
    
    [self addSubview:button];
}


-(void) repositionComponents
{
    CGFloat firstComponentCenterY   = self.bounds.size.height;
    CGFloat secondComponentOriginY  = 0;
    CGFloat lastComponentOriginY    = 0;
    CGFloat frameCenterX            = self.frame.size.width/2;
    id graphic; // Representing inserted graphic – icon or spinner or nil

    
    if (icon) graphic = icon;
    else if (spinner) graphic = spinner;
    else graphic = nil;
    
   
    // Calculate position for components
    if (graphic && title && button)
    {
        firstComponentCenterY   -= (LGFirstMargin + title.frame.size.height + LGSecondMargin + button.frame.size.height);
        secondComponentOriginY  += (((UIView *)graphic).frame.size.height/2 + LGFirstMargin);
        lastComponentOriginY    += (((UIView *)graphic).frame.size.height/2 + LGFirstMargin + title.frame.size.height + LGSecondMargin);
    }
    else if (title && button)
    {
        firstComponentCenterY -= (LGFirstMargin + button.frame.size.height);
        secondComponentOriginY += (title.frame.size.height/2 + LGFirstMargin);
    }
    else if (graphic && title)
    {
        firstComponentCenterY   -= (LGFirstMargin + title.frame.size.height);
        secondComponentOriginY  += (((UIView *)graphic).frame.size.height/2 + LGFirstMargin);
    }
    else if (graphic && button)
    {
        firstComponentCenterY   -= (LGFirstMargin + button.frame.size.height);
        secondComponentOriginY  += (((UIView *)graphic).frame.size.height/2 + LGFirstMargin);
    }
    
    
    // To small screen
    if(firstComponentCenterY < 0)
    {
        NSLog(@"LGUniversalPlaceholder frame size is to small for all components which contains.");
        firstComponentCenterY = 0;
    }
    firstComponentCenterY /= 2;
    
    
    
    // Reposition components
    if (graphic && title && button)
    {
        ((UIView *)graphic).center = CGPointMake(frameCenterX, firstComponentCenterY);
        title.frame = CGRectMake((self.frame.size.width-title.frame.size.width)/2, firstComponentCenterY+secondComponentOriginY, title.frame.size.width, title.frame.size.height);
        button.frame = CGRectMake((self.frame.size.width-button.frame.size.width)/2, firstComponentCenterY+lastComponentOriginY, button.frame.size.width, button.frame.size.height);
    }
    else if (title && button)
    {
        title.center = CGPointMake(frameCenterX, firstComponentCenterY);
        button.frame = CGRectMake((self.frame.size.width-button.frame.size.width)/2, firstComponentCenterY+secondComponentOriginY, button.frame.size.width, button.frame.size.height);
    }
    else if (graphic && title)
    {
        ((UIView *)graphic).center = CGPointMake(frameCenterX, firstComponentCenterY);
        title.frame = CGRectMake((self.frame.size.width-title.frame.size.width)/2, firstComponentCenterY+secondComponentOriginY, title.frame.size.width, title.frame.size.height);
    }
    else if (graphic && button)
    {
        ((UIView *)graphic).center = CGPointMake(frameCenterX, firstComponentCenterY);
        button.frame = CGRectMake((self.frame.size.width-button.frame.size.width)/2, firstComponentCenterY+secondComponentOriginY, button.frame.size.width, button.frame.size.height);
    }
    else if (graphic)
    {
        ((UIView *)graphic).center = CGPointMake(frameCenterX, firstComponentCenterY);
    }
    else if (title)
    {
        title.center = CGPointMake(frameCenterX, firstComponentCenterY);
    }
    else if (button)
    {
        button.center = CGPointMake(frameCenterX, firstComponentCenterY);
    }
    
    
    // Redraw view
    [self setNeedsDisplay];
}



-(void) show
{
    self.hidden = NO;
    
    if(spinner)
       [spinner startAnimating];
}


-(void) hide
{
    self.hidden = YES;
    
    if(spinner)
        [spinner stopAnimating];
}



-(void) setTitleTextSize:(CGFloat)size
{
    titleTextSize = size;
    title.font = [UIFont systemFontOfSize: titleTextSize];
    
    // Calculate multi-line height
    CGRect currentFrame = title.frame;
    CGSize expected = [title.text sizeWithFont:title.font constrainedToSize:titleMaxSize lineBreakMode:title.lineBreakMode];
    currentFrame.size.height = expected.height;
    title.frame = currentFrame;
    
    [self repositionComponents];
}
-(void) setButtonTextSize:(CGFloat)size
{
    buttonTextSize = size;
    [button.titleLabel setFont:[UIFont systemFontOfSize:buttonTextSize]];
    CGSize stringsize = [button.titleLabel.text sizeWithFont:[UIFont systemFontOfSize:buttonTextSize]];
    CGFloat buttonWidth = stringsize.width+2*LGButtonPaddingLeft;
    if (buttonWidth < LGContentMaxWidth)
    {
        [button setFrame:CGRectMake(self.frame.size.width/2-buttonWidth/2, button.frame.origin.y, buttonWidth, 44)];
    }
    else
    {
        [button setFrame:CGRectMake(self.frame.size.width/2-buttonWidth/2, button.frame.origin.y, LGContentMaxWidth, 44)];
    }
    
    [self setNeedsDisplay];
}

-(void) setTitleTextColor:(UIColor *)color
{
    titleTextColor = color;
    title.textColor = titleTextColor;
    [self setNeedsDisplay];
}

-(void) setButtonColor:(UIColor *)color
{
    buttonColor = color;
    button.layer.borderColor = buttonColor.CGColor;
    [button setTitleColor:buttonColor forState:UIControlStateNormal];
    [self setNeedsDisplay];
}

-(void) setGraphicColor:(UIColor *)color
{
    graphicColor = color;
    [icon setTintColor: graphicColor];
    [self setNeedsDisplay];
}


-(void) setSelectorWithTarget:(id)target action:(SEL)action
{
    if (button) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }

}


+(CGRect) initPlaceholderFrameWithX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;
{
    CGFloat uniHeight = height;
    
    if(IS_IPHONE_5) uniHeight += 88;
    
    return CGRectMake(x, y, width, uniHeight);
}

@end
