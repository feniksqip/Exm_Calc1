//
//  ViewController.m
//  Exm_Calc1
//
//  Created by Admin on 18.01.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _display.text = [NSString stringWithFormat:@"0"];
    
    numberString = 0;
    function = 0;
    firstNumber = 0;
    secondNumber = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numberBtn:(id)sender {
    if (!numberString) {
        numberString = [NSString stringWithFormat:@"%ld", (long)[sender tag]];
    } else {
        numberString = [NSString stringWithFormat:@"%@%ld", numberString, (long)[sender tag]];
    }
    _display.text = numberString;
}

- (IBAction)functionBtn:(id)sender {

    if (function == 0) {
        firstNumber = [numberString intValue];
        numberString = nil;
        _display.text = [NSString stringWithFormat:@"%d", firstNumber];
        [self functionDetect:(int)[sender tag]];
    }
    else {
        secondNumber = [numberString intValue];
        _display.text = [NSString stringWithFormat:@"0"];
        numberString = nil;
        if (function == 10) {
           firstNumber = firstNumber - secondNumber;
        } else if (function == 11) {
            firstNumber = firstNumber + secondNumber;
        } else if (function == 12) {
            firstNumber = firstNumber / secondNumber;
        } else if (function == 13) {
            firstNumber = firstNumber * secondNumber;
        }
        _display.text = [NSString stringWithFormat:@"%d",firstNumber];
        
        [self functionDetect:(int)[sender tag]];
    }
    
}

- (IBAction)calculateResult:(id)sender {
    secondNumber = [numberString intValue];
    if (function == 10) {
        firstNumber = firstNumber - secondNumber;
    } else if (function == 11) {
        firstNumber = firstNumber + secondNumber;
    } else if ((function == 12) & (secondNumber != 0)) {
        firstNumber = firstNumber / secondNumber;
    } else if (function == 13) {
        firstNumber = firstNumber * secondNumber;
    }
    _display.text = [NSString stringWithFormat:@"%d",firstNumber];
    
    firstNumber = 0;
    secondNumber = 0;
    function = 0;
    numberString = nil;
}
- (void) functionDetect:(int)sender {
    if (sender == 10) {
        function = 10;
        NSLog(@"(Pushed: - )");
    } else if (sender == 11) {
        function = 11;
        NSLog(@"(Pushed: + )");
    } else if (sender == 12) {
        function = 12;
        NSLog(@"(Pushed: / )");
    } else if (sender == 13) {
        function = 13;
        NSLog(@"(Pushed: * )");
    }
}
@end
