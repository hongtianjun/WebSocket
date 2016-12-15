//
//  WSLogger.m
//  websocket
//
//  Created by hong7 on 2016/12/12.
//  Copyright © 2016年 hong7. All rights reserved.
//

#import "WSLogger.h"

#import <CocoaLumberjack/DDLogMacros.h>


@implementation WSLogger


+(WSLogger *)sharedLogger {
    static WSLogger * logger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        logger = [WSLogger new];
    });
    return logger;
}


-(instancetype)init {
    if (self = [super init]) {
        
        [DDLog addLogger:[DDTTYLogger sharedInstance]];
        [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
        
    }
    return self;
}

@end
