//
//  WSLogger.h
//  websocket
//
//  Created by hong7 on 2016/12/12.
//  Copyright © 2016年 hong7. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DD_LEGACY_MACROS 1


#ifdef DEBUG
#define LOG_LEVEL_DEF DDLogLevelVerbose
#define LOG_ASYNC_ENABLED NO
#else
#define LOG_LEVEL_DEF DDLogLevelOff
#define LOG_ASYNC_ENABLED YES
#endif

#import <CocoaLumberjack/CocoaLumberjack.h>



@interface WSLogger : NSObject

+(WSLogger *)sharedLogger;

@end
