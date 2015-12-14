//
//  DnDNPC.m
//  MonsterCalculator
//
//  Created by Etienne van Delden on 09-02-2013.
//  Copyright (c) 2013 Etienne van Delden. All rights reserved.
//

#import "DnDNPC.h"

@implementation DnDNPC

@synthesize level;
@synthesize type;
@synthesize secondaryRole;

-(id)init{
    self = [super init];

    if (self) {
        Constitution = 14;
    }
    return self;
}


// Monster stats
@synthesize initiative;
-(void)setInitiative{
    initiative = (level / 2) + 2; //Half level + Average dex modifier
            if ( [type isEqualToString:@"Skirmisher"] ){ initiative = initiative + 2; }
    else    if ( [type isEqualToString:@"Soldier"] )   { initiative = initiative + 2; }
    else    if ( [type isEqualToString:@"Lurker"] )    { initiative = initiative + 4; }
}
@synthesize HP;
-(void)setHP{
    if ([type isEqualToString:@"Brute"]) {
        Constitution = 16;
    } else {
        Constitution = 14;
    }

    if ([secondaryRole isEqualToString:@"Normal"]) {
        [self setHPNormal];
    } else if ([secondaryRole isEqualToString:@"Solo"]) {
        [self setHPSolo];
    } else if ([secondaryRole isEqualToString:@"Elite"]){
        [self setHPElite];
    }
}
-(void)setHPNormal{
    HP = 8 + Constitution + (level * 8);
    if ([type isEqualToString:@"Brute"]) {
        HP = HP + 2 + (level * 2);
    }
    else if ( [type isEqualToString:@"Lurker"] || [type isEqualToString:@"Artillery"] ){
        HP = HP - 2 - (level * 2);
    }
}
-(void)setHPSolo{
    HP = 8 * (level + 1) + Constitution;
    if (level <= 10) {
        HP = HP * 4;
    } else {
        HP = HP*5;
    }
}
-(void)setHPElite{
    [self setHPNormal];
    HP = 2*HP + 2*Constitution;
}

// Defenses
@synthesize AC;
-(void)setAC{
    AC = level + 14;
    if ([type isEqualToString:@"Brute"] || [type isEqualToString:@"Artillery"]) {
        AC = AC - 2;
    }
    if ([type isEqualToString:@"Soldier"]) {
        AC = AC + 2;
    }

    if ([secondaryRole isEqualToString:@"Solo"] || [secondaryRole isEqualToString:@"Elite"] ) {
        AC = AC + 2;
        // Officially, 2 other defenses should also increase
    }
}
@synthesize Fortitude;
-(void)setFortitude{
    Fortitude = level + 12;
/*    if ([type isEqualToString:@"Brute"] || [type isEqualToString:@"Artillery"]) {
        AC = AC - 2;
    }
    if ([type isEqualToString:@"Soldier"]) {
        AC = AC + 2;
    }*/
}
@synthesize Reflex;
-(void)setReflex{
    Reflex = level + 12;
    /*    if ([type isEqualToString:@"Brute"] || [type isEqualToString:@"Artillery"]) {
     AC = AC - 2;
     }
     if ([type isEqualToString:@"Soldier"]) {
     AC = AC + 2;
     }*/
}
@synthesize Will;
-(void)setWill{
    Will = level + 12;
    /*    if ([type isEqualToString:@"Brute"] || [type isEqualToString:@"Artillery"]) {
     AC = AC - 2;
     }
     if ([type isEqualToString:@"Soldier"]) {
     AC = AC + 2;
     }*/
}

// Offensive
@synthesize attackVsDefense;
@synthesize damageScale;
@synthesize attackRange;

@synthesize attackBonus;
-(void)setAttackBonus{
    if ([attackVsDefense isEqualToString:@"AC"]) {
        attackBonus = [self calculateACAttackBonus];
    }
    else {
        attackBonus = [self calculateODAttackBonus];
    }
}
-(int)calculateACAttackBonus{
    int result;
    result = level + 4;

    if ([attackRange isEqualToString:@"Ranged"] && [type isEqualToString:@"Artillery"]) {
        result = result + 2;
    }

    return result;
}
-(int)calculateODAttackBonus{
    return level + 2;
}

@synthesize damageBonus;
-(void)setDamageBonus{
    damageBonus = 2 + level; //Based on Level+8 for average damage.

    if ([secondaryRole isEqualToString:@"Minion"]) {
        // Half level + 4
        damageBonus = (integer_t)lroundf( level * 0.5) + 4;
    }
    if ([type isEqualToString:@"Brute"]) {
        damageBonus = damageBonus + (0.25 * damageBonus);
    }
    if ([damageScale isEqualToString:@"Encounter"]) {
        damageBonus = damageBonus + (0.25 * damageBonus);
    }
}

// Update all values
-(void)Update{
    [self setInitiative];
    [self setHP];
    [self setAC];
    [self setFortitude];
    [self setReflex];
    [self setWill];

    [self setAttackBonus];
    [self setDamageBonus];
}

@end
