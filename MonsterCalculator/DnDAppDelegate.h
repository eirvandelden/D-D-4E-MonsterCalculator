//
//  DnDAppDelegate.h
//  MonsterCalculator
//
//  Created by Etienne van Delden on 09-02-2013.
//  Copyright (c) 2013 Etienne van Delden. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DnDNPC.h"

@interface DnDAppDelegate : NSObject <NSApplicationDelegate>{
    DnDNPC *npc;
}

// Properties
@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *monsterLevel;
@property (weak) IBOutlet NSPopUpButton *monsterType;
@property (weak) IBOutlet NSPopUpButton *monsterSecondaryRole;

@property (weak) IBOutlet NSTextField *viewInitiative;
@property (weak) IBOutlet NSTextField *viewHP;
@property (weak) IBOutlet NSTextField *viewAC;
@property (weak) IBOutlet NSTextField *viewFortitude;
@property (weak) IBOutlet NSTextField *viewReflex;
@property (weak) IBOutlet NSTextField *viewWill;
@property (weak) IBOutlet NSTextField *viewAttackBonus;
@property (weak) IBOutlet NSTextField *viewDamage;

@property (weak) IBOutlet NSPopUpButton *damageScale;
@property (weak) IBOutlet NSPopUpButton *AttackVsDefense;
@property (weak) IBOutlet NSPopUpButton *AttackRange;


// Actions
- (IBAction)Calculate:(id)sender;
- (IBAction)UpdateAttack:(id)sender;


-(void)UpdateNPC;
-(void)UpdateView;

@end