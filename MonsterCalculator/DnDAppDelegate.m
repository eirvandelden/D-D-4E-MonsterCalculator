//
//  DnDAppDelegate.m
//  MonsterCalculator
//
//  Created by Etienne van Delden on 09-02-2013.
//  Copyright (c) 2013 Etienne van Delden. All rights reserved.
//

#import "DnDAppDelegate.h"

@implementation DnDAppDelegate

@synthesize monsterLevel;
@synthesize monsterType;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your
    npc = [[DnDNPC alloc] init];
}

- (IBAction)Calculate:(id)sender {
    [self UpdateNPC];
}

- (IBAction)UpdateAttack:(id)sender {
    [self UpdateNPC];
}

-(void)UpdateNPC{
    //Set Input
    npc.level = [monsterLevel intValue];
    npc.type  = [monsterType titleOfSelectedItem];
    npc.secondaryRole = [_monsterSecondaryRole titleOfSelectedItem];

    npc.attackRange = [_AttackRange titleOfSelectedItem];
    npc.attackVsDefense = [_AttackVsDefense titleOfSelectedItem];
    npc.damageScale = [_damageScale titleOfSelectedItem];

    //Update Calculated Statistics
    [npc Update];
    [self UpdateView];
}

-(void)UpdateView{
    [_viewInitiative setStringValue:[NSString stringWithFormat:@"%i", npc.initiative]];
    [_viewHP setStringValue:[NSString stringWithFormat:@"%i", npc.HP]];
    [_viewAC setStringValue:[NSString stringWithFormat:@"%i", npc.AC]];
    [_viewFortitude setStringValue:[NSString stringWithFormat:@"%i", npc.Fortitude]];
    [_viewReflex setStringValue:[NSString stringWithFormat:@"%i", npc.Reflex]];
    [_viewWill setStringValue:[NSString stringWithFormat:@"%i", npc.Will]];

    //Attacks
    [_viewAttackBonus setStringValue:[NSString stringWithFormat:@"%i", npc.attackBonus]];
    NSLog(@"Attack Bonus: %i", npc.attackBonus);
    [_viewDamage setStringValue:[NSString stringWithFormat:@"%i", npc.damageBonus]];
}

@end
