//
//  TodoItem.h
//  Todo
//
//  Created by hello on 16/4/3.
//  Copyright © 2016年 hello. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoItem : NSObject

@property (nonatomic, strong) NSString *todoText;
@property (assign, nonatomic) Boolean isFinish;

@end
