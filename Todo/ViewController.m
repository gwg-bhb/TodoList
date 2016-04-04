//
//  ViewController.m
//  Todo
//
//  Created by hello on 16/3/25.
//  Copyright © 2016年 hello. All rights reserved.
//

#import "ViewController.h"
#import "TodoCell.h"
#import "TodoItem.h"
#import "AddNewTodoViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, AddNewTodoDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *todoList;

@property (nonatomic, assign) int count;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.todoList = [NSMutableArray array];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.count = 0;
    
    [self loadFile];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"addTodo"])
    {
        AddNewTodoViewController *vc =segue.destinationViewController;
        vc.delegate = self;
    }
}


#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.todoList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    TodoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"todoCell" forIndexPath:indexPath];
    TodoItem *item = self.todoList[indexPath.row];
    
    cell.todoItem = item;
    cell.todoLabel.text = item.todoText;
    
    if (item.isFinish) {
        [cell.finishButton setTitle:@"已完成" forState:UIControlStateNormal];
    }
    else
    {
        [cell.finishButton setTitle:@"完成" forState:UIControlStateNormal];
    }
    return cell;
}

#pragma mark - AddNewTodoDelegate

- (void)addNewTodoTask:(NSString *)todoText
{
    
    TodoItem *item = [[TodoItem alloc] init];
    item.todoText = todoText;
    item.isFinish = NO;
    
    [self.todoList addObject:item];
    [self saveToFile];              
    [self.tableView reloadData];  //重载数据,调用下面两个方法
}

#pragma mark - Save

static NSString *todoTextKey = @"todo_text";
static NSString *isFinisdhedKey= @"is_finished";

- (NSData *)taskListToJsonData{
    NSMutableArray *jsonArray = [NSMutableArray array];
    
    for (int i = 0; i < self.todoList.count; i++) {
        TodoItem *item = self.todoList[i];
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        
        [dict setObject:item.todoText forKey:todoTextKey];
        
        NSNumber *isFinished = [NSNumber numberWithBool:item.isFinish];
        [dict setObject:isFinished forKey:isFinisdhedKey];
        
        [jsonArray addObject:dict];
    }
    NSData *data = [NSJSONSerialization dataWithJSONObject:jsonArray options:NSJSONWritingPrettyPrinted error:nil];
    return data;
}

- (void)saveToFile{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:@"todo.json"];
    NSData *jsonData = [self taskListToJsonData];
    [jsonData writeToFile:filePath atomically:YES];
}

#pragma mark - loadFile

- (void)loadFile{
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:@"todo.json"];
    
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    if (jsonData == nil) {
        return;
    }
    
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
    [self.todoList removeAllObjects];
    for (int i = 0; i < jsonArray.count; i++) {
        NSDictionary *dic = jsonArray[i];
        TodoItem *item = [[TodoItem alloc] init];
        
        NSString *todoText = dic[todoTextKey];
        NSNumber *isFinished = dic[isFinisdhedKey];
        
        item.todoText = todoText;
        item.isFinish = isFinished.boolValue;
        [self.todoList addObject:item];
    }
    [self.tableView reloadData];
}
@end
