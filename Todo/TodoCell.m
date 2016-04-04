//
//  TodoCell.m
//  Todo
//
//  Created by hello on 16/4/3.
//  Copyright © 2016年 hello. All rights reserved.
//

#import "TodoCell.h"
#import "ViewController.h"

@implementation TodoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)finishClicked:(id)sender {
    
    self.todoItem.isFinish = !self.todoItem.isFinish;
    if (self.todoItem.isFinish) {
           [self.finishButton setTitle:@"已完成" forState:UIControlStateNormal];
    }else
    [self.finishButton setTitle:@"完成" forState:UIControlStateNormal];
}

@end
