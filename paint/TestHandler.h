//
//  TestHandler.h
//  paint
//
//  Created by Jari Kalinainen on 06.12.15.
//  Copyright © 2015 Jari Kalinainen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestHandler : NSObject
{
    NSMutableArray *tests;
}
@property (readonly) NSInteger numberOfTests;

//initializer
-(id)initWithTestCasesArray:(NSArray*)testCases;
// create test cased from data
-(void)createTestCases:(NSArray*)testCases;
// run all cases
-(void)runAllTests;
// run sinlge test case with #
-(void)runSingleTest:(NSInteger)testid;

-(void)printMe;

@end
