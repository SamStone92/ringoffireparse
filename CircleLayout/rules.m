//
//  rules.m
//  CircleLayout
//
//  Created by Sam Stone on 12/11/2014.
//  Copyright (c) 2014 Olivier Gutknecht. All rights reserved.
//

#import "rules.h"

@implementation rules

@synthesize ruleTwo, ruleThree, ruleFour, ruleFive, ruleSix, ruleSeven, ruleEight, ruleNine, ruleTen, ruleJack, ruleQueen, ruleKing, ruleAce;

- (id) initWithRuleTwo: (NSString *) rTwo andRuleThree: (NSString *) rThree andRuleFour: (NSString *) rFour andRuleFive: (NSString *) rFive andRuleSix: (NSString *) rSix andRuleSeven: (NSString *) rSeven andRuleEight: (NSString *) rEight andRuleNine: (NSString *) rNine andRuleTen: (NSString *) rTen andRuleJack: (NSString *) rJack andRuleQueen: (NSString *) rQueen andRuleKing: (NSString *) rKing andRuleAce: (NSString *) rAce;

{
    
    self = [super init];
    if (self)
    {
        ruleTwo = rTwo;
        ruleThree = rThree;
        ruleFour = rFour;
        ruleFive = rFive;
        ruleSix  = rSix;
        ruleSeven = rSeven;
        ruleEight = rEight;
        ruleNine = rNine;
        ruleTen = rTen;
        ruleJack  = rSix;
        ruleQueen = rQueen;
        ruleKing = rKing;
        ruleAce  = rAce;
        
        
        
    }
    return self;
}


@end
