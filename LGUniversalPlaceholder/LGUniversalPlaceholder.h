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

#import <UIKit/UIKit.h>
#import "NSObject+Abstract.h"

const static CGFloat LGFirstMargin = 15.0f;
const static CGFloat LGSecondMargin = 20.0f;
const static CGFloat LGButtonPaddingLeft = 25.0f;
const static CGFloat LGContentMaxWidth = 280.0f;


@interface LGUniversalPlaceholder : UIView

@property (nonatomic) BOOL customSubclassing;

-(id) initClearToView:(UIView *)mainView;
-(id) initBlankToView:(UIView *)mainView;
/**
 *  Initializes and returns newly allocated placeholder object with specified components.
 *
 *  @param image      image to be shown
 *  @param mainView   view that will be "filled" with placeholder
 *
 *  @return new allocated placeholder object, created as hidden
 */
-(id) initWithImage:(UIImage *)image toView:(UIView *)mainView;


/**
 *  Initializes and returns newly allocated placeholder object with specified components.
 *
 *  @param text       text to be shown
 *  @param mainView   view that will be "filled" with placeholder
 *
 *  @return new allocated placeholder object, created as hidden
 */
-(id) initWithTitle:(NSString *)text toView:(UIView *)mainView;


/**
 *  Initializes and returns newly allocated placeholder object with specified components.
 *
 *  @param buttonText text to be shown in button
 *  @param mainView   view that will be "filled" with placeholder
 *
 *  @return new allocated placeholder object, created as hidden
 */
-(id) initWithButtonWithText:(NSString *)buttonText toView:(UIView *)mainView;
-(id) initWithTitle:(NSString *)text andButtonWithText:(NSString *)buttonText toView:(UIView *)mainView;


/**
 *  Initializes and returns newly allocated placeholder object with specified components.
 *
 *  @param image    image to be shown
 *  @param text     text to be shown
 *  @param mainView view that will be "filled" with placeholder
 *
 *  @return new allocated placeholder object, created as hidden
 */
-(id) initWithImage:(UIImage *)image andTitle:(NSString *)text toView:(UIView *)mainView;


/**
 *  Initializes and returns newly allocated placeholder object with specified components.
 *
 *  @param image      image to be shown
 *  @param buttonText text to be shown in button
 *  @param mainView   view that will be "filled" with placeholder
 *
 *  @return new allocated placeholder object, created as hidden
 */
-(id) initWithImage:(UIImage *)image andButtonWithText:(NSString *)buttonText toView:(UIView *)mainView;


/**
 *  Initializes and returns newly allocated placeholder object with specified components.
 *
 *  @param image      image to be shown
 *  @param text       text to be shown
 *  @param buttonText text to be shown in button
 *  @param mainView   mainView   view that will be "filled" with placeholder
 *
 *  @return new allocated placeholder object, created as hidden
 */
-(id) initWithImage:(UIImage *)image title:(NSString *)text andButtonWithText:(NSString *)buttonText toView:(UIView *)mainView;


/**
 *  Initializes and returns newly allocated placeholder object with progress indicator (spinner).
 *
 *  @param mainView   view that will be "filled" with placeholder
 *
 *  @return new allocated placeholder object, created as hidden
 */
-(id) initWithSpinnerToView:(UIView *)mainView;


/**
 *  Initializes and returns newly allocated placeholder object with specified components and progress indicator (spinner).
 *
 *  @param text       text to be shown
 *  @param mainView   view that will be "filled" with placeholder
 *
 *  @return new allocated placeholder object, created as hidden
 */
-(id) initWithSpinnerAndTitle:(NSString *)text toView:(UIView *)mainView;


/**
 *  Initializes and returns newly allocated placeholder object with specified components and progress indicator (spinner).
 *
 *  @param buttonText text to be shown in button
 *  @param mainView   view that will be "filled" with placeholder
 *
 *  @return new allocated placeholder object, created as hidden
 */
-(id) initWithSpinnerAndButtonWithText:(NSString *)buttonText toView:(UIView *)mainView;


/**
 *  Initializes and returns newly allocated placeholder object with specified components and progress indicator (spinner).
 *
 *  @param text       text to be shown
 *  @param buttonText text to be shown in button
 *  @param mainView   view that will be "filled" with placeholder
 *
 *  @return new allocated placeholder object, created as hidden
 */
-(id) initWithSpinnerAndTitle:(NSString *)text andButtonWithText:(NSString *)buttonText toView:(UIView *)mainView;


/**
 *  Shows placeholder.
 */
-(void) show;


/**
 *  Hides placeholder.
 */
-(void) hide;


/**
 *  Sets system font size for title.
 *
 *  @param size new size of placeholder text of title
 */
-(void) setTitleTextSize:(CGFloat)size;


/**
 *  Sets system font size for button.
 *
 *  @param size new size of placeholder text of button
 */
-(void) setButtonTextSize:(CGFloat)size;


/**
 *  Sets title color.
 *
 *  @param color new color of placeholder title
 */
-(void) setTitleTextColor:(UIColor *)color;


/**
 *  Sets button color.
 *
 *  @param color new color of placeholder button
 */
-(void) setButtonColor:(UIColor *)color;


/**
 *  Sets image or spinner color.
 *
 *  @param color new color of placeholder image or spinner
 */
-(void) setGraphicColor:(UIColor *)color;


/**
 *  Sets target and action to be called if placeholder button will be pressed.
 *
 *  @param target target object to which the action message is sent
 *  @param action a selector identifying an action message
 */
-(void) setSelectorWithTarget:(id)target action:(SEL)action;


/**
 *  Inits CGRect with size to fit 3,5' and 4' display height.
 *
 *  @param x      Origin X
 *  @param y      Origin Y
 *  @param width  Width of the frame (iPhone display width is 320)
 *  @param height Height of the frame for 3,5' display – height for 4' display will be calculated
 *
 *  @return CGRect with passed x, y and width and height according to display size
 */
+(CGRect) initPlaceholderFrameWithX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;

@end
