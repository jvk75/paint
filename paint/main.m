//
//  main.m
//  paint
//
//  Created by Jari Kalinainen on 05.12.15.
//  Copyright © 2015 Jari Kalinainen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileParser.h"
#import "TestHandler.h"
#import "Defines.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        if ([[[NSProcessInfo processInfo] arguments] count] > 1) {
            FileParser *fp = [FileParser new];
            NSArray *tests = [fp parseFilePath:[[[NSProcessInfo processInfo] arguments] objectAtIndex:1]];
            if (tests != nil){
                TestHandler *th = [TestHandler new];
                [th createTestCases:tests];
                #ifdef DEBUG
                [th printMe]; // print all test details
                #endif   
                [th runAllTests];
            }
        } else {
            NSLog(@"Error: no input file specifed!");
        }
    }
    return 0;
}
