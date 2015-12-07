//
//  TestRunner.m
//  paint
//
//  Created by Jari Kalinainen on 06.12.15.
//  Copyright © 2015 Jari Kalinainen. All rights reserved.
//

#import "TestRunner.h"
#import "TestCase.h"

@implementation TestRunner

-(id)initWithTestCasesArray:(NSArray*)testCases
{
    self = [super init];
    if (self) {
        [self createTestCases:testCases];
    }
    return self;
}

-(void)createTestCases:(NSArray*)testCases
{
    tests = [NSMutableArray new];
    _numberOfTests = [testCases count];
    for (NSInteger i = 0; i < _numberOfTests; i++) {
        TestCase *tc = [[TestCase alloc] initWithTestId:i+1 AndData:[testCases objectAtIndex:i]];
        [tests addObject:tc];
    }
    
}

-(void)runAllTests
{
    for (NSInteger i = 0; i < _numberOfTests; i++) {
        [self runSingleTest:i];
    }
}

-(void)runSingleTest:(NSInteger)testid
{
    if ([tests count] > testid) {
        NSLog(@"%@",[[tests objectAtIndex:testid] runTest]);
    } else {
        NSLog(@"Error: Test case #%ld not found!",testid+1);
    }
}

#ifdef DEBUG
-(void)printMe //debug method
{
    NSLog(@"TestHandler with test:");
    [tests makeObjectsPerformSelector:@selector(printMe)];
}
#endif

@end
