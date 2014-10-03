//
//  NAMenuViewController.m
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

#import "NAMenuViewController.h"

@implementation NAMenuViewController
@synthesize menuItems, delegate_NA;

#pragma mark - Memory Management



#pragma mark - View lifecycle

- (void)loadView {
	NAMenuView *menuView = [[NAMenuView alloc] init];
	menuView.menuDelegate = self;
	self.view = menuView;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
  
    if (buttonIndex == 0)
    {
        NSLog(@"Save");
        /*
         //Note: get index of type
         NSInteger row = [customPickerView selectedRowInComponent:0];
         
         NSNumber *tempType = 0;
         
         if(row>=7){
         tempType = @(row-7);
         }
         else if (row<=5){
         tempType = @(11-row);
         }
         
         NSLog(@"tempType: %d", [tempType intValue]);
         
         [delegate didPickNoteType:tempType];
         */
        NSNumber *tempType = 0;
        [delegate_NA didPickNoteType:tempType];
        
    }
    else
    {
        NSLog(@"Add details");
        NSLog(@"Note This Save button pressed");
        NSLog(@"detail");
        NSLog(@"INIT + PUSH");
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainWindow"
                                                             bundle: nil];
        DetailViewController *detailViewController = [[storyboard instantiateViewControllerWithIdentifier:@"Detail"] initWithNibName:@"Detail" bundle:nil];
        
        detailViewController.delegate = self.delegate_NA;
        
        [self presentViewController:detailViewController animated:YES completion:nil];
        
        /*
        //Note: get index of type
        NSInteger row = [customPickerView selectedRowInComponent:0];
        
        NSNumber *tempType = 0;
        
        if(row>=7){
            tempType = @(row-7);
        }
        else if (row<=5){
            tempType = @(11-row);
        }
        
        NSLog(@"tempType: %d", [tempType intValue]);
        
        [delegate didPickNoteType:tempType];
         */
        NSNumber *tempType = 0;
        [delegate_NA didPickNoteType:tempType];
    }
  
}

#pragma mark - NAMenuViewDelegate Methods

- (NSUInteger)menuViewNumberOfItems:(id)menuView {
	NSAssert([self menuItems], @"You must set menuItems before attempting to load.");
	return menuItems.count;
}

- (NAMenuItem *)menuView:(NAMenuView *)menuView itemForIndex:(NSUInteger)index {
	NSAssert([self menuItems], @"You must set menuItems before attempting to load.");
	return [menuItems objectAtIndex:index];
}

- (void)menuView:(NAMenuView *)menuView didSelectItemAtIndex:(NSUInteger)index {
	NSAssert([self menuItems], @"You must set menuItems before attempting to load.");
	
    UIViewController *viewController;
    NAMenuItem *menuItem = [self.menuItems objectAtIndex:index];
    if (menuItem.storyboardName) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:menuItem.storyboardName  bundle:nil];
        viewController = [sb instantiateInitialViewController];
    } else {
        Class class = [menuItem targetViewControllerClass];
        if([NSStringFromClass(class) isEqualToString: @"UIAlertView"])
        {
            UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:[menuItem title]
                                                             message:[menuItem description ]
                                                            delegate:self
                                                   cancelButtonTitle:@"Cancel"
                                                   otherButtonTitles: nil];
            [alert addButtonWithTitle:@"Save"];
            [alert addButtonWithTitle:@"Add details"];
            
            [alert show];

        }
        
        else
        {
        NSLog(@"Class TYpe is %@",class);
        viewController = [[class alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
        }
    }
	
}

@end