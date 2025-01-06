//
//  ViewController.m
//  MAC_HZLBlue4.0Demo
//
//  Created by 方亮 on 2018/6/24.
//  Copyright © 2018年 macrotellect. All rights reserved.
//

#import "ViewController.h"
#import "ReciveViewController.h"


@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.portTextField.delegate = self;
    self.confirmButton.enabled = YES;

       // 添加监听器，检测文本框内容变化
       [self.portTextField setTarget:self];
       [self.portTextField setAction:@selector(textFieldDidChange:)];

}

- (void)controlTextDidChange:(NSNotification *)obj {
    if (obj.object == self.portTextField) {
        NSString *text = self.portTextField.stringValue;
        
        // 过滤非数字字符
        NSCharacterSet *nonDigitCharacterSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
        NSString *filteredText = [[text componentsSeparatedByCharactersInSet:nonDigitCharacterSet] componentsJoinedByString:@""];
        
        // 限制最多五位数字
        if (filteredText.length > 5) {
            filteredText = [filteredText substringToIndex:5];
        }
        
        // 检查数值是否 >= 1024
        NSInteger value = [filteredText integerValue];
        
        if (value == 11124) { // 避免发送端口与监听端口冲突
            self.portTextField.textColor = [NSColor systemRedColor]; // 提示错误
            self.confirmButton.enabled = NO; // 按钮不可用
        } else if ((value < 1024 && filteredText.length > 0) || value > 65535) {
            self.portTextField.textColor = [NSColor systemRedColor]; // 提示错误
            self.confirmButton.enabled = NO; // 按钮变灰
        } else {
            self.portTextField.textColor = [NSColor labelColor]; // 正常输入
            self.confirmButton.enabled = YES; // 按钮可用
        }
        
        // 更新 TextField 内容
        self.portTextField.stringValue = filteredText;
    }
}

-(void)touchesBeganWithEvent:(NSEvent *)event
{
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)toGit:(id)sender {
    NSURL *url = [NSURL URLWithString:@"https://github.com/8rian6/BrainLinkPro4MaxMsp"];
    [[NSWorkspace sharedWorkspace] openURL:url];
   
}
- (IBAction)applyPort:(id)sender {
    ReciveViewController *receiveVC = [ReciveViewController new];
    receiveVC.portNumber = [self.portTextField.stringValue integerValue]; // 将输入的端口号传入
    [self presentViewControllerAsSheet:receiveVC]; // 使用设置好端口号的实例
}
@end
