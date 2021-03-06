//
//  ViewController.m
//  CustomStoryboardSegue
//
//  Created by Romy on 9/8/15.
//  Copyright (c) 2015 Romy. All rights reserved.
//

#import "ViewController.h"
@import QuartzCore;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /* 
     From advanced Core Animation - this stuff is really easy to forget!
     layer lacks the responder chain, autolayout capabilities, etc. 
     and the cost to add a UIView instead of a layer is minimal
     */
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50.0f, 50.0f, 300.0f, 300.0f);
    // easy to forget if you don't type this every day =D
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    UIImage *sudoRoomImage = [UIImage imageNamed:@"SudoRoom.jpg"];
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = CGRectMake(0.0f, 0.0f, 50.0f, 50.0f);
    imageLayer.backgroundColor = [UIColor redColor].CGColor;
    
    /*
     contents is a quirky one - you have to bridge it if you're using ARC
     /* An object providing the contents of the layer, typically a CGImageRef,
     * but may be something else. (For example, NSImage objects are
     * supported on Mac OS X 10.6 and later.) Default value is nil.
     * Animatable. */
 
    imageLayer.contents = (__bridge id)sudoRoomImage.CGImage;

    [self.layerView.layer addSublayer:imageLayer];
    // easy to forget - every UIView has a CALayer backing layer (here the layer property)
    [self.layerView.layer addSublayer:blueLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
