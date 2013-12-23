//
//  ViewController.m
//  form
//
//  Created by NAVEEN  on 12/11/13.
//  Copyright (c) 2013 NAVEEN . All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()
{
    NSArray *paths;
    NSString *filename,*newPath;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
        [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)takescreenshotes{
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, self.view.opaque, 0.0);

    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData * data = UIImagePNGRepresentation(image);
    filename=@"latest.png"; //create a custome file name for your screen shots
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    newPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:filename];
    
    [data writeToFile:newPath atomically:YES]; //Path to store the screen shots
    UIImageWriteToSavedPhotosAlbum([UIImage imageWithData:data], nil, nil, nil);
}
- (IBAction)openMail:(id)sender
{
    [self takescreenshotes];
    
}




@end
