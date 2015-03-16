

#import "ViewController.h"
#import "Cell.h"
#import "rules.h"
#import <iAd/iAd.h>
#import "FlatButton.h"
#import "KLCPopup.h"
#import <Parse/Parse.h>
#import "TestViewController.h"

@interface ViewController()

@end
int * i;

NSMutableArray * cards;
UITextField* two;
UITextField* three;
UITextField* four;
UITextField* five;
UITextField* six;
UITextField* seven;
UITextField* eight;
UITextField* nine;
UITextField* ten;
UITextField* jack;
UITextField* queen;
UITextField* king;
UITextField* ace;

int kingNo;
UIButton* replay;
NSString* ruleTwo;
NSString* ruleThree;
NSString* ruleFour;
NSString* ruleFive;
NSString* ruleSix;
NSString* ruleSeven;
NSString* ruleEight;
NSString* ruleNine;
NSString* ruleTen;
NSString* ruleJack;
NSString* ruleQueen;
NSString* ruleKing;
NSString* ruleAce;
NSDictionary *parsedData;
NSUserDefaults *userRules;
@implementation ViewController

-(void)viewDidLoad
{       self.cellCount = 0;
   
    kingNo = 0;
    cards = [NSMutableArray arrayWithObjects:@"2_of_clubs.png",
             @"3_of_clubs.png",
             @"4_of_clubs.png",
             @"5_of_clubs.png",
             @"6_of_clubs.png",
             @"7_of_clubs.png",
             @"8_of_clubs.png",
             @"9_of_clubs.png",
             @"10_of_clubs.png",
             @"jack_of_clubs.png",
             @"queen_of_clubs.png",
             @"king_of_clubs.png",
             @"ace_of_clubs.png",
             @"2_of_diamonds.png",
             @"3_of_diamonds.png",
             @"4_of_diamonds.png",
             @"5_of_diamonds.png",
             @"6_of_diamonds.png",
             @"7_of_diamonds.png",
             @"8_of_diamonds.png",
             @"9_of_diamonds.png",
             @"10_of_diamonds.png",
             @"jack_of_diamonds.png",
             @"queen_of_diamonds.png",
             @"king_of_diamonds.png",
             @"ace_of_diamonds.png",
             @"2_of_hearts.png",
             @"3_of_hearts.png",
             @"4_of_hearts.png",
             @"5_of_hearts.png",
             @"6_of_hearts.png",
             @"7_of_hearts.png",
             @"8_of_hearts.png",
             @"9_of_hearts.png",
             @"10_of_hearts.png",
             @"jack_of_hearts.png",
             @"queen_of_hearts.png",
             @"king_of_hearts.png",
             @"ace_of_hearts.png",
             @"2_of_spades.png",
             @"3_of_spades.png",
             @"4_of_spades.png",
             @"5_of_spades.png",
             @"6_of_spades.png",
             @"7_of_spades.png",
             @"8_of_spades.png",
             @"9_of_spades.png",
             @"10_of_spades.png",
             @"jack_of_spades.png",
             @"queen_of_spades.png",
             @"king_of_spades.png",
             @"ace_of_spades.png",nil];
    NSLog(@"count: %lu", (unsigned long)cards.count);
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.collectionView addGestureRecognizer:tapRecognizer];
    [self.collectionView registerClass:[Cell class] forCellWithReuseIdentifier:@"MY_CELL"];
    [self.collectionView reloadData];
    CGPoint center;
    CGSize size = self.collectionView.frame.size;
    center = CGPointMake(size.width / 2.0, size.height / 2.0);
    
    _grey = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height+100)];
    _grey.backgroundColor = [UIColor grayColor];
    _grey.alpha = 0.7f;
    [self.view addSubview:_grey];
    
   
            _play = [[FlatButton alloc] initWithFrame:CGRectMake(0, size.height - 150, size.width, 50)
                                  withBackgroundColor:[UIColor colorWithRed:0.521569
                                                                      green:0.768627
                                                                       blue:0.254902 alpha:1]];
            _editRules = [[FlatButton alloc] initWithFrame:CGRectMake(0, size.height - 100, size.width, 50)
                                       withBackgroundColor:[UIColor colorWithRed:118/255.0f green:207/255.0f blue:241/255.0f alpha:1.0f]];
    
            _share = [[FlatButton alloc] initWithFrame:CGRectMake(0, size.height - 50, size.width, 50)
                               withBackgroundColor:[UIColor colorWithRed:0.945 green:0.769 blue:0.059 alpha:1]];
    


 
    [_play setTitle:@"Play" forState:UIControlStateNormal];
    _play.titleLabel.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [_play addTarget:self action:@selector(flatButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_editRules setTitle:@"Edit Rules" forState:UIControlStateNormal];
    _editRules.titleLabel.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [_editRules addTarget:self action:@selector(editButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [_share setTitle:@"Share Rules" forState:UIControlStateNormal];
    _share.titleLabel.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [_share addTarget:self action:@selector(shareButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        //its iPhone. Find out which one?
        
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
             _logo = [[UIImageView alloc] initWithFrame:CGRectMake(center.x-162, center.y-245, 324, 350)];
        }
        else if(result.height == 568)
        {
           _logo = [[UIImageView alloc] initWithFrame:CGRectMake(center.x-175, center.y-275, 350, 400)];
        }
        else if(result.height == 667)
        {
        _logo = [[UIImageView alloc] initWithFrame:CGRectMake(center.x-190, center.y-225, 380, 450)];
        }
        else if(result.height == 736)
        {
            _logo = [[UIImageView alloc] initWithFrame:CGRectMake(center.x-190, center.y-225, 380, 450)];
        }
    }
    else
    {
        _logo = [[UIImageView alloc] initWithFrame:CGRectMake(center.x-275, center.y-300, 550, 600)];
    }
    

   
    _rules = [[UILabel alloc] initWithFrame:CGRectMake(0, center.y+70,self.collectionView.frame.size.width, 300)];
    _rules.numberOfLines=10;
   _rules.textAlignment = NSTextAlignmentCenter;
     
    _logo.image = [UIImage imageNamed:@"logo2.png"];
    [_rules setFont:[UIFont fontWithName:@"Avenir-Black" size:20.0f]];
    _rules.textColor = [UIColor whiteColor];
    [self.view addSubview:_logo];
    [self.view addSubview:_rules];
   [self.view addSubview:_play];
    [self.view addSubview:_editRules];
    [self.view addSubview:_share];
[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(addCells:) userInfo:nil repeats:YES];
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"pattern2.png"]];
    [self loadRules];
    
}
-(void)loadRules{
    
    NSData *theData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"rule" ofType:@"txt"]];
   parsedData = [NSJSONSerialization JSONObjectWithData:theData options:NSJSONReadingMutableContainers error:nil];
    
    
    userRules = [NSUserDefaults standardUserDefaults];

    
 

    
    if ( [[userRules objectForKey:@"set"] isEqual:@0] || ![userRules objectForKey:@"set"] ) {
        
       
        [userRules setObject:[parsedData objectForKey:@"rule-two"] forKey:@"two"];
        [userRules setObject:[parsedData objectForKey:@"rule-three"] forKey:@"three"];
        [userRules setObject:[parsedData objectForKey:@"rule-four"] forKey:@"four"];
        [userRules setObject:[parsedData objectForKey:@"rule-five"] forKey:@"five"];
        [userRules setObject:[parsedData objectForKey:@"rule-six"] forKey:@"six"];
        [userRules setObject:[parsedData objectForKey:@"rule-seven"] forKey:@"seven"];
        [userRules setObject:[parsedData objectForKey:@"rule-eight"] forKey:@"eight"];
        [userRules setObject:[parsedData objectForKey:@"rule-nine"] forKey:@"nine"];
        [userRules setObject:[parsedData objectForKey:@"rule-ten"] forKey:@"ten"];
        [userRules setObject:[parsedData objectForKey:@"rule-jack"] forKey:@"jack"];
        [userRules setObject:[parsedData objectForKey:@"rule-queen"] forKey:@"queen"];
        [userRules setObject:[parsedData objectForKey:@"rule-king"] forKey:@"king"];
        [userRules setObject:[parsedData objectForKey:@"rule-ace"] forKey:@"ace"];

           [userRules synchronize];
    }
        }

-(void)replayButtonPressed:(id)sender {
    CGPoint center;
    CGSize size = self.collectionView.frame.size;
    center = CGPointMake(size.width / 2.0, size.height / 2.0);
    kingNo = 0;
    cards = [NSMutableArray arrayWithObjects:@"2_of_clubs.png",
             @"3_of_clubs.png",
             @"4_of_clubs.png",
             @"5_of_clubs.png",
             @"6_of_clubs.png",
             @"7_of_clubs.png",
             @"8_of_clubs.png",
             @"9_of_clubs.png",
             @"10_of_clubs.png",
             @"jack_of_clubs.png",
             @"queen_of_clubs.png",
             @"king_of_clubs.png",
             @"ace_of_clubs.png",
             @"2_of_diamonds.png",
             @"3_of_diamonds.png",
             @"4_of_diamonds.png",
             @"5_of_diamonds.png",
             @"6_of_diamonds.png",
             @"7_of_diamonds.png",
             @"8_of_diamonds.png",
             @"9_of_diamonds.png",
             @"10_of_diamonds.png",
             @"jack_of_diamonds.png",
             @"queen_of_diamonds.png",
             @"king_of_diamonds.png",
             @"ace_of_diamonds.png",
             @"2_of_hearts.png",
             @"3_of_hearts.png",
             @"4_of_hearts.png",
             @"5_of_hearts.png",
             @"6_of_hearts.png",
             @"7_of_hearts.png",
             @"8_of_hearts.png",
             @"9_of_hearts.png",
             @"10_of_hearts.png",
             @"jack_of_hearts.png",
             @"queen_of_hearts.png",
             @"king_of_hearts.png",
             @"ace_of_hearts.png",
             @"2_of_spades.png",
             @"3_of_spades.png",
             @"4_of_spades.png",
             @"5_of_spades.png",
             @"6_of_spades.png",
             @"7_of_spades.png",
             @"8_of_spades.png",
             @"9_of_spades.png",
             @"10_of_spades.png",
             @"jack_of_spades.png",
             @"queen_of_spades.png",
             @"king_of_spades.png",
             @"ace_of_spades.png",nil];
    self.cellCount = 0;
    [self.collectionView reloadData];
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(addCells:) userInfo:nil repeats:YES];

        
            [replay removeFromSuperview];

  
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(void)editButtonPressed:(id)button{
    UIView* contentView = [[UIView alloc] init];
    
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.layer.cornerRadius = 6.0;
    contentView.frame = CGRectMake(0.0, 0.0, self.collectionView.frame.size.width-70, self.collectionView.frame.size.height - 70);
    CGPoint center;
    CGSize size = contentView.frame.size;
    center = CGPointMake(contentView.frame.size.width / 2.0, contentView.frame.size.height / 2.0);
    
  
    
    UIView* header = [[UIView alloc] init];
    header.layer.cornerRadius = 6.0;
    header.frame = CGRectMake(0.0, 0.0, contentView.frame.size.width, 50);
    header.backgroundColor =  [UIColor colorWithRed:118/255.0f green:207/255.0f blue:241/255.0f alpha:1.0f];
  
    
    UILabel* title = [[UILabel alloc] init];
    title.frame = CGRectMake(0.0, 0.0, contentView.frame.size.width, 50);
    [title setText:@"Edit Rules"];
    [title setFont:[UIFont fontWithName:@"Avenir-Black" size:20.0f]];
    [title setTextColor:[UIColor whiteColor]];
    title.textAlignment = NSTextAlignmentCenter;
    
    UIButton* done = [UIButton buttonWithType:UIButtonTypeCustom];
    done.frame = CGRectMake(contentView.frame.size.width-120 ,contentView.frame.size.height - 70, 100, 50);
    done.layer.cornerRadius = 6.0;
    done.titleLabel.font=[UIFont fontWithName:@"Avenir-Black" size:20.0f];
    done.backgroundColor = [UIColor colorWithRed:118/255.0f green:207/255.0f blue:241/255.0f alpha:1.0f];
    [done setTitleColor:[[done titleColorForState:UIControlStateNormal] colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
    [done setTitle:@"Save" forState:UIControlStateNormal];
    [done setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [done addTarget:self action:@selector(doneButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* reset = [UIButton buttonWithType:UIButtonTypeCustom];
    reset.frame = CGRectMake(20,contentView.frame.size.height - 70, 100, 50);
    reset.layer.cornerRadius = 6.0;
    reset.titleLabel.font=[UIFont fontWithName:@"Avenir-Black" size:20.0f];
    reset.backgroundColor = [UIColor colorWithRed:118/255.0f green:207/255.0f blue:241/255.0f alpha:1.0f];
    [reset setTitleColor:[[reset titleColorForState:UIControlStateNormal] colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
    [reset setTitle:@"Reset" forState:UIControlStateNormal];
    [reset setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [reset addTarget:self action:@selector(resetButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIScrollView * scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.collectionView.frame.size.width-100, self.collectionView.frame.size.height - 200)];
    scroll.userInteractionEnabled=YES;
    
    scroll.contentSize = CGSizeMake(self.collectionView.frame.size.width-100,1130);
    
    
    two = [[UITextField alloc] init];
    two.frame = CGRectMake(10.0, 70.0, contentView.frame.size.width-20, 70);
    two.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *imageViewTwo = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 45, 65)];
    imageViewTwo.image = [UIImage imageNamed:@"2_of_clubs"];
    two.leftView = imageViewTwo;
    two.placeholder = @" Two rules";
    two.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [two setText:[userRules objectForKey:@"two"]];
    two.delegate = self;
    two.returnKeyType = UIReturnKeyDone;
    
    
    three = [[UITextField alloc] init];
    three.frame = CGRectMake(10.0, 150.0, contentView.frame.size.width-20, 70);
    three.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *imageViewThree = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 45, 65)];
    imageViewThree.image = [UIImage imageNamed:@"3_of_clubs"];
    three.leftView = imageViewThree;
    three.placeholder = @" Three rules";
    three.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [three setText:[userRules objectForKey:@"three"]];
    three.delegate = self;
    three.returnKeyType = UIReturnKeyDone;
    
   four = [[UITextField alloc] init];
    four.frame = CGRectMake(10.0, 230.0, contentView.frame.size.width-20, 70);
    four.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *imageViewFour = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 45, 65)];
    imageViewFour.image = [UIImage imageNamed:@"4_of_clubs"];
    four.leftView = imageViewFour;
    four.placeholder = @" Four rules";
    four.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [four setText:[userRules objectForKey:@"four"]];
    four.delegate = self;
    four.returnKeyType = UIReturnKeyDone;
    
   five = [[UITextField alloc] init];
    five.frame = CGRectMake(10.0, 310.0, contentView.frame.size.width-20, 70);
    five.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *imageViewFive = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 45, 65)];
    imageViewFive.image = [UIImage imageNamed:@"5_of_clubs"];
    five.leftView = imageViewFive;
    five.placeholder = @" Five rules";
    five.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [five setText:[userRules objectForKey:@"five"]];
    five.delegate = self;
    five.returnKeyType = UIReturnKeyDone;
    
    
    six = [[UITextField alloc] init];
    six.frame = CGRectMake(10.0, 390.0, contentView.frame.size.width-20, 70);
    six.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *imageViewSix = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 45, 65)];
    imageViewSix.image = [UIImage imageNamed:@"6_of_clubs"];
    six.leftView = imageViewSix;
    six.placeholder = @" Six rules";
    six.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [six setText:[userRules objectForKey:@"six"]];
    six.delegate = self;
    six.returnKeyType = UIReturnKeyDone;
    
    
    seven = [[UITextField alloc] init];
    seven.frame = CGRectMake(10.0, 470.0, contentView.frame.size.width-20, 70);
    seven.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *imageViewSeven = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 45, 65)];
    imageViewSeven.image = [UIImage imageNamed:@"7_of_clubs"];
    seven.leftView = imageViewSeven;
    seven.placeholder = @" Seven rules";
    seven.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [seven setText:[userRules objectForKey:@"seven"]];
    seven.delegate = self;
    seven.returnKeyType = UIReturnKeyDone;
    
    eight = [[UITextField alloc] init];
    eight.frame = CGRectMake(10.0, 550.0, contentView.frame.size.width-20, 70);
    eight.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *imageViewEight = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 45, 65)];
    imageViewEight.image = [UIImage imageNamed:@"8_of_clubs"];
    eight.leftView = imageViewEight;
    eight.placeholder = @" Eight rules";
    eight.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [eight setText:[userRules objectForKey:@"eight"]];
    eight.delegate = self;
    eight.returnKeyType = UIReturnKeyDone;
    
    nine = [[UITextField alloc] init];
    nine.frame = CGRectMake(10.0, 630.0, contentView.frame.size.width-20, 70);
    nine.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *imageViewNine = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 45, 65)];
    imageViewNine.image = [UIImage imageNamed:@"9_of_clubs"];
    nine.leftView = imageViewNine;
    nine.placeholder = @" Nine rules";
    nine.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [nine setText:[userRules objectForKey:@"nine"]];
    nine.delegate = self;
    nine.returnKeyType = UIReturnKeyDone;
    
    
    ten = [[UITextField alloc] init];
    ten.frame = CGRectMake(10.0, 710.0, contentView.frame.size.width-20, 70);
    ten.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *imageViewTen = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 45, 65)];
    imageViewTen.image = [UIImage imageNamed:@"10_of_clubs"];
    ten.leftView = imageViewTen;
    ten.placeholder = @" Ten rules";
    ten.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [ten setText:[userRules objectForKey:@"ten"]];
    ten.delegate = self;
    ten.returnKeyType = UIReturnKeyDone;
    
    
    jack = [[UITextField alloc] init];
    jack.frame = CGRectMake(10.0, 790.0, contentView.frame.size.width-20, 70);
    jack.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *imageViewJack = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 45, 65)];
    imageViewJack.image = [UIImage imageNamed:@"jack_of_clubs"];
    jack.leftView = imageViewJack;
    jack.placeholder = @" Jack rules";
    jack.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [jack setText:[userRules objectForKey:@"jack"]];
    jack.delegate = self;
    jack.returnKeyType = UIReturnKeyDone;
    
    
    queen = [[UITextField alloc] init];
    queen.frame = CGRectMake(10.0, 870.0, contentView.frame.size.width-20, 70);
    queen.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *imageViewQueen = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 45, 65)];
    imageViewQueen.image = [UIImage imageNamed:@"queen_of_clubs"];
    queen.leftView = imageViewQueen;
    queen.placeholder = @" Queen rules";
    queen.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [queen setText:[userRules objectForKey:@"queen"]];
    queen.delegate = self;
    queen.returnKeyType = UIReturnKeyDone;
    
    
    king = [[UITextField alloc] init];
    king.frame = CGRectMake(10.0, 950.0, contentView.frame.size.width-20, 70);
    king.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *imageViewKing = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 45, 65)];
    imageViewKing.image = [UIImage imageNamed:@"king_of_clubs"];
    king.leftView = imageViewKing;
    king.placeholder = @" King rules";
    king.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [king setText:[userRules objectForKey:@"king"]];
    king.delegate = self;
    king.returnKeyType = UIReturnKeyDone;
    
    ace = [[UITextField alloc] init];
    ace.frame = CGRectMake(10.0, 1030.0, contentView.frame.size.width-20, 70);
    ace.leftViewMode = UITextFieldViewModeAlways;
    ace.delegate = self;
    UIImageView *imageViewAce = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 45, 65)];
    imageViewAce.image = [UIImage imageNamed:@"ace_of_clubs"];
    ace.leftView = imageViewAce;
    ace.placeholder = @" Ace rules";
    ace.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [ace setText:[userRules objectForKey:@"ace"]];
    ace.returnKeyType = UIReturnKeyDone;
    
    
    [contentView addSubview:scroll];
    
    [scroll addSubview:two];
    [scroll addSubview:three];
    [scroll addSubview:four];
    [scroll addSubview:five];
    [scroll addSubview:six];
    [scroll addSubview:seven];
    [scroll addSubview:eight];
    [scroll addSubview:nine];
    [scroll addSubview:ten];
    [scroll addSubview:jack];
    [scroll addSubview:queen];
    [scroll addSubview:king];
    [scroll addSubview:ace];
    
    
    [contentView addSubview:header];
    [contentView addSubview:done];
    [contentView addSubview:reset];
    [header addSubview:title];
    KLCPopup* popup = [KLCPopup popupWithContentView:contentView];
    [popup show];
    NSLog(@"%@",[userRules objectForKey:@"two"] );
    
}


- (void)doneButtonPressed:(id)sender {
    
    
    userRules = [NSUserDefaults standardUserDefaults];
    [userRules setObject:@1 forKey:@"set"];
    [userRules setObject:two.text forKey:@"two"];
    [userRules setObject:three.text forKey:@"three"];
    [userRules setObject:four.text forKey:@"four"];
    [userRules setObject:five.text forKey:@"five"];
    [userRules setObject:six.text forKey:@"six"];
    [userRules setObject:seven.text forKey:@"seven"];
    [userRules setObject:eight.text forKey:@"eight"];
    [userRules setObject:nine.text forKey:@"nine"];
    [userRules setObject:ten.text forKey:@"ten"];
    [userRules setObject:jack.text forKey:@"jack"];
    [userRules setObject:queen.text forKey:@"queen"];
    [userRules setObject:king.text forKey:@"king"];
    [userRules setObject:ace.text forKey:@"ace"];
    
    
    [userRules synchronize];
    
    ruleTwo = [userRules objectForKey:@"two"];
    if ([sender isKindOfClass:[UIView class]]) {
        [(UIView*)sender dismissPresentingPopup];
    }
}
- (void)OKButtonPressed:(id)sender {
    if ([sender isKindOfClass:[UIView class]]) {
        [(UIView*)sender dismissPresentingPopup];
    }
 
}

- (void)shareButtonPressed:(id)sender {
    
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"login"];
    [self presentViewController:vc animated:YES completion:nil];
}


- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (banner == bannerViewTop) {
        NSLog(@"top");
    }
    else if (banner == bannerViewBottom) {
        NSLog(@"bottom");
    }
}
-(void)flatButtonPressed:(id)button {
    
        [UIView animateWithDuration:1 animations:^{_grey.alpha = 0.0; _play.alpha = 0.0, _editRules.alpha = 0.0;
    
        UIImage * toImage = [UIImage imageNamed:@"pick.png"];
        [UIView transitionWithView:_logo
                          duration:3.0f
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            _logo.image = toImage;
                            
                            
                        } completion:nil];}];
    
    
    [UIView commitAnimations];
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        //its iPhone. Find out which one?
        
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            bannerViewBottom = [[ADBannerView alloc]initWithFrame:
                                CGRectMake(0, self.collectionView.frame.size.height - 50, self.view.frame.size.width, 50)];
        }
        else if(result.height == 568)
        {
            bannerViewBottom = [[ADBannerView alloc]initWithFrame:
                                CGRectMake(0, self.collectionView.frame.size.height - 50, self.view.frame.size.width, 50)];
        }
        else if(result.height == 667)
        {
            bannerViewBottom = [[ADBannerView alloc]initWithFrame:
                                CGRectMake(0, self.collectionView.frame.size.height - 50, self.view.frame.size.width, 50)];
        }
        else if(result.height == 736)
        {
            bannerViewBottom = [[ADBannerView alloc]initWithFrame:
                                CGRectMake(0, self.collectionView.frame.size.height - 50, self.view.frame.size.width, 50)];
        }
    }
    else
    {
        bannerViewBottom = [[ADBannerView alloc]initWithFrame:
                            CGRectMake(0, self.collectionView.frame.size.height - 65, self.view.frame.size.width, 50)];
    }

   
    // Optional to set background color to clear color

    [self loadRules];
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;

{
    return self.cellCount;
    
   
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    Cell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"MY_CELL" forIndexPath:indexPath];
   
    
    
    return cell;
}

-(void)addCells:(NSTimer *) timer {
    static int counter = 0;
    self.cellCount++;
    
    counter ++;
    [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:self.cellCount-1 inSection:0]]];
    if (self.cellCount == cards.count) {
        [timer invalidate];
    }
}

- (void)handleTapGesture:(UITapGestureRecognizer *)sender {
    CGPoint center;
    CGSize size = self.collectionView.frame.size;
  
    center = CGPointMake(size.width / 2.0, size.height / 2.0);
    
    
    UIView* contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor whiteColor];
    
    contentView.layer.cornerRadius = 6.0;
    contentView.frame = CGRectMake(0.0, 0.0,300, 300);
    CGPoint klccenter;
    CGSize klcsize = contentView.frame.size;
    klccenter = CGPointMake(contentView.frame.size.width / 2.0, contentView.frame.size.height / 2.0);
    
    UIView* header = [[UIView alloc] init];
    header.layer.cornerRadius = 6.0;
    header.frame = CGRectMake(0.0, 0.0, contentView.frame.size.width, 50);
    header.backgroundColor =  [UIColor colorWithRed:118/255.0f green:207/255.0f blue:241/255.0f alpha:1.0f];
    
    UITextView* textRules = [[UITextView alloc] init];
    textRules.frame = CGRectMake(20.0, 70.0, contentView.frame.size.width-40, 160);
textRules.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    textRules.editable = FALSE;
     replay = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIButton* done = [UIButton buttonWithType:UIButtonTypeCustom];
    done.frame = CGRectMake(klccenter.x-50 , 240, 100, 50);
    done.layer.cornerRadius = 6.0;
    done.titleLabel.font=[UIFont fontWithName:@"Avenir-Black" size:20.0f];
    done.backgroundColor = [UIColor colorWithRed:118/255.0f green:207/255.0f blue:241/255.0f alpha:1.0f];
    [done setTitleColor:[[done titleColorForState:UIControlStateNormal] colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
    [done setTitle:@"OK" forState:UIControlStateNormal];
    [done setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [done addTarget:self action:@selector(OKButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel* title = [[UILabel alloc] init];
    title.frame = CGRectMake(0.0, 0.0, contentView.frame.size.width, 50);
    [title setText:@"Rule"];
    [title setFont:[UIFont fontWithName:@"Avenir-Black" size:20.0f]];
    [title setTextColor:[UIColor whiteColor]];
    title.textAlignment = NSTextAlignmentCenter;

    
    [contentView addSubview:header];
    [contentView addSubview:title];
    [contentView addSubview:textRules];
    [contentView addSubview:done];
  KLCPopup *popup = [KLCPopup popupWithContentView:contentView showType:KLCPopupShowTypeBounceInFromTop dismissType:KLCPopupDismissTypeBounceOutToBottom maskType:KLCPopupMaskTypeDimmed dismissOnBackgroundTouch:YES dismissOnContentTouch:NO];
   

    if (sender.state == UIGestureRecognizerStateEnded)
    {
        
        CGPoint initialPinchPoint = [sender locationInView:self.collectionView];
        NSIndexPath* tappedCellPath = [self.collectionView indexPathForItemAtPoint:initialPinchPoint];
        if (tappedCellPath!=nil && !cards.count==0)
        {
                int randomNumber = arc4random() % cards.count;
            self.cellCount = self.cellCount - 1;
            [self.collectionView performBatchUpdates:^{
                [self.collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:tappedCellPath]];
                
            } completion:nil];
            
           
            UIImage * toImage = [UIImage imageNamed:[cards objectAtIndex:randomNumber]];
            [UIView transitionWithView:_logo
                              duration:1.0f
                               options: UIViewAnimationOptionTransitionCrossDissolve
                            animations:^{
                                _logo.image = toImage;
                                if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
                                {
                                    //its iPhone. Find out which one?
                                    
                                    CGSize result = [[UIScreen mainScreen] bounds].size;
                                    if(result.height == 480)
                                    {
                                        _logo.frame = CGRectMake(center.x-50, center.y-80, 100, 160);
                                    }
                                    else if(result.height == 568)
                                    {
                                       _logo.frame = CGRectMake(center.x-50, center.y-80, 100, 160);
                                    }
                                    else if(result.height == 667)
                                    {
                                      _logo.frame = CGRectMake(center.x-50, center.y-80, 100, 160);
                                    }
                                    else if(result.height == 736)
                                    {
                                       _logo.frame = CGRectMake(center.x-50, center.y-80, 100, 160);
                                    }
                                }
                                else
                                {
                                    _logo.frame = CGRectMake(center.x-100, center.y-150, 200, 300);
                                }
                             
                            } completion:nil];
            
            if([[cards objectAtIndex:randomNumber] hasPrefix:@"2"]){
                                CGPoint center;
                CGSize size = contentView.frame.size;
                center = CGPointMake(contentView.frame.size.width / 2.0, contentView.frame.size.height / 2.0);
                [UIView transitionWithView:_rules
                                  duration:1.0f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                     textRules.text =[userRules objectForKey:@"two"];
                                } completion:^(BOOL finished) {
                                    if(finished)
                                    {
                                        [popup show];
                                       
                                        self.collectionView.userInteractionEnabled = TRUE;
                                        // My completion block stuff goes here
                                    }
                                }];
            }
            if([[cards objectAtIndex:randomNumber] hasPrefix:@"3"]){
                [UIView transitionWithView:_rules
                                  duration:1.0f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    textRules.text=[userRules objectForKey:@"three"];
                                } completion:^(BOOL finished) {
                                    if(finished)
                                    {
                                        [popup show];
                                        self.collectionView.userInteractionEnabled = TRUE;
                                        // My completion block stuff goes here
                                    }
                                }];

            }
            if([[cards objectAtIndex:randomNumber] hasPrefix:@"4"]){
                [UIView transitionWithView:_rules
                                  duration:1.0f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    textRules.text=[userRules objectForKey:@"four"];
                                } completion:^(BOOL finished) {
                                    if(finished)
                                    {
                                        [popup show];
                                        self.collectionView.userInteractionEnabled = TRUE;
                                        // My completion block stuff goes here
                                    }
                                }];

            }
            if([[cards objectAtIndex:randomNumber] hasPrefix:@"5"]){
                [UIView transitionWithView:_rules
                                  duration:1.0f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    textRules.text=[userRules objectForKey:@"five"];
                                } completion:^(BOOL finished) {
                                    if(finished)
                                    {
                                        [popup show];
                                        self.collectionView.userInteractionEnabled = TRUE;
                                        // My completion block stuff goes here
                                    }
                                }];

            }
            if([[cards objectAtIndex:randomNumber] hasPrefix:@"6"]){
                [UIView transitionWithView:_rules
                                  duration:1.0f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    textRules.text=[userRules objectForKey:@"six"];
                                } completion:^(BOOL finished) {
                                    if(finished)
                                    {
                                        [popup show];
                                        self.collectionView.userInteractionEnabled = TRUE;
                                        // My completion block stuff goes here
                                    }
                                }];

            }
            if([[cards objectAtIndex:randomNumber] hasPrefix:@"7"]){
                [UIView transitionWithView:_rules
                                  duration:1.0f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    textRules.text=[userRules objectForKey:@"seven"];
                                } completion:^(BOOL finished) {
                                    if(finished)
                                    {
                                        [popup show];
                                        self.collectionView.userInteractionEnabled = TRUE;
                                        // My completion block stuff goes here
                                    }
                                }];
          }
            if([[cards objectAtIndex:randomNumber] hasPrefix:@"8"]){
                [UIView transitionWithView:_rules
                                  duration:1.0f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    textRules.text=[userRules objectForKey:@"eight"];
                                } completion:^(BOOL finished) {
                                    if(finished)
                                    {
                                        [popup show];
                                        self.collectionView.userInteractionEnabled = TRUE;
                                        // My completion block stuff goes here
                                    }
                                }];

            }
            if([[cards objectAtIndex:randomNumber] hasPrefix:@"9"]){
                [UIView transitionWithView:_rules
                                  duration:1.0f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                   textRules.text=[userRules objectForKey:@"nine"];
                                } completion:^(BOOL finished) {
                                    if(finished)
                                    {
                                        [popup show];
                                        self.collectionView.userInteractionEnabled = TRUE;
                                        // My completion block stuff goes here
                                    }
                                }];
           }
            if([[cards objectAtIndex:randomNumber] hasPrefix:@"10"]){
                [UIView transitionWithView:_rules
                                  duration:1.0f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                   textRules.text=[userRules objectForKey:@"ten"];
                                } completion:^(BOOL finished) {
                                    if(finished)
                                    {
                                        [popup show];
                                        self.collectionView.userInteractionEnabled = TRUE;
                                        // My completion block stuff goes here
                                    }
                                }];
           }
            if([[cards objectAtIndex:randomNumber] hasPrefix:@"jack"]){
                [UIView transitionWithView:_rules
                                  duration:1.0f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    textRules.text=[userRules objectForKey:@"jack"];
                                } completion:^(BOOL finished) {
                                    if(finished)
                                    {
                                        [popup show];
                                        self.collectionView.userInteractionEnabled = TRUE;
                                        // My completion block stuff goes here
                                    }
                                }];

            }
            if([[cards objectAtIndex:randomNumber] hasPrefix:@"queen"]){
                [UIView transitionWithView:_rules
                                  duration:1.0f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    textRules.text=[userRules objectForKey:@"queen"];
                                } completion:^(BOOL finished) {
                                    if(finished)
                                    {
                                        [popup show];
                                        self.collectionView.userInteractionEnabled = TRUE;
                                        // My completion block stuff goes here
                                    }
                                }];
          }
            if([[cards objectAtIndex:randomNumber] hasPrefix:@"king"]){
                kingNo = kingNo + 1;
                [UIView transitionWithView:_rules
                                  duration:1.0f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    textRules.text=[NSString stringWithFormat:@"%@ \nThis is King number %d",[userRules objectForKey:@"king"], kingNo];
                                } completion:^(BOOL finished) {
                                    if(finished)
                                    {
                                        [popup show];
                                        self.collectionView.userInteractionEnabled = TRUE;
                                        // My completion block stuff goes here
                                    }
                                }];

            }
            if([[cards objectAtIndex:randomNumber] hasPrefix:@"ace"]){
                [UIView transitionWithView:_rules
                                  duration:1.0f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    textRules.text=[userRules objectForKey:@"ace"];
                                } completion:^(BOOL finished) {
                                    if(finished)
                                    {
                                        [popup show];
                                        self.collectionView.userInteractionEnabled = TRUE;
                                        // My completion block stuff goes here
                                    }
                                }];

            }else{
                self.collectionView.userInteractionEnabled = TRUE;
            }

            [cards removeObjectAtIndex:randomNumber];
            
            if(cards.count == 0){
                
                if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
                {
                    
                    
                    CGSize result = [[UIScreen mainScreen] bounds].size;
                    if(result.height == 480)
                    {
                        replay.frame = CGRectMake(center.x-50 , center.y + 130, 100, 50);
                    }
                    else if(result.height == 568)
                    {
                        replay.frame = CGRectMake(center.x-50 , center.y + 130, 100, 50);
                    }
                    else if(result.height == 667)
                    {
                        replay.frame = CGRectMake(center.x-50 , center.y + 130, 100, 50);
                    }
                    else if(result.height == 736)
                    {
                        replay.frame = CGRectMake(center.x-50 , center.y + 200, 100, 50);
                    }
                }
                else
                {
                    replay.frame = CGRectMake(center.x-50 , center.y + 200, 100, 50);
                }
            }
            
            replay.layer.cornerRadius = 6.0;
            replay.titleLabel.font=[UIFont fontWithName:@"Avenir-Black" size:20.0f];
            replay.backgroundColor = [UIColor colorWithRed:118/255.0f green:207/255.0f blue:241/255.0f alpha:1.0f];
            [replay setTitleColor:[[replay titleColorForState:UIControlStateNormal] colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
            [replay setTitle:@"Replay" forState:UIControlStateNormal];
            [replay setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [replay addTarget:self action:@selector(replayButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.collectionView addSubview:replay];
            
            
            
        
            }
        
            }
    
}

@end
