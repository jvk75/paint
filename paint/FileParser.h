//
//  FileParser.h
//  paint
//
//  Created by Jari Kalinainen on 06.12.15.
//  Copyright © 2015 Jari Kalinainen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Defines.h"

@interface FileParser : NSObject

-(NSArray*)parseFilePath:(NSString*)filePath;

@end
