//
//  JsObjCModel.m
//  WebViewJavascript
//
//  Created by 谈Xx on 16/3/18.
//  Copyright © 2016年 谈Xx. All rights reserved.
//

#import "JsObjCModel.h"

@implementation JsObjCModel


- (void)dealloc
{
    NSLog(@"dealloc - model");
}

// JS调用了callSystemCamera
- (void)callSystemCamera {
    NSLog(@"JS调用了OC的方法，调起系统相册");
    
    // JS调用后OC后，可以传一个回调方法的参数，进行回调JS
    JSValue *jsFunc = self.jsContext[@"jsFunc"];
    [jsFunc callWithArguments:nil];
}

// 指定参数的用法
// 在JS中调用时，函数名应该为showAlertMsg(arg1, arg2)
- (void)showAlert:(NSString *)title msg:(NSString *)msg
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *a = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [a show];
    });
    
}

- (void)share:(NSDictionary *)shareString
{
    NSLog(@"share:%@", shareString);
    dispatch_async(dispatch_get_main_queue(), ^{
        // 更UI
        
        self.input = [SafeKBInputView shareKBInputViewWithTypeABC];
        [self.input show];
        self.input.InputViewDelegate = self.webEngine;
    });
//    // 分享成功回调js的方法shareCallback
//    JSValue *shareCallback = self.jsContext[@"shareCallback"];
//    [shareCallback callWithArguments:nil];
}

@end
