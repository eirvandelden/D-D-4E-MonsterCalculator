//
//  DnDNPC.h
//  MonsterCalculator
//
//  Created by Etienne van Delden on 09-02-2013.
//  Copyright (c) 2013 Etienne van Delden. All rights reserved.
//

#import <Foundation/Foundation.h>

//Private interface
@interface DnDNPC : NSObject {
    int level;
    NSString *type;
    NSString *secondaryRole;
    int Strength;
    int Constitution;
    int Dexterity;
    int Intelligence;
    int Wisdom;
    int Charisma;
    int XP;
}

//Public Properties
@property (readwrite) int level;
@property (readwrite) NSString *type;
@property NSString *secondaryRole;
@property (readwrite) int initiative;
@property (readwrite) int HP;
@property (readwrite) int AC;
@property int Fortitude;
@property int Reflex;
@property int Will;

@property int attackBonus;
@property int damageBonus;
@property NSString *attackVsDefense;
@property NSString *damageScale;
@property NSString *attackRange;


// Class methods
-(void)Update;

@end