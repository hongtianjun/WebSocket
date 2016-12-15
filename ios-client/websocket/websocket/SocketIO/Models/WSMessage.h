//
//  WSMessage.h
//  websocket
//
//  Created by hong7 on 2016/12/12.
//  Copyright © 2016年 hong7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSMessage : NSObject


@property (nullable,nonatomic,strong) NSString * content;

@property (nullable,nonatomic,strong) NSString * sender;

@property (nonatomic,assign) BOOL isSender;


@end
