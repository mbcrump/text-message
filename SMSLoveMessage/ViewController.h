//
//  ViewController.h
//  SMSLoveMessage
//
//  Created by Michael Crump on 4/10/14.
//  Copyright (c) 2014 Michael Crump. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ViewController : UIViewController <MFMessageComposeViewControllerDelegate, UIPickerViewDataSource,UIPickerViewDelegate>
- (IBAction)SendSMSMessage:(id)sender;
- (IBAction)About:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *SpinTheWheel;


@end
