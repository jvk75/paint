//
//  TestCase.m
//  paint
//
//  Created by Jari Kalinainen on 06.12.15.
//  Copyright © 2015 Jari Kalinainen. All rights reserved.
//

#import "TestCase.h"

@implementation TestCase

// simple one line initialisation
-(id)initWithTestId:(NSInteger)testid AndData:(NSArray*)dataArray
{
    self = [super init];
    if (self) {
        _testId = testid;
        [self prepareTestWithData:dataArray];
    }
    return self;
}

// create customers with data for the test
-(void)prepareTestWithData:(NSArray *)testDataArray
{
    colors = [[testDataArray objectAtIndex:kNUMBEROFCOLORSROW] integerValue];
    NSInteger numberOfCustomers = [[testDataArray objectAtIndex:kNUMBEROFCUSTOMERSROW] integerValue];
    customers = [NSMutableArray new];
    for (NSInteger j = 0; j < numberOfCustomers; j++) {
        Customer *cust = [[Customer alloc] initWithData:[testDataArray objectAtIndex:j+kFIRSTCUSTOMERDATAROW]];
        [customers addObject:cust];
    }
}

// run the test and return result string
-(NSString*)runTest
{
    NSMutableString *result = [NSMutableString stringWithFormat:@"Case #%ld: ",_testId];
    for (NSInteger col = 1; col < colors+1; col++) {
        NSInteger numberOfType0 = 0;
        NSInteger numberOfType1 = 0;
        NSInteger numberOfCustomers = [customers count];
        for (NSInteger c = 0 ; c < numberOfCustomers; c++) {
            Customer *cust = [customers objectAtIndex:0];
            if ([cust hasColor:col]) {
                if ([cust hasColor:col withType:0]) {
                    if ([cust numberOfColors] == 1) {
                        numberOfType0++;
                    }
                } else {
                    if ([cust numberOfColors] == 1) {
                        numberOfType1++;
                    }
                }
                [cust removeColor:col];
            }
            if ([cust numberOfColors] == 0) {
                [customers removeObjectAtIndex:0];
            }
        }
        if (numberOfType0 == 0 && numberOfType1 == 0) {
            [result appendString:@"0 "];
        } else if (numberOfType0 > 0 && numberOfType1 == 0) {
            [result appendString:@"0 "];
        } else if ((numberOfType0 == 0 && numberOfType1 > 0)) {
            [result appendString:@"1 "];
        } else {
            result = [NSMutableString stringWithFormat:@"Case #%ld: IMPOSSIBLE",_testId];
            break;
        }
    }
    return result;
    
}

-(void)printMe //debug method
{
    NSLog(@"- TestCase #%ld",_testId);
    [customers makeObjectsPerformSelector:@selector(printMe)];
}

@end
