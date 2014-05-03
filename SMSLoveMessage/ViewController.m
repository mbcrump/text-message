//
//  ViewController.m
//  SMSLoveMessage
//
//  Created by Michael Crump on 4/10/14.
//  Copyright (c) 2014 Michael Crump. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController {
    NSString *results;
    NSArray *firstList;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    firstList = (NSArray *)@[@"You are the reason for my smile.",
                             @"Words aren’t enough to tell you how wonderful you are. I love you.",
                             @"You make my heart melt!",
                             @"Life has never been better, thanks to you, sweetheart!",
                             @"I miss you, we should get together soon!",
                             @"If I had to, I would wait for an eternity to be with you.",
                             @"I will love you forever and always.",
                             @"Waiting for you at home, come back soon. I miss you.",
                             @"To have you as my girl is my honor. Be with me always!",
                             @"They say love hurts, but I’m ready to take that risk to be with you.",
                             @"I would climb a thousand mountains to see you smile.",
                             @"I’d like to wake up next to you every morning!",
                             @"You take my breath away.",
                             @"My life is perfect, but it’s because I am with you.",
                             @"I love yo_. All I need is ‘U’",
                             @"If I was your bed, you’d sleep on top of me!",
                             @"If I could hold you close again, I’d never let you go.",
                             @"Every day would be as beautiful if you were with me.",
                             @"If I could describe you in one word, I’d call you my life.",
                             @"You make my heart beat faster and slower at the same time.",
                             @"You’re my angel.",
                             @"My love for you is never ending!",
                             @"My life is a jigsaw puzzle and you’re my missing piece.",
                             @"You bring sunshine into my life! You aren’t the sun, but you’re just as hot.",
                             @"I can’t wait to be with you again. Loves and hugs.",
                             @"They say love gives you wings but is that why I’m in seventh heaven?",
                             @"You complete me.",
                             @"I could attempt to live without you. But I would fail miserably.",
                             @"Life is beautiful because of you.",
                             @"For you I may be just one person, but for me you are the world.",
                             @"I can’t live without you.",
                             @"Thank you for supporting me today. If it wasn’t for you, I’d be lost.",
                             @"When words aren’t enough, remind me to come and kiss you.",
                             @"Loving you is like breathing. I can’t stop and it’s necessary for my survival.",
                             @"You + me = Happiness forever.",
                             @"If loving you was against the law, I’d happily spend my life in prison.",
                             @"I will love you for the rest of MY life.",
                             @"I woke up and thought something was missing. So I grabbed my cell phone and sent you a greeting.",
                             @"A smile is a wonderful thing – it warms the heart and cools the sting. Keep Smiling – always.",
                             @"Do you know how wonderful it feels to wake up each day and know that you are mine?",
                             @"It took me years to find perfection; I’m never going to let you go!",
                             @"I’ll love you like no other. Be with me always!",
                             @"People come and go, but you and I will stay together, forever.",
                             @"If I was a planet and you my moon, I’d stop spinning just by looking at you.",
                             @"The world can cry foul by seeing you with me, but everything is fair in love and war.",
                             @"You are the one for me.",
                             @"You are my number 1!",
                             @"Life is not a waste as long as there is at least one person in the world who cares for you.",
                             @"Lovely wishes 2 a Lovely Person on a Lovely Day.",
                             @"If I could rewrite the alphabet I’d put U and I together!",
                             @"It takes 2 to tango. 2 to kiss. 2 to talk & reminisce.",
                             @"I love all the stars in the sky, but they are nothing compared to the ones in your eyes!",
                             @"I can’t live without you.",
                             @"My life is perfect, but it’s because I am with you."];
    
    firstList = [self shuffleArray:firstList];
    
    [self.SpinTheWheel selectRow:5 inComponent:0 animated:YES];
    
}

- (NSArray*)shuffleArray:(NSArray*)array {
    
    NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:array];
    
    
    for(NSUInteger i = [array count]; i > 1; i--) {
        NSUInteger j = arc4random_uniform((uint32_t)i);
        [temp exchangeObjectAtIndex:i-1 withObjectAtIndex:j];
    }
    
    return [NSArray arrayWithArray:temp];
}

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return firstList.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return firstList[row];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 0.0f, 300.0f, 60.0f)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [firstList objectAtIndex:row];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    
    return label;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MFMailComposeViewControllerDelegate methods
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult) result {
    switch (result) {
        case MessageComposeResultCancelled:
        {
            
        }
            break;
        case MessageComposeResultFailed:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SMS Love Message" message:@"Error occured while sending the SMS"
                                                           delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
            break;
        case MessageComposeResultSent:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SMS Love Message" message:@"SMS sent successfully..!"
                                                           delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
            break;
            
        default: break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)SendSMSMessage:(id)sender {
    //check if the device can send text messages
    if(![MFMessageComposeViewController canSendText]) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your device cannot send text messages" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    NSInteger row;
    
    row = [self.SpinTheWheel selectedRowInComponent:0];
    results = [firstList objectAtIndex:row];
    
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.messageComposeDelegate = self;
    [messageController setBody:results];
    
    // Present message view controller on screen
    [self presentViewController:messageController animated:YES completion:nil];
    
}

- (IBAction)About:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SMS Love Message" message:@"By: Michael Crump (@mbcrump)"
                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}
@end
