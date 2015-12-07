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

-(id)initWithTestData:(NSString*)dataString;

-(NSInteger)getColorType:(NSNumber*)color;
-(BOOL)hasColor:(NSNumber*)color;
-(BOOL)hasColor:(NSNumber*)color withType:(NSInteger)type;
-(void)removeColor:(NSNumber*)color;

#ifdef DEBUG
-(void)printMe;
#endif

@end
