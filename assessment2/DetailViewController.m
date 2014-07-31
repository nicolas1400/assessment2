//
//  DetailViewController.m
//  assessment2
//
//  Created by Nicolas Semenas on 31/07/14.
//  Copyright (c) 2014 Nicolas Semenas. All rights reserved.
//

#import "DetailViewController.h"


@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *detailName;
@property (weak, nonatomic) IBOutlet UILabel *detailState;

@property (weak, nonatomic) IBOutlet UITextField *editName;
@property (weak, nonatomic) IBOutlet UITextField *editState;

@property (nonatomic, assign) BOOL editMode;

@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation DetailViewController



- (IBAction)onEdit:(UIButton *)sender {
    
    [self.editName resignFirstResponder];
    [self.editState resignFirstResponder];
    
    
    if (self.editMode) {
        self.editMode = NO;
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        self.editName.hidden = YES;
        self.editState.hidden = YES;
        
        // SAVE DATA IN THISCITY OBJECT
        self.thisCity.name = self.editName.text;
        self.thisCity.state = self.editState.text;
        
        //UPDATE LABELS
        self.detailName.text = self.thisCity.name;
        self.detailState.text = self.thisCity.state;
        
    }
    else {
        self.editMode = YES;
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        self.editName.hidden = NO;
        self.editState.hidden = NO;
    }
    
}




- (void)viewDidLoad
{
    self.editMode=NO;
    
    [super viewDidLoad];
    self.detailName.text = self.thisCity.name;
    self.detailState.text = self.thisCity.state;
    
    self.editName.hidden = YES;
    self.editState.hidden = YES;
    
    self.editName.text = self.thisCity.name;
    self.editState.text = self.thisCity.state;
    
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

@end

