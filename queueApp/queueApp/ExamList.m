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
extern int fudeu[5];
extern NSString *CPF;


@implementation ExamList

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Declarando Array da TableView
    NSMutableArray *localList = [[NSMutableArray alloc] initWithObjects:nil];
    self.horario = localList;
    self.list = localList;
    [self connectDB];
    
    [self trackUsers];
    
    self.ListaDeExames.backgroundColor = [UIColor clearColor];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(leUpload) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view.


}

-(void)leUpload
{
    [self.ListaDeExames reloadData];
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
    CKQuery *query = [[CKQuery alloc] initWithRecordType:@"Cadastros" predicate:[NSPredicate predicateWithValue:YES]];
    
    [_publicDB performQuery:query inZoneWithID:nil completionHandler:^(NSArray *results, NSError *error) {
        if(error){
            NSLog(@"%@", error.localizedDescription);
        }
        int i = 0;
        NSString *CPF_Atual;
        NSString *Clinica;
        NSString *Exames;
        NSString *horas;
        for(CKRecord *record in results){
            
            CPF_Atual = [record objectForKey:@"CPF"];
            if([CPF_Atual isEqualToString:CPF])
            {
                
                horas = [record objectForKey:@"Horario"];
                Clinica = [record objectForKey:@"Clinica"];
                Exames = [record objectForKey:@"Exame"];
                fudeu[i] = [horas intValue];
                i++;
                [self.list addObject:Exames];
                //[self.horario addObject:horas];

            }
         
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
    cell.backgroundColor = [UIColor clearColor];
    
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
    horario = fudeu[indexPath.row];
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
