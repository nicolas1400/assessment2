//
//  ViewController.m
//  assessment2
//
//  Created by Nicolas Semenas on 31/07/14.
//  Copyright (c) 2014 Nicolas Semenas. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.myTableView.allowsMultipleSelectionDuringEditing = NO;
    
    //PRE-FILL WITH SOME CITIES
    
    City *city1 = [[City alloc]init];
    city1.name = @"Los Angeles";
    city1.state = @"California";
    //city1.image = [UIImage imageNamed:@"1"];
    
    
    City *city2 = [[City alloc]init];
    city2.name = @"Chicago";
    city2.state = @"Illinois";
    //city2.image = [UIImage imageNamed:@"2"];
    
    
    City *city3 = [[City alloc]init];
    city3.name = @"San Antonio";
    city3.state = @"Texas";
    //city3.image = [UIImage imageNamed:@"3"];
    
    City *city4 = [[City alloc]init];
    city4.name = @"San Diego";
    city4.state = @"California";
    //city4.image = [UIImage imageNamed:@"4"];
    
    self.cities = [NSMutableArray arrayWithObjects: city1, city2, city3, city4, nil];

}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"onShowDetail"])
    {
        DetailViewController *detailViewController =
        [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.myTableView
                                    indexPathForSelectedRow];
        
        long row = [myIndexPath row];
        
        detailViewController.thisCity = [self.cities objectAtIndex:row];
    }
}

-(void)viewDidAppear:(BOOL)animated{
    
    [self.myTableView reloadData];
}


#pragma mark - TableView Delegates

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.cities.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    City * city = [self.cities objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = city.name;
    cell.detailTextLabel.text = city.state;
    //cell.imageView.image = creature.image;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.cities removeObjectAtIndex:indexPath.row];
        [tableView reloadData];

    }
}

@end
