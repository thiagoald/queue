//
//  ExamList.m
//  queueApp
//
//  Created by Luiz Henrique on 30/05/15.
//  Copyright (c) 2015 codecup. All rights reserved.
//

#import "ExamList.h"

@interface ExamList ()

@property (weak, nonatomic) IBOutlet UITableView *ListaDeExames;


@end
UIDocument *doc;
extern NSString *email;
extern int horario;


@implementation ExamList

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Declarando Array da TableView
    NSMutableArray *localList = [[NSMutableArray alloc] initWithObjects:@
                                 "Casa", nil];
    self.list = localList;
    [self connectDB];
    
    [self trackUsers];
    
    // Do any additional setup after loading the view.


}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)loadFromContents:(id)contents ofType:(NSString *)typeName
                   error:(NSError **)outError
{
    return YES;    
}

-(void)connectDB{
    _container = [CKContainer defaultContainer];
    _publicDB = _container.publicCloudDatabase;
    _privateDB = _container.privateCloudDatabase;
}

-(void)trackUsers{
    CKQuery *query = [[CKQuery alloc] initWithRecordType:email predicate:[NSPredicate predicateWithValue:YES]];
    
    [_publicDB performQuery:query inZoneWithID:nil completionHandler:^(NSArray *results, NSError *error) {
        if(error){
            NSLog(@"%@", error.localizedDescription);
        }
        
        NSData *data;
        NSString *email;
        
        for(CKRecord *record in results){
            
            // inicializa string NSSt = [[MKPointAnnotation alloc] init];
            data = [record objectForKey:@"Horario"];
            email = [record objectForKey:@"Email"];
            [self.list addObject:email];
        }
        [self.ListaDeExames reloadData];	
        
    }];
    
}




// Adicionando itens no vetor
// Custom set accessor to ensure the new list is mutable


-(UITableViewCell*)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    cell.textLabel.text = self.list[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.list.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath   *)indexPath
{
    // muda de view e armazena o exame que foi selecionado.
	UIViewController *view1 = [self.storyboard instantiateViewControllerWithIdentifier:@"Timer"];
	horario = 32;
	[self.navigationController pushViewController:view1 animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
