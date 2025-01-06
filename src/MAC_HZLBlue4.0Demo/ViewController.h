//
//  ViewController.h
//  MAC_HZLBlue4.0Demo
//
//  Created by 方亮 on 2018/6/24.
//  Copyright © 2018年 macrotellect. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController <NSTextFieldDelegate>
@property (weak) IBOutlet NSTextField *portTextField;
@property (weak) IBOutlet NSButton *confirmButton;
- (IBAction)applyPort:(id)sender;
- (void)updatePort:(NSInteger)port;


@end

