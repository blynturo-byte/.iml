#import <Foundation/Foundation.h>

// Dipanggil otomatis saat dylib dimuat ke proses app
__attribute__((constructor))
static void iml_init(void) {
    @autoreleasepool {
        NSString *docs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        NSString *scripts = [docs stringByAppendingPathComponent:@"imlscripts"];
        [[NSFileManager defaultManager] createDirectoryAtPath:scripts
                                  withIntermediateDirectories:YES attributes:nil error:nil];

        NSString *logPath = [docs stringByAppendingPathComponent:@"iml.log"];
        NSString *msg = [NSString stringWithFormat:@"IML loaded. Bundle: %@\n",
                         [[NSBundle mainBundle] bundleIdentifier]];
        [msg writeToFile:logPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"[IML] %@", msg);
    }
}
