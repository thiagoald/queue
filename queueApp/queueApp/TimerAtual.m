//
//  TimerAtual.m
//  queueApp
//
//  Created by Luiz Henrique on 30/05/15.
//  Copyright (c) 2015 codecup. All rights reserved.
//

#import "TimerAtual.h"

@interface TimerAtual ()


@property (weak, nonatomic) IBOutlet UILabel *opc;

@property (weak, nonatomic) IBOutlet UISegmentedControl *OffSet;
@property (weak, nonatomic) IBOutlet UIButton *Cancelar;
@property (weak, nonatomic) IBOutlet UILabel *tempo;
@property (weak, nonatomic) IBOutlet UIButton *adiantar;
@end

@implementation TimerAtual
extern int horario;

NSTimer *tempo;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.opc.hidden = YES;
    self.tempo.hidden = YES;
    self.OffSet.hidden = YES;
    self.Cancelar.layer.cornerRadius = 10;
    self.adiantar.layer.cornerRadius = 10;
    
		self.label.text = [NSString stringWithFormat:@"%d",horario];
		tempo = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(attimer) userInfo:nil repeats:YES];
    //self.tempo.font = [UIFont fontWithName:@"Montserrat" size:200];
    // Do any additional setup after loading the view.
}

-(void)attimer
{
    if(horario > 0)
        horario--;
	self.label.text = [NSString stringWithFormat:@"%d",horario];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Deslogar:(id)sender {
	[tempo invalidate];
    [[self navigationController]popViewControllerAnimated:YES];
}

-(void)viewDidDisappear:(BOOL)animated {
    [tempo invalidate];
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
