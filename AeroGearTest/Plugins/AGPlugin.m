//
//  AGPlugin.m
//  AeroGearTest
//
//  Created by Lucas Holmquist on 1/2/13.
//
//

#import "AGPlugin.h"
#import <Cordova/CDV.h>
#import <AeroGear/AeroGear.h>

@implementation AGPlugin

- (void) read:(CDVInvokedUrlCommand *)command {
    
    id<AGPipe> pipe;
    NSString *name = [command.arguments objectAtIndex:0];
    NSURL* baseURL = [NSURL URLWithString: [command.arguments objectAtIndex:1]];
    AGPipeline *pipeline = [AGPipeline pipeline:baseURL];
    pipe = [pipeline pipe:^(id<AGPipeConfig> config) {
        [config name:name];
        [config endpoint:[command.arguments objectAtIndex:2]];
        [config recordId:[command.arguments objectAtIndex:3]];
    }];
    
    [pipe read:^(id responseObject) {
        CDVPluginResult *pluginResult = nil;
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:responseObject];
        NSString* javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
        [self writeJavascript:javaScript];
    
    } failure:^(NSError *error) {
        CDVPluginResult *pluginResult = nil;
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION];
        NSString* javaScript = [pluginResult toErrorCallbackString:command.callbackId];
        [self writeJavascript:javaScript];
    }];
}

- (void) save:(CDVInvokedUrlCommand *)command {
    CDVPluginResult *pluginResult = nil;
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_INVALID_ACTION];
    NSString* javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    [self writeJavascript:javaScript];
}

- (void) remove:(CDVInvokedUrlCommand *)command {
    CDVPluginResult *pluginResult = nil;
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_INVALID_ACTION];
    NSString* javaScript = [pluginResult toErrorCallbackString:command.callbackId];
    [self writeJavascript:javaScript];
}


@end
