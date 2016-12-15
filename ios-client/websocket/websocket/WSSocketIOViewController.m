//
//  WSSocketIOViewController.m
//  websocket
//
//  Created by hong7 on 2016/12/12.
//  Copyright © 2016年 hong7. All rights reserved.
//

#import "WSSocketIOViewController.h"

#import "WSMessageCellView.h"

@import SocketIO;


@interface WSSocketIOViewController ()

@property (nonatomic,strong) SocketIOClient* socket;

@property (nonatomic,strong) NSMutableArray * messages;

@end

@implementation WSSocketIOViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    DDLogInfo(@"%@",@"asdfsd");
    
    [self.tableView registerClass:[WSMessageCellView class] forCellReuseIdentifier:WSMessageCellViewReuseIdentifider];
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(send:)]];
    
    _messages = [NSMutableArray new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([self.socket status] == SocketIOClientStatusDisconnected ||
        [self.socket status] == SocketIOClientStatusNotConnected) {
        [self.socket connect];
    }
}


-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.socket disconnect];
}


-(void)send:(id)sender {
    
    [_socket emit:@"hi" with:@[@{@"text":@"hi me"}]];
}
-(SocketIOClient *)socket {
    if (!_socket) {
        NSURL* url = [[NSURL alloc] initWithString:@"http://localhost:3301"];
        _socket = [[SocketIOClient alloc] initWithSocketURL:url config:@{@"log": @YES, @"forcePolling": @YES}];
        
        
        [_socket on:@"hi" callback:^(NSArray * _Nonnull array, SocketAckEmitter * _Nonnull ask ) {
            
            //UIAlertController * alertController = [[UIAlertController alloc] init];
            
            //[self showViewController:alertController sender:self];
            [_messages addObject:[array objectAtIndex:0]];
            [self.tableView reloadData];
            DDLogInfo(@"hi ==== %@",array);
        }];
        
        [_socket on:@"ping" callback:^(NSArray * _Nonnull items, SocketAckEmitter * _Nonnull ask) {
            [_socket emit:@"message" with:@[@"AD发生的发水电费"]];
        }];
        
        [_socket on:@"connect" callback:^(NSArray * _Nonnull array, SocketAckEmitter * _Nonnull ask) {
            
            DDLogInfo(@"connected,%@,%@",array,ask);
            
            [_socket emit:@"name" with:@[@{@"name":@"ios"}]];
        }];

        [_socket onAny:^(SocketAnyEvent * _Nonnull event) {
            
            DDLogInfo(@"on ==== %@",event);
        }];
        
        
    }
    return _socket;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messages.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:WSMessageCellViewReuseIdentifider forIndexPath:indexPath];
    
    
    NSDictionary * dict = [self.messages objectAtIndex:indexPath.row];
    cell.textLabel.text = dict[@"text"];
    
    return cell;
}

@end
