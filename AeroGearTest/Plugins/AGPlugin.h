//
//  AGPlugin.h
//  AeroGearTest
//
//  Created by Lucas Holmquist on 1/2/13.
//
//

#import <Cordova/CDV.h>

@interface AGPlugin : CDVPlugin

- (void) read:(CDVInvokedUrlCommand *)command;

- (void) save:(CDVInvokedUrlCommand *)command;

- (void) remove:(CDVInvokedUrlCommand *)command;

@end
