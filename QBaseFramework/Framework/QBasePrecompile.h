//
//  QBasePrecompile.h
//  QBaseFramework
//
//  Created by andy on 9/20/14.
//  Copyright (c) 2014 streakq. All rights reserved.
//

#ifndef QBaseFramework_QBasePrecompile_h
#define QBaseFramework_QBasePrecompile_h

/**
 *  单例宏定义 （方法一）
 */
#define Q_DEFINE_SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;

//#if (!__has_feature(objc_arc)) \
//todo:把【aa new】也放到里面
#define Q_DEFINE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}

/**
 *  打印日志
 */
CG_INLINE void QBASE_LOG (NSString *format, ...)
{
    
#if DEBUG
    va_list args;
    va_start(args,format);
    if (format != nil)
    {
        NSLogv(format, args);
    }
#endif
    
}

/**
 *  色值宏定义
 */
#define Q_RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define Q_RGB(r,g,b)    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

/**
 *  字体大小
 */
#define Q_FONT_SIZE_DEFAULT(size) [UIFont systemFontOfSize:size]
#define Q_FONT_SIZE_BOLD(size)    [UIFont boldSystemFontOfSize:size]

/**
 *  当前系统版本
 */
#define Q_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

/**
 *  导航条高度
 */
#define Q_STATUSBAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height

/**
 *  设备屏幕高度
 */
#define Q_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

/**
 *  设备屏幕宽度
 */
#define Q_SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width

/**
 *  满屏幕大小
 */
#define Q_SCREEN_BOUNDS [[UIScreen mainScreen] bounds]

/**
 *  当前版本支持最低系统配置
 */
#define Q_LEAST_DEVICE_VERSION(x) SYSTEM_VERSION >= x ? 1 : 0

/**
 *  简写NSFileManager
 */
#define Q_FILE_MANAGER ([NSFileManager defaultManager])

/**
 *  简写NSUserDefaults
 */
#define Q_USER_DEFAULT ([NSUserDefaults standardUserDefaults])

/**
 *  沙盒路径
 */
#define Q_PATH_SANDBOX ( NSHomeDirectory() )
#define Q_PATH_DOCUMENTS ( NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] )
#define Q_PATH_LIBRARY   ( NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0] )
#define Q_PATH_TMP     ( NSTemporaryDirectory() )

/**
 *  自定义沙盒路径
 */
#define P_PATH_FORMAT(main_path,sub_path) ( sub_path==nil ? main_path : [NSString stringWithFormat:@"%@/%@", main_path, sub_path] )
#define Q_PATH_FORMAT_SANDBOX(sub_path)   P_PATH_FORMAT(PATH_SANDBOX, sub_path)
#define Q_PATH_FORMAT_DOCUMENTS(sub_path) P_PATH_FORMAT(PATH_LIBRARY, sub_path)
#define Q_PATH_FORMAT_LIBRARY(sub_path)   P_PATH_FORMAT(PATH_LIBRARY, sub_path)
#define Q_PATH_FORMAT_TMP(sub_path)       P_PATH_FORMAT(PATH_TMP, sub_path)

/**
 *  资源文件路径
 */
#define Q_PATH_RESOURCE(resource, type) \
[[NSBundle mainBundle] pathForResource:resource ofType:type]

#endif
