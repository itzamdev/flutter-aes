#import "FlutterAesPlugin.h"
#import <flutter_aes/flutter_aes-Swift.h>

@implementation FlutterAesPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterAesPlugin registerWithRegistrar:registrar];
}
@end
