//
//  NSObject+Abstract.h
//  Spotlight
//
//  Created by abell on 2/10/14.
//  Copyright (c) 2014 Steve Dini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Abstract)

- (id)subclassResponsibility:(SEL)aSel;

@end
