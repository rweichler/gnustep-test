#import <Cocoa/Cocoa.h>
#include <stdio.h>

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (assign) NSWindow *window;
@end

@implementation AppDelegate
@synthesize window;

-(void)dealloc
{
    [super dealloc];
}

-(void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    printf("app did finish launching\n");
}

@end

int main(int argc, char *argv[])
{
    printf("hi\n");
    @autoreleasepool {
        AppDelegate *delegate = [AppDelegate.alloc init];

        [NSApplication sharedApplication];
        [NSApp setDelegate:delegate];
        return NSApplicationMain(argc, (const char **)argv);
    }
}


