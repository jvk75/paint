//
//  TestCase.h
//  paint
//
//  Created by Jari Kalinainen on 06.12.15.
//  Copyright © 2015 Jari Kalinainen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Customer.h"

@interface TestCase : NSObject
{
    NSInteger colors;
    NSMutableArray *customers;
}

@property NSInteger testId;

//initializer
-(id)initWithTestId:(NSInteger)testid AndData:(NSArray*)dataArray;

// create test data
-(void)prepareTestWithData:(NSArray *)testDataArray;
// run test
-(NSString*)runTest;

-(void)printMe;

@end
