//
//  AISDKManager.m
//  PunchCard
//
//  Created by Albin on 2019/7/2.
//  Copyright © 2019 Albin. All rights reserved.
//

#import "AISDKManager.h"
#import "AINetworking.h"

#define Domain @"http://182.254.204.70:8300" // https://aip.baidubce.com

@interface AISDKManager()

@property (nonatomic ,copy) NSString *token;

@end

@implementation AISDKManager


+ (instancetype)sharedInstance {
    static AISDKManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AISDKManager alloc] init];
    });
    return manager;
}

- (void)initWithLicenseID:(NSString *)licenseId andLocalLicenceFile:(NSString *)localLicencePath {
    NSDictionary *parameters = @{@"grant_type":@"client_credentials",
                                 @"client_id":licenseId,
                                 @"client_secret":localLicencePath,
                                 };
    [AINetworking PostWithURL:Domain@"/oauth/2.0/token" Params:parameters success:^(id responseObject) {
        NSString *token = responseObject[@"access_token"];
        [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"AISDK_access_token"];
    } failure:^(NSString *error) {
        NSLog(@"%@",error);
    }];
}


//人脸检测
- (void)faceDetectParameters:(id)parameters completion:(AICompletion)completion{
    NSString *url = [NSMutableString stringWithFormat:@"%@/face-api/v3/face/detect",Domain];
    [AINetworking PostWithURL:url Params:parameters success:^(id responseObject) {
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSString *error) {
        
    }];
}

//活体检测
- (void)faceLivenessParameters:(id)parameters completion:(AICompletion)completion{
    NSString *url = [NSMutableString stringWithFormat:@"%@/face-api/v3/face/liveness",Domain];
    [AINetworking PostWithURL:url Params:parameters success:^(id responseObject) {
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSString *error) {
        
    }];
}

//人脸对比
- (void)faceMatchParameters:(id)parameters completion:(AICompletion)completion{
    NSString *url = [NSMutableString stringWithFormat:@"%@/face-api/v3/face/match",Domain];
    [AINetworking PostWithURL:url Params:parameters success:^(id responseObject) {
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSString *error) {
        
    }];
}


//人脸搜索
- (void)faceIdentifyParameters:(id)parameters completion:(AICompletion)completion{
    NSString *url = [NSMutableString stringWithFormat:@"%@/face-api/v3/face/identify",Domain];
    [AINetworking PostWithURL:url Params:parameters success:^(id responseObject) {
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSString *error) {
        
    }];
}

//人脸注册
- (void)faceAddParameters:(id)parameters completion:(AICompletion)completion{
    NSString *url = [NSMutableString stringWithFormat:@"%@/face-api/v3/face/add",Domain];
    [AINetworking PostWithURL:url Params:parameters success:^(id responseObject) {
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSString *error) {
        
    }];
}


//人脸更新
- (void)faceUpdateParameters:(id)parameters completion:(AICompletion)completion{
    NSString *url = [NSMutableString stringWithFormat:@"%@/face-api/v3/face/update",Domain];
    [AINetworking PostWithURL:url Params:parameters success:^(id responseObject) {
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSString *error) {
        
    }];
}


//人脸列表
- (void)faceListParameters:(id)parameters completion:(AICompletion)completion{
    NSString *url = [NSMutableString stringWithFormat:@"%@/face-api/v3/face/list",Domain];
    [AINetworking PostWithURL:url Params:parameters success:^(id responseObject) {
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSString *error) {
        
    }];
}


//删除人脸
- (void)faceDeleteParameters:(id)parameters completion:(AICompletion)completion{
    NSString *url = [NSMutableString stringWithFormat:@"%@/face-api/v3/face/delete",Domain];
    [AINetworking PostWithURL:url Params:parameters success:^(id responseObject) {
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSString *error) {
        
    }];
}


//复制用户
- (void)userCopyParameters:(id)parameters completion:(AICompletion)completion{
    NSString *url = [NSMutableString stringWithFormat:@"%@/face-api/v3/user/copy",Domain];
    [AINetworking PostWithURL:url Params:parameters success:^(id responseObject) {
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSString *error) {
        
    }];
}


//获取用户信息
- (void)userGetParameters:(id)parameters completion:(AICompletion)completion{
    NSString *url = [NSMutableString stringWithFormat:@"%@/face-api/v3/user/get",Domain];
    [AINetworking PostWithURL:url Params:parameters success:^(id responseObject) {
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSString *error) {
        
    }];
}

//用户列表
- (void)userListParameters:(id)parameters completion:(AICompletion)completion{
    NSString *url = [NSMutableString stringWithFormat:@"%@/face-api/v3/user/list",Domain];
    [AINetworking PostWithURL:url Params:parameters success:^(id responseObject) {
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSString *error) {
        
    }];
}
//删除用户
- (void)userDeleteParameters:(id)parameters completion:(AICompletion)completion{
    NSString *url = [NSMutableString stringWithFormat:@"%@/face-api/v3/user/delete",Domain];
    [AINetworking PostWithURL:url Params:parameters success:^(id responseObject) {
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSString *error) {
        
    }];
}

//创建用户组
- (void)groupAddParameters:(id)parameters completion:(AICompletion)completion{
    NSString *url = [NSMutableString stringWithFormat:@"%@/face-api/v3/group/add",Domain];
    [AINetworking PostWithURL:url Params:parameters success:^(id responseObject) {
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSString *error) {
        
    }];
}

//删除用户组
- (void)groupDeleteParameters:(id)parameters completion:(AICompletion)completion{
    NSString *url = [NSMutableString stringWithFormat:@"%@/face-api/v3/group/delete",Domain];
    [AINetworking PostWithURL:url Params:parameters success:^(id responseObject) {
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSString *error) {
        
    }];
}

//组列表
- (void)groupListParameters:(id)parameters completion:(AICompletion)completion{
    NSString *url = [NSMutableString stringWithFormat:@"%@/face-api/v3/group/list",Domain];
    [AINetworking PostWithURL:url Params:parameters success:^(id responseObject) {
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSString *error) {
        
    }];
}


//- (void)faceMatchMethod {
//    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
//    NSString *urlStr = [NSString stringWithFormat:@"https://aip.baidubce.com/rest/2.0/face/v3/match?access_token=%@",token];
//
//    NSArray *array = @[@{@"image":[[self p_picMethod] base64EncodedStringWithOptions:0],
//                         @"image_type":@"BASE64",
//                         @"face_type":@"LIVE",
//                         @"quality_control":@"LOW",
//                         @"liveness_control":@"HIGH"
//                         },
//                       @{@"image":[[self p_picMethod] base64EncodedStringWithOptions:0],
//                         @"image_type":@"BASE64",
//                         @"face_type":@"LIVE",
//                         @"quality_control":@"LOW",
//                         @"liveness_control":@"HIGH"
//                         }];
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    [manager POST:urlStr parameters:array progress:^(NSProgress * _Nonnull uploadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        LogData(responseObject, @"结果:");
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//
//    }];
//}
//
//- (void)faceMatchMethod1 {
//    NSArray *array = @[@{@"image":[[self p_picMethod] base64EncodedStringWithOptions:0],
//                         @"image_type":@"BASE64",
//                         @"face_type":@"LIVE",
//                         @"quality_control":@"LOW",
//                         @"liveness_control":@"HIGH"
//                         },
//                       @{@"image":[[self p_picMethod] base64EncodedStringWithOptions:0],
//                         @"image_type":@"BASE64",
//                         @"face_type":@"LIVE",
//                         @"quality_control":@"LOW",
//                         @"liveness_control":@"HIGH"
//                         }];
//    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
//
//    NSURLSession *session=[NSURLSession sharedSession];
//    NSString *urlStr = [NSString stringWithFormat:@"https://aip.baidubce.com/rest/2.0/face/v3/match?access_token=%@",token];
//    NSURL *url = [NSURL URLWithString:urlStr];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    request.HTTPMethod = @"POST";
//    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:array options:0 error:nil];
//
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
//
//        //8.解析数据
//        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//        NSLog(@"结果->%@",dict);
//    }];
//
//    //7.执行任务
//    [dataTask resume];
//}
//
////数组转为json字符串
//- (NSString *)arrayToJSONString:(NSArray *)array {
//    NSError *error = nil;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
//    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    NSString *jsonTemp = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//    return jsonTemp;
//}

- (void)body_analysisWithImage:(UIImage *)image completion:(AICompletion)completion{
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    NSDictionary *parameters = @{@"access_token":token,
                                 @"image":[[self p_imageToData:image] base64EncodedStringWithOptions:0],
                                 };
    [AINetworking PostWithURL:@"https://aip.baidubce.com/rest/2.0/image-classify/v1/body_analysis" Params:parameters success:^(id responseObject) {
//        NSLog(@"%@",responseObject);
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSString *error) {
        if (completion) {
            completion(error);
        }
    }];
}

- (void)body_attrWithImage:(UIImage *)image completion:(AICompletion)completion {
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    NSString *type = @"gender,age,lower_wear,upper_wear,headwear,glasses,upper_color,lower_color,cellphone,upper_wear_fg,upper_wear_texture,lower_wear_texture,orientation,umbrella,bag,smoke,vehicle,carrying_item,upper_cut,lower_cut,occlusion,is_human";
    NSDictionary *parameters = @{@"access_token":token,
                                 @"image":[[self p_imageToData:image] base64EncodedStringWithOptions:0],
                                 @"type":type,
                                 };
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager POST:@"https://aip.baidubce.com/rest/2.0/image-classify/v1/body_attr" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        LogData(responseObject, @"结果:");
//        if (completion) {
//            completion(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//        if (completion) {
//            completion(error);
//        }
//    }];
    [AINetworking PostWithURL:@"https://aip.baidubce.com/rest/2.0/image-classify/v1/body_attr" Params:parameters success:^(id responseObject) {
//        NSLog(@"%@",responseObject);
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSString *error) {
        if (completion) {
            completion(error);
        }
    }];
}

- (void)body_numWithImage:(UIImage *)image completion:(AICompletion)completion {
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    NSDictionary *parameters = @{@"access_token":token,
                                 @"image":[[self p_imageToData:image] base64EncodedStringWithOptions:0],
                                 //                                 @"show":@"true",
                                 };
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager POST:@"https://aip.baidubce.com/rest/2.0/image-classify/v1/body_num" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        LogData(responseObject, @"结果:");
//        if (completion) {
//            completion(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//        if (completion) {
//            completion(error);
//        }
//    }];
    [AINetworking PostWithURL:@"https://aip.baidubce.com/rest/2.0/image-classify/v1/body_num" Params:parameters success:^(id responseObject) {
//        NSLog(@"%@",responseObject);
        if (completion) {
            completion(responseObject);
        }
    } failure:^(NSString *error) {
        if (completion) {
            completion(error);
        }
    }];
}

- (void)gestureWithImage:(UIImage *)image completion:(nonnull AIGestureCompletion)completion {
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    NSDictionary *parameters = @{@"access_token":token,
                                 @"image":[[self p_imageToData:image] base64EncodedStringWithOptions:0],
                                 };
    [AINetworking PostWithURL:@"https://aip.baidubce.com/rest/2.0/image-classify/v1/gesture" Params:parameters success:^(id responseObject) {
//        NSLog(@"%@",responseObject);
        GestureType type = unkown;
        NSArray *result = responseObject[@"result"];
        if (result.count>0) {
            NSString *classname = result[0][@"classname"];
            if ([classname isEqualToString:@"One"]) {
                type = One;
            }else if ([classname isEqualToString:@"Five"]){
                type = Five;
            }else if ([classname isEqualToString:@"Fist"]){
                type = Fist;
            }else if ([classname isEqualToString:@"Ok"]){
                type = OK;
            }else if ([classname isEqualToString:@"Prayer"]){
                type = Prayer;
            }else if ([classname isEqualToString:@"Congratulation"]){
                type = Congratulation;
            }else if ([classname isEqualToString:@"Honour"]){
                type = Honour;
            }else if ([classname isEqualToString:@"Heart_single"]){
                type = Heart_single;
            }else if ([classname isEqualToString:@"Thumb_up"]){
                type = Thumb_up;
            }else if ([classname isEqualToString:@"Thumb_down"]){
                type = Thumb_down;
            }else if ([classname isEqualToString:@"ILY"]){
                type = ILY;
            }else if ([classname isEqualToString:@"Palm_up"]){
                type = Palm_up;
            }else if ([classname isEqualToString:@"Heart_1"]){
                type = Heart_1;
            }else if ([classname isEqualToString:@"Heart_2"]){
                type = Heart_2;
            }else if ([classname isEqualToString:@"Heart_3"]){
                type = Heart_3;
            }else if ([classname isEqualToString:@"Two"]){
                type = Two;
            }else if ([classname isEqualToString:@"Three"]){
                type = Three;
            }else if ([classname isEqualToString:@"Four"]){
                type = Four;
            }else if ([classname isEqualToString:@"Six"]){
                type = Six;
            }else if ([classname isEqualToString:@"Seven"]){
                type = Seven;
            }else if ([classname isEqualToString:@"Eight"]){
                type = Eight;
            }else if ([classname isEqualToString:@"Nine"]){
                type = Nine;
            }else if ([classname isEqualToString:@"Rock"]){
                type = Rock;
            }else if ([classname isEqualToString:@"Insult"]){
                type = Insult;
            }
        }
        if (completion) {
            completion(type);
        }
    } failure:^(NSString *error) {
        if (completion) {
            completion(unkown);
        }
    }];
}

/**
 图片转换成NSData

 @param image 图片
 @return NSData
 */
- (NSData *)p_imageToData:(UIImage *)image{
    NSData *data = UIImageJPEGRepresentation(image, 0.1);
    return data;
}

@end
