//
//  NAMenuItem.m
//
//  Created by Cameron Saul on 02/20/2012.
//  Copyright 2012 Cameron Saul. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "NAMenuItem.h"

@implementation NAMenuItem
@synthesize title;
@synthesize icon;
@synthesize targetViewControllerClass;
@synthesize description;
@synthesize boolIssue;
#pragma mark - Memory Management

- (id)initWithTitle:(NSString *)aTitle image:(UIImage *)image vcClass:(Class)targetClass desc:(NSString*)detail issueBool:(NSString*)isIssue {
	self = [super init];
	
	if (self) {
		title = [aTitle copy];
		icon = image;
		targetViewControllerClass = targetClass;
        _storyboardName = nil;
        description=detail;
        boolIssue= isIssue;
        
	}
	
	return self;
}

- (id)initWithTitle:(NSString *)aTitle image:(UIImage *)image storyBoard:(NSString *)storyBoard desc:(NSString*)detail {
	self = [super init];
	
	if (self) {
		title = [aTitle copy];
		icon = image;
		_storyboardName = storyBoard;
        targetViewControllerClass = nil;
        description=detail;
	}
	
	return self;
}


@end
