//
//  LGClient.h
//  BaiduMap
//
//  Created by 潮汐 on 15-1-26.
//  Copyright (c) 2015年 chaox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
@interface LGClient : NSObject

+ (NSString *)serializeURL:(NSString *)baseURL params:(NSDictionary *)params;

@end
