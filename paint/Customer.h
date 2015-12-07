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

-(id)initWithData:(NSString*)dataString;

-(NSInteger)getColorType:(NSInteger)color;
-(BOOL)hasColor:(NSInteger)color;
-(BOOL)hasColor:(NSInteger)color withType:(NSInteger)type;
-(void)removeColor:(NSInteger)color;
-(void)removeColorWithObj:(NSNumber*)color;

#ifdef DEBUG
-(void)printMe;
#endif

@end
