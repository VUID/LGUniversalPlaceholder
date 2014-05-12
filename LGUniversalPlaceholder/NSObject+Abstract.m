//
//  NSObject+Abstract.m
//  Spotlight
//
//  Created by abell on 2/10/14.
//  Copyright (c) 2014 Steve Dini. All rights reserved.
//

#import "NSObject+Abstract.h"
#import <objc/runtime.h>

@implementation NSObject (Abstract)

- (id)subclassResponsibility:(SEL)aSel {
    char	c = (class_isMetaClass(object_getClass(self)) ? '+' : '-');
    
    [NSException raise: NSInvalidArgumentException
                format: @"[%@%c%@] should be overridden by subclass",
     NSStringFromClass([self class]), c,
     aSel ? (id)NSStringFromSelector(aSel) : (id)@"(null)"];
    return self;	// Not reached
}

@end
