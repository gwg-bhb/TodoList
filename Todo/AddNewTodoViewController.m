//
//  AddNewTodoViewController.m
//  Todo
//
//  Created by hello on 16/4/4.
//  Copyright © 2016年 hello. All rights reserved.
//

#import "AddNewTodoViewController.h"

@interface AddNewTodoViewController ()
@property (weak, nonatomic) IBOutlet UITextView *todoTextView;

@end

@implementation AddNewTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.todoTextView becomeFirstResponder];  //自动弹出软键盘
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)okTapped:(id)sender {
    
    NSString *todoText = self.todoTextView.text;
    if (todoText.length > 0) {
        [self.delegate addNewTodoTask:todoText];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelTapped:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];  
}

@end
