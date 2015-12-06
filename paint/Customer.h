//
//  Customer.h
//  paint
//
//  Created by Jari Kalinainen on 05.12.15.
//  Copyright © 2015 Jari Kalinainen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Defines.h"
#import "Color.h"

@interface Customer : NSObject

@property (readonly) NSMutableDictionary *colors;
@property (readonly) NSInteger numberOfColors;

// initializer
-(id)initWithData:(NSString*)dataString;

// true if customer has color (ignore type)
-(BOOL)hasColor:(NSInteger)color;
// true if customer has color with specified type
-(BOOL)hasColor:(NSInteger)color withType:(NSInteger)type;
//remove color from customer
-(void)removeColor:(NSInteger)color;

-(void)printMe;

@end
