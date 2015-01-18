//
//  ViewController.h
//  Exm_Calc1
//
//  Created by Admin on 18.01.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSString *numberString;
    int function;
    int firstNumber;
    int secondNumber;
}
@property (weak, nonatomic) IBOutlet UITextField *display;

- (IBAction)numberBtn:(id)sender;
- (IBAction)functionBtn:(id)sender;
- (IBAction)calculateResult:(id)sender;

@end

