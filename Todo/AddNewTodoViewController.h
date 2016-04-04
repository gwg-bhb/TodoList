//
//  AddNewTodoViewController.h
//  Todo
//
//  Created by hello on 16/4/4.
//  Copyright © 2016年 hello. All rights reserved.
//

#import "ViewController.h"

@protocol AddNewTodoDelegate <NSObject>

-(void) addNewTodoTask:(NSString *)todoText;

@end

@interface AddNewTodoViewController : UIViewController

@property (nonatomic, weak) id<AddNewTodoDelegate> delegate;

@end
