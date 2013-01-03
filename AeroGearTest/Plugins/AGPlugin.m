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
    AGPipeline *pipeline = [AGPipeline pipeline:[NSURL URLWithString:@"http://us.battle.net/api/wow/"]];
    pipe = [pipeline pipe:^(id<AGPipeConfig> config) {
        [config name:@"status"];
        [config endpoint:@"realm/status"];
    }];
    
    [pipe read:^(id responseObject) {
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:responseObject];
        NSString* javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
        [self writeJavascript:javaScript];
    
    } failure:^(NSError *error) {
        NSLog(@"An error has occured during fetch! \n%@", error);
    }];
}


@end
