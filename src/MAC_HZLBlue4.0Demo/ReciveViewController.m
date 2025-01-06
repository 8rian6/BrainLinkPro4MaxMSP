//
//  ReciveViewController.m
//  MAC_HZLBlue4.0Demo
//
//  Created by 方亮 on 2018/6/24.
//  Copyright © 2018年 macrotellect. All rights reserved.
//

#import "ReciveViewController.h"
#import "Blue4Manager.h"
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>


typedef enum : NSUInteger {
    SIGNAL_STATE_NOSIGNAL = 0,//无信号
    SIGNAL_STATE_WEAK,//信号弱
    SIGNAL_STATE_GENERAL,//信号一般
    SIGNAL_STATE_GOOD,//信号很好
    SIGNAL_STATE_VERYGOOD,//信号非常好
    
} SignalState;


@interface ReciveViewController ()
{
    NSMutableArray *rawDataBuffer;
    int lastEyeblinkValue;
    //信号指示
    NSView *signalview;
    NSImageView *signalInstructions;
    dispatch_source_t timer;
    //信号状态
    SignalState signalState;
    int  baseCount;
    
    BOOL    isaccetable4;
    int lastXValue;
    int lastYValue;
    int lastZValue;
}


@property (weak) IBOutlet NSView *signalview;
@property (weak) IBOutlet NSTextField *conSumTf;
@property (weak) IBOutlet NSTextField *eyeblinkLabel;
@property (weak) IBOutlet NSTextField *electricityLabel;
@property (weak) IBOutlet NSTextField *attentionlabel;
@property (weak) IBOutlet NSTextField *medlabel;
@property (weak) IBOutlet NSTextField *favrouteRateLabel;
@property (weak) IBOutlet NSTextField *circleRateLabel;
@property (weak) IBOutlet NSTextField *rawLabel;
@property (weak) IBOutlet NSTextField *otherLabel;

//@property (weak) IBOutlet NSButton *isAutoConBleSwi;
//@property (weak) IBOutlet NSButton *conBle;
//@property (weak) IBOutlet NSButton *makeSureBu;

@property (strong)  NSImageView    *signalImageView;
@end

@implementation ReciveViewController



#pragma 改变连接个数 大于0的整数
//- (IBAction)makeSure:(id)sender {
//
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    [self startUDPListener];
    if (self.portNumber <= 0) {
            self.portNumber = 11123;
        NSLog(@"当前端口号为：%ld", (long)self.portNumber);
        }
    self.view.layer.backgroundColor = [NSColor lightGrayColor].CGColor;
    [self.view setNeedsDisplay:YES];
    rawDataBuffer = [NSMutableArray array];
    lastEyeblinkValue = -1;
    lastXValue = -1;
    lastYValue = -1;
    lastZValue = -1;
    //蓝牙连接指示灯外框
    signalInstructions       = [NSImageView new];
    signalInstructions.image = [NSImage imageNamed:@"signalOutlet"];
    signalInstructions.frame=CGRectMake(2, 0, 44, 44);
    [_signalview addSubview:signalInstructions];
    
    //随着蓝牙连接状态变化的指图标
    _signalImageView       = [NSImageView new];
    _signalImageView.tag   = 200;
    _signalImageView.frame=CGRectMake(2, 0, 44, 44);
    _signalImageView.image = [NSImage imageNamed:@"noSignal"];
    [_signalview addSubview:_signalImageView];

    NSTextField *tips      = [NSTextField new];
    tips.font          =[NSFont systemFontOfSize:14];
    tips.stringValue          = @"请正确佩戴设备";
    tips.textColor     = [NSColor whiteColor];
    [_signalview addSubview:tips];
    
    _otherLabel.maximumNumberOfLines = 2;
    [[_otherLabel cell] setUsesSingleLineMode:NO];
    
    //蓝牙连接
    [Blue4Manager logEnable:YES];
    [[Blue4Manager shareInstance] configureBlueNames:@[@"BrainLink_Pro"] ableDeviceSum:1];
    
    
    //连接蓝牙成功回调
    __weak ReciveViewController *weakSelf = self;
    [Blue4Manager shareInstance].blueConBlock  =  ^(NSString *markKey) {
        NSLog(@"连接蓝牙成功");
        
        
        

    };
    
    //蓝牙断开回调
    [Blue4Manager shareInstance].blueDisBlock  =   ^(NSString *markKey){
    
        self.signalImageView.image = [NSImage imageNamed:@"noSignal"];
        
        weakSelf.electricityLabel.stringValue = @"";
        weakSelf.attentionlabel.stringValue = @"";
        weakSelf.medlabel.stringValue = @"";
        weakSelf.favrouteRateLabel.stringValue = @"";
        weakSelf.circleRateLabel.stringValue = @"";
     
        weakSelf.rawLabel.stringValue = @"";
        
        weakSelf.otherLabel.stringValue = @"";
      
        NSLog(@"蓝牙断开");
    };
    
    
    [Blue4Manager shareInstance].hzlblueDataBlock_A = ^(HZLBlueData *hzlBlueData, BlueType conBT, BOOL isFalseCon) {
        NSString *peripID = @"";
        if (hzlBlueData.bleDataType==BLEMIND) {
            
            weakSelf.attentionlabel.stringValue  =   [NSString stringWithFormat:@"%@=%d",peripID,hzlBlueData.attention];
            
            weakSelf.medlabel.stringValue  =   [NSString stringWithFormat:@"%@=%d",peripID,hzlBlueData.meditation];
            weakSelf.electricityLabel.stringValue  =   [NSString stringWithFormat:@"%@=%d",peripID, hzlBlueData.batteryCapacity];
            weakSelf.favrouteRateLabel.stringValue = [NSString stringWithFormat:@"%@=%d  ",peripID,hzlBlueData.ap];
            
            NSString *hrvStr = @"";
            if (hzlBlueData.HRV != nil) {
                for (int i = 0; i < hzlBlueData.HRV.count; i++) {
                    if(i >= 1){
                        hrvStr = [hrvStr stringByAppendingString:[NSString stringWithFormat:@",%dms",[hzlBlueData.HRV[i] intValue]]];
                    }else{
                        hrvStr = [hrvStr stringByAppendingString:[NSString stringWithFormat:@"%dms",[hzlBlueData.HRV[i] intValue]]];
                    }
                }
            }
            
            weakSelf.otherLabel.stringValue = [NSString stringWithFormat:
                                               @"%@=Delta:%d Theta:%d LowAlpha:%d HighAlpha:%d LowBeta:%d HighBeta:%d LowGamma:%d HighGamma:%d  version:%@ grid=%@ , temp=%@, heartRate=%@, hrv=%@ ",peripID,hzlBlueData.delta,hzlBlueData.theta,hzlBlueData.lowAlpha,hzlBlueData.highAlpha,hzlBlueData.lowBeta,hzlBlueData.highBeta,hzlBlueData.lowGamma,hzlBlueData.highGamma,hzlBlueData.hardwareVersion,hzlBlueData.grind,hzlBlueData.temperature, hzlBlueData.heartRate, hrvStr];
            // 发送 HRV 数据到端口 self.portNumber
            if (hzlBlueData.HRV != nil && [hzlBlueData.HRV isKindOfClass:[NSArray class]]) {
                NSMutableArray *hrvArguments = [NSMutableArray array];
                for (NSNumber *hrvValue in hzlBlueData.HRV) {
                    [hrvArguments addObject:@(hrvValue.intValue)];
                }
                [self sendOSCMessageWithAddress:@"/hrvMs" andArguments:hrvArguments onPort:self.portNumber];
            }
         
            // 逐个发送脑波频段的数据
            [weakSelf sendOSCMessageWithAddress:@"/signalQuality" andArguments:@[@(hzlBlueData.signal)] onPort:self.portNumber];
            [weakSelf sendOSCMessageWithAddress:@"/battery%" andArguments:@[@(hzlBlueData.batteryCapacity)] onPort:self.portNumber];
            if (hzlBlueData.grind != nil) {
                float grindValue = [hzlBlueData.grind floatValue];
                [self sendOSCMessageWithAddress:@"/grind" andArguments:@[@(grindValue)] onPort:self.portNumber];
            }
            if (hzlBlueData.temperature != nil) {
                float temperatureValue = [hzlBlueData.temperature floatValue];
                [self sendOSCMessageWithAddress:@"/temp" andArguments:@[@(temperatureValue)] onPort:self.portNumber];
            }
            if (hzlBlueData.heartRate != nil) {
                int heartRateValue = [hzlBlueData.heartRate intValue];
                [self sendOSCMessageWithAddress:@"/heartRate" andArguments:@[@(heartRateValue)] onPort:self.portNumber];
            };

            [weakSelf sendOSCMessageWithAddress:@"/attention" andArguments:@[@(hzlBlueData.attention)] onPort:self.portNumber];
            [weakSelf sendOSCMessageWithAddress:@"/meditation" andArguments:@[@(hzlBlueData.meditation)] onPort:self.portNumber];
            [weakSelf sendOSCMessageWithAddress:@"/fvrate" andArguments:@[@(hzlBlueData.ap)] onPort:self.portNumber];
            // 发送8段脑波数据
            [weakSelf sendOSCMessageWithAddress:@"/delta" andArguments:@[@(hzlBlueData.delta)] onPort:self.portNumber];
               [weakSelf sendOSCMessageWithAddress:@"/theta" andArguments:@[@(hzlBlueData.theta)] onPort:self.portNumber];
               [weakSelf sendOSCMessageWithAddress:@"/lowAlpha" andArguments:@[@(hzlBlueData.lowAlpha)] onPort:self.portNumber];
               [weakSelf sendOSCMessageWithAddress:@"/highAlpha" andArguments:@[@(hzlBlueData.highAlpha)] onPort:self.portNumber];
               [weakSelf sendOSCMessageWithAddress:@"/loBeta" andArguments:@[@(hzlBlueData.lowBeta)] onPort:self.portNumber];
               [weakSelf sendOSCMessageWithAddress:@"/hiBeta" andArguments:@[@(hzlBlueData.highBeta)] onPort:self.portNumber];
               [weakSelf sendOSCMessageWithAddress:@"/lowGamma" andArguments:@[@(hzlBlueData.lowGamma)] onPort:self.portNumber];
               [weakSelf sendOSCMessageWithAddress:@"/midGamma" andArguments:@[@(hzlBlueData.highGamma)] onPort:self.portNumber];
            if (hzlBlueData.hardwareVersion != nil && [hzlBlueData.hardwareVersion isKindOfClass:[NSString class]]) {
                [self sendOSCMessageWithAddress:@"/hwVersion" andArguments:@[hzlBlueData.hardwareVersion] onPort:self.portNumber];
            } else {
                NSLog(@"Invalid hardwareVersion value: %@", hzlBlueData.hardwareVersion);
            }
            //信号值为0 即佩戴了蓝牙设备
            //注：如果连接了蓝牙设备而未佩戴，信号值为200
            [self changeSignalStateWithSignal:hzlBlueData.signal];
        }else if (hzlBlueData.bleDataType == BLEGRAVITY) {
            int currentXValue = hzlBlueData.xvlaue;
            int currentYValue = hzlBlueData.yvlaue;
            int currentZValue = hzlBlueData.zvlaue;

            if (currentXValue != self->lastXValue) {
                [self sendOSCMessageWithAddress:@"/x" andArguments:@[@(currentXValue)] onPort:self.portNumber];
                self->lastXValue = currentXValue;
            }
            
            if (currentYValue != self->lastYValue) {
                [self sendOSCMessageWithAddress:@"/y" andArguments:@[@(currentYValue)] onPort:self.portNumber];
                self->lastYValue = currentYValue;
            }
            
            if (currentZValue != self->lastZValue) {
                [self sendOSCMessageWithAddress:@"/z" andArguments:@[@(currentZValue)] onPort:self.portNumber];
                self->lastZValue = currentZValue;
            }
        }
            
        if (hzlBlueData.bleDataType == BLEGRAVITY) {
            weakSelf.circleRateLabel.stringValue = [NSString stringWithFormat:@"%@=x:%d y:%d z:%d ",peripID,hzlBlueData.xvlaue,hzlBlueData.yvlaue,hzlBlueData.zvlaue];
        }
        if(hzlBlueData.bleDataType == BLERaw)
        {
            weakSelf.rawLabel.stringValue = [NSString stringWithFormat:@"Raw: %d Blink: %d", hzlBlueData.raw, hzlBlueData.blinkeye];
            [self->rawDataBuffer addObject:@(hzlBlueData.raw)];
            
            if (self->rawDataBuffer.count >= 10) {
                [self sendOSCMessageWithAddress:@"/sensorDataRaw" andArguments:self->rawDataBuffer onPort:self.portNumber];
                [self->rawDataBuffer removeAllObjects];
            }
            
            if (hzlBlueData.blinkeye != self->lastEyeblinkValue) {
                int eyeblinkValue = hzlBlueData.blinkeye;
                weakSelf.eyeblinkLabel.stringValue = [NSString stringWithFormat:@"Eyeblink: %d", eyeblinkValue];
                NSArray *eyeblinkData = @[@(eyeblinkValue)];
                [self sendOSCMessageWithAddress:@"/eyeBlink" andArguments:eyeblinkData onPort:self.portNumber];
                self->lastEyeblinkValue = eyeblinkValue;
            }
        }
        
    };
    [[Blue4Manager shareInstance] connectBlue4WithIsAuto:YES];
    
}
- (void)sendOSCMessageWithAddress:(NSString *)address andArguments:(NSArray *)arguments onPort:(int)port {
    NSMutableData *data = [NSMutableData data];
    
    // 添加地址并确保4字节对齐
    NSData *addressData = [address dataUsingEncoding:NSUTF8StringEncoding];
    [data appendData:addressData];
    NSUInteger paddingLength = 4 - (data.length % 4);
    if (paddingLength != 4) {
        [data appendBytes:"\0\0\0\0" length:paddingLength];
    }

    // 动态生成类型标记
    NSMutableString *typeTag = [NSMutableString stringWithString:@","];
    for (id argument in arguments) {
        if ([argument isKindOfClass:[NSNumber class]]) {
            // 根据地址区分是发送浮点数还是整数
            if ([address isEqualToString:@"/temp"]) {
                [typeTag appendString:@"f"]; // 发送为浮点数
            } else {
                [typeTag appendString:@"i"]; // 发送为整数
            }
        } else if ([argument isKindOfClass:[NSString class]]) {
            [typeTag appendString:@"s"];
        }
    }
    NSData *typeTagData = [typeTag dataUsingEncoding:NSUTF8StringEncoding];
    [data appendData:typeTagData];
    paddingLength = 4 - (data.length % 4);
    if (paddingLength != 4) {
        [data appendBytes:"\0\0\0\0" length:paddingLength];
    }

    // 添加参数数据
    for (id argument in arguments) {
        if ([argument isKindOfClass:[NSNumber class]]) {
            if ([address isEqualToString:@"/temp"]) {
                // 发送浮点数
                float value = [argument floatValue];
                uint32_t networkValue;
                memcpy(&networkValue, &value, sizeof(value));
                networkValue = htonl(networkValue);
                [data appendBytes:&networkValue length:sizeof(networkValue)];
            } else {
                // 发送整数
                int32_t value = [argument intValue];
                value = htonl(value);
                [data appendBytes:&value length:sizeof(value)];
            }
        } else if ([argument isKindOfClass:[NSString class]]) {
            NSData *stringData = [argument dataUsingEncoding:NSUTF8StringEncoding];
            [data appendData:stringData];
            NSUInteger paddingLength = 4 - (data.length % 4);
            if (paddingLength != 4) {
                [data appendBytes:"\0\0\0\0" length:paddingLength];
            }
        }
    }

    // 配置 UDP 套接字
    int sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    struct sockaddr_in servaddr;
    memset(&servaddr, 0, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(port);
    servaddr.sin_addr.s_addr = inet_addr("127.0.0.1");

    sendto(sockfd, [data bytes], [data length], 0, (struct sockaddr *)&servaddr, sizeof(servaddr));
    close(sockfd);
}

#pragma mark 改变信号指示灯
- (void)changeSignalStateWithSignal:(int)signal{
    
    if (signal < 0){
        signalState = SIGNAL_STATE_NOSIGNAL;
    }
    else if (signal == 0) {
        signalState = SIGNAL_STATE_VERYGOOD;
    }
    else if (signal > 0 && signal <= 70){
        signalState = SIGNAL_STATE_GOOD;
    }
    else if (signal > 70 && signal <= 140){
        signalState = SIGNAL_STATE_GENERAL;
    }
    else if (signal > 140){
        signalState = SIGNAL_STATE_WEAK;
    }
    switch (signalState) {
        case SIGNAL_STATE_NOSIGNAL:
            _signalImageView.image = [NSImage imageNamed:@"signal_zhengChang-1"];
            baseCount =0;
            break;
        case SIGNAL_STATE_WEAK:
            if (baseCount==0) {
                [self  updateAN ];
            }
            [self countdown3s];
            break;
        case SIGNAL_STATE_GENERAL:
            
            [self countdown3s];
            break;
        case SIGNAL_STATE_GOOD:
            
            [self countdown3s];
            break;
        case SIGNAL_STATE_VERYGOOD:
        {
            baseCount=0;
            _signalImageView.image = [NSImage imageNamed:@"signal_zhengChang"];
            
        }
            break;
        default:
            break;
    }
    
}
-(void)updateAN
{
    baseCount=3   ;
    
//    CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    anima1.duration = 10.0;
//    //    anima1.delegate = self;
//    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(signalview.center.x,signalview.center.y)];
//    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(signalview.center.x -120, signalview.center.y)];
//    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(signalview.center.x -120, signalview.center.y)];
//    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(signalview.center.x,signalview.center.y)];
//    anima1.values = [NSArray arrayWithObjects:value0,value1,value3,value2, nil];
//    anima1.fillMode = kCAFillModeForwards;
//    anima1.removedOnCompletion = NO;
//    [signalview.layer addAnimation:anima1 forKey:nil];
}
- (void)countdown3s{
    if (timer == nil) {
        __block int timeout    = 3;//倒计时时间
        if (timeout!=0) {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            timer                 = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
            dispatch_source_set_timer(timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
            dispatch_source_set_event_handler(timer, ^{
                if(timeout<=0){ //倒计时结束，关闭
                    dispatch_source_cancel(self->timer);
                    self->timer = nil;
                }else{
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (timeout == 3) {
                            self->_signalImageView.image = [NSImage imageNamed:@"signal1"];
                        }
                        else if (timeout == 2) {
                            self->_signalImageView.image = [NSImage imageNamed:@"signal2"];
                        }
                        else{
                            self->_signalImageView.image = [NSImage imageNamed:@"signal3"];
                        }
                        
                    });
                    timeout--;
                }
            });
            dispatch_resume(timer);
        }
    }
}
- (void)startUDPListener {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        int sockfd = socket(AF_INET, SOCK_DGRAM, 0);
        if (sockfd < 0) {
            perror("Error creating UDP socket");
            return;
        }

        struct sockaddr_in serverAddr;
        memset(&serverAddr, 0, sizeof(serverAddr));
        serverAddr.sin_family = AF_INET;
        serverAddr.sin_addr.s_addr = htonl(INADDR_ANY); // 监听所有网络接口
        serverAddr.sin_port = htons(11124);            // 替换为你要监听的 UDP 端口号

        if (bind(sockfd, (struct sockaddr *)&serverAddr, sizeof(serverAddr)) < 0) {
            perror("Error binding UDP socket");
            close(sockfd);
            return;
        }

        NSLog(@"UDP Listener started on port %d", ntohs(serverAddr.sin_port));

        while (1) {
            char buffer[1024];
            struct sockaddr_in clientAddr;
            socklen_t addrLen = sizeof(clientAddr);
            ssize_t recvLen = recvfrom(sockfd, buffer, sizeof(buffer) - 1, 0, (struct sockaddr *)&clientAddr, &addrLen);

            if (recvLen > 0) {
                buffer[recvLen] = '\0'; // 确保字符串以 NULL 结尾
                NSString *receivedMessage = [[NSString alloc] initWithBytes:buffer
                                                                     length:recvLen
                                                                   encoding:NSUTF8StringEncoding];
                if (receivedMessage) {
                    NSLog(@"Processed message: %@", receivedMessage);

                    // 转发命令给硬件
                    [self sendCommandToHardware:receivedMessage];
                } else {
                    NSLog(@"Received non-UTF8 data");
                }
            }
        }
    });
}
- (void)sendCommandToHardware:(NSString *)command {
    // 将字符串转换为 NSData
    NSData *commandData = [command dataUsingEncoding:NSUTF8StringEncoding];

    if (commandData) {
        // 直接调用蓝牙发送方法（假设是 A 设备）
        [[Blue4Manager shareInstance] writeToProAWithCode:commandData];

        NSLog(@"Command sent to hardware: %@", command);
    } else {
        NSLog(@"Failed to convert command to data");
    }
}

#pragma 断开蓝牙
- (void)viewWillDisappear
{
    if(isaccetable4)
    {
        [[Blue4Manager shareInstance] disConnectBlue4];
    }
    
}
- (IBAction)dismiss:(id)sender {
    [self dismissViewController:self];
}
@end
