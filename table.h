//
//  table.h
//  Ring of Fire
//
//  Created by Sam Stone on 13/12/2014.
//  Copyright (c) 2014 Olivier Gutknecht. All rights reserved.
//

#import <ParseUI/ParseUI.h>
#import "EDStarRating.h"
@interface table : PFQueryTableViewController <EDStarRatingProtocol, UIActionSheetDelegate>
@property (strong,nonatomic) NSArray *colors;
@end
