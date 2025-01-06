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
            // 发送 HRV 数据到端口 11123
            if (hzlBlueData.HRV != nil && [hzlBlueData.HRV isKindOfClass:[NSArray class]]) {
                [weakSelf sendOSCMessageWithAddress:@"/hrv" andArguments:hzlBlueData.HRV onPort:11123];
            }
           /* NSArray *sensorData = @[
                @(hzlBlueData.signal),                    // 信号强度
                @(hzlBlueData.batteryCapacity),          // 电池电量
                hzlBlueData.grind,                       // 磨牙检测
                @([hzlBlueData.temperature floatValue]), // 温度
                hzlBlueData.heartRate,                   // 心率
                @(hzlBlueData.attention),                // 注意力
                @(hzlBlueData.meditation),               // 冥想度
                @(hzlBlueData.ap),                       // 喜爱度
                @(hzlBlueData.delta),                    // Delta 波
                @(hzlBlueData.theta),                    // Theta 波
                @(hzlBlueData.lowAlpha),                 // Low Alpha 波
                @(hzlBlueData.highAlpha),                // High Alpha 波
                @(hzlBlueData.lowBeta),                  // Low Beta 波
                @(hzlBlueData.highBeta),                 // High Beta 波
                @(hzlBlueData.lowGamma),                 // Low Gamma 波
                @(hzlBlueData.highGamma),                // High Gamma 波
                hzlBlueData.hardwareVersion,             // 设备版本
            ];*/
            // 逐个发送脑波频段的数据
            [weakSelf sendOSCMessageWithAddress:@"/signal" andArguments:@[@(hzlBlueData.signal)] onPort:11123];
            [weakSelf sendOSCMessageWithAddress:@"/batteryCapacity" andArguments:@[@(hzlBlueData.batteryCapacity)] onPort:11123];
            [weakSelf sendOSCMessageWithAddress:@"/grind" andArguments:@[hzlBlueData.grind] onPort:11123];
            [weakSelf sendOSCMessageWithAddress:@"/temperature" andArguments:@[@([hzlBlueData.temperature floatValue])] onPort:11123];
            [weakSelf sendOSCMessageWithAddress:@"/heartRate" andArguments:@[@(hzlBlueData.heartRate.intValue)] onPort:11123];

            [weakSelf sendOSCMessageWithAddress:@"/attention" andArguments:@[@(hzlBlueData.attention)] onPort:11123];
            [weakSelf sendOSCMessageWithAddress:@"/meditation" andArguments:@[@(hzlBlueData.meditation)] onPort:11123];
            [weakSelf sendOSCMessageWithAddress:@"/favrate" andArguments:@[@(hzlBlueData.ap)] onPort:11123];
            // 发送8段脑波数据
            [weakSelf sendOSCMessageWithAddress:@"/delta" andArguments:@[@(hzlBlueData.delta)] onPort:11123];
               [weakSelf sendOSCMessageWithAddress:@"/theta" andArguments:@[@(hzlBlueData.theta)] onPort:11123];
               [weakSelf sendOSCMessageWithAddress:@"/lowAlpha" andArguments:@[@(hzlBlueData.lowAlpha)] onPort:11123];
               [weakSelf sendOSCMessageWithAddress:@"/highAlpha" andArguments:@[@(hzlBlueData.highAlpha)] onPort:11123];
               [weakSelf sendOSCMessageWithAddress:@"/lowBeta" andArguments:@[@(hzlBlueData.lowBeta)] onPort:11123];
               [weakSelf sendOSCMessageWithAddress:@"/highBeta" andArguments:@[@(hzlBlueData.highBeta)] onPort:11123];
               [weakSelf sendOSCMessageWithAddress:@"/lowGamma" andArguments:@[@(hzlBlueData.lowGamma)] onPort:11123];
               [weakSelf sendOSCMessageWithAddress:@"/highGamma" andArguments:@[@(hzlBlueData.highGamma)] onPort:11123];
            [weakSelf sendOSCMessageWithAddress:@"/Version" andArguments:@[hzlBlueData.hardwareVersion] onPort:11123];
            //信号值为0 即佩戴了蓝牙设备
            //注：如果连接了蓝牙设备而未佩戴，信号值为200
            [self changeSignalStateWithSignal:hzlBlueData.signal];
        }else if (hzlBlueData.bleDataType == BLEGRAVITY) {
            int currentXValue = hzlBlueData.xvlaue;
            int currentYValue = hzlBlueData.yvlaue;
            int currentZValue = hzlBlueData.zvlaue;

            if (currentXValue != self->lastXValue) {
                [self sendOSCMessageWithAddress:@"/x" andArguments:@[@(currentXValue)] onPort:11123];
                self->lastXValue = currentXValue;
            }
            
            if (currentYValue != self->lastYValue) {
                [self sendOSCMessageWithAddress:@"/y" andArguments:@[@(currentYValue)] onPort:11123];
                self->lastYValue = currentYValue;
            }
            
            if (currentZValue != self->lastZValue) {
                [self sendOSCMessageWithAddress:@"/z" andArguments:@[@(currentZValue)] onPort:11123];
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
                [self sendOSCMessageWithAddress:@"/sensordataraw" andArguments:self->rawDataBuffer onPort:11123];
                [self->rawDataBuffer removeAllObjects];
            }
            
            if (hzlBlueData.blinkeye != self->lastEyeblinkValue) {
                int eyeblinkValue = hzlBlueData.blinkeye;
                weakSelf.eyeblinkLabel.stringValue = [NSString stringWithFormat:@"Eyeblink: %d", eyeblinkValue];
                NSArray *eyeblinkData = @[@(eyeblinkValue)];
                [self sendOSCMessageWithAddress:@"/eyeblink" andArguments:eyeblinkData onPort:11123];
                self->lastEyeblinkValue = eyeblinkValue;
            }
        }
        
    };
    [[Blue4Manager shareInstance] connectBlue4];
    
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
        [typeTag appendString:[argument isKindOfClass:[NSNumber class]] ? @"f" : @"s"];
    }
    NSData *typeTagData = [typeTag dataUsingEncoding:NSUTF8StringEncoding];
    [data appendData:typeTagData];
    paddingLength = 4 - (data.length % 4);
    if (paddingLength != 4) {
        [data appendBytes:"\0\0\0\0" length:paddingLength];
    }
    
    // 添加参数数据，并确保每个数据按4字节对齐
    for (NSNumber *argument in arguments) {
        float value = [argument floatValue];
        uint32_t networkValue;
        memcpy(&networkValue, &value, sizeof(value)); // 将浮点值复制为二进制
        networkValue = htonl(networkValue); // 转换为网络字节顺序
        [data appendBytes:&networkValue length:sizeof(networkValue)];
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


#pragma 断开蓝牙
- (void)viewWillDisappear
{
    if(isaccetable4)
    {
        [[Blue4Manager shareInstance] disConnectBlue4];
    }
    
}

@end
