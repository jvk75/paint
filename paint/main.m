//
//  main.m
//  paint
//
//  Created by Jari Kalinainen on 05.12.15.
//  Copyright © 2015 Jari Kalinainen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileParser.h"
#import "TestRunner.h"
#import "Defines.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        if ([[[NSProcessInfo processInfo] arguments] count] > 1) {
            FileParser *fp = [FileParser new];
            NSArray *testDataArray = [fp getFileAsArrayFromPath:[[[NSProcessInfo processInfo] arguments] objectAtIndex:1]];
            if (testDataArray != nil){
                TestRunner *tr = [TestRunner new];
                [tr createTestCases:testDataArray];
                #ifdef DEBUG
                [tr printMe]; // print all test details
                #endif   
                [tr runAllTests];
            }
        } else {
            NSLog(@"Error: no input file specifed!");
        }
    }
    return 0;
}
