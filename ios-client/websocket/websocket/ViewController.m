//
//  ViewController.m
//  websocket
//
//  Created by hong7 on 2016/12/12.
//  Copyright © 2016年 hong7. All rights reserved.
//

#import "ViewController.h"

#import <SocketRocket/SRWebSocket.h>




const DDLogLevel ddLogLevel = DDLogLevelOff;


static NSString * urlstring = @"ws://127.0.0.1:3301";


@interface ViewController ()<SRWebSocketDelegate>

@property (nonatomic,strong) SRWebSocket * socket;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([self.socket readyState] != SR_OPEN) {
        [self.socket open];
    }
}


-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.socket close];
}


#pragma mark - SRWebSocket Delegate 

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
    
    
    DDLogInfo(@"socket recieve:%@",message);
}

//@optional
//
- (void)webSocketDidOpen:(SRWebSocket *)webSocket {
    
    DDLogInfo(@"webSocketDidOpen");
    
    [webSocket send:@"message hello"];
}
- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {
    DDLogInfo(@"socket Error:%@",error);
}
- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean {
    
    DDLogInfo(@"didCloseWithCode");
}
- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload {
    
}

// Return YES to convert messages sent as Text to an NSString. Return NO to skip NSData -> NSString conversion for Text messages. Defaults to YES.
- (BOOL)webSocketShouldConvertTextFrameToString:(SRWebSocket *)webSocket {
    return YES;
}


#pragma mark - Properties

-(SRWebSocket *)socket {
    if (!_socket) {
        NSURL * url = [NSURL URLWithString:urlstring];
        _socket = [[SRWebSocket alloc]initWithURL:url protocols:@[@"ws"]];
        _socket.delegate = self;
    }
    return _socket;
}


@end
