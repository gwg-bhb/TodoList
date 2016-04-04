//
//  SettingViewController.m
//  Todo
//
//  Created by hello on 16/4/4.
//  Copyright © 2016年 hello. All rights reserved.
//

#import "SettingViewController.h"

static NSString *emailKey = @"emailKey";

@interface SettingViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *emailText = [userDefault objectForKey:emailKey];
    
    self.emailTextField.text = emailText;
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
- (IBAction)saveTapped:(id)sender {
    
    NSString *emailText = self.emailTextField.text;
    
    if (emailText.length > 0) {
        NSUserDefaults *userdefaule = [NSUserDefaults standardUserDefaults];
        [userdefaule setObject:emailText forKey:emailKey];
    }
}

@end
