//
//  TodoCell.h
//  Todo
//
//  Created by hello on 16/4/3.
//  Copyright © 2016年 hello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoItem.h"

@interface TodoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *todoLabel;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;
@property (weak, nonatomic) TodoItem *todoItem;
@end
