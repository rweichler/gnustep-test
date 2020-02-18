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
    self.window = [NSWindow.alloc init];

    NSAlert *alert = [[NSAlert.alloc init] autorelease];
    alert.messageText = @"Goodbye, world!";
    alert.informativeText = @"BYEEEE";

    /*
    NSButton *button = [alert addButtonWithTitle:@"Cya"];
    [button retain];
    button.frame = NSMakeRect(0, 0, 50, 50);
    printf("%s %s\n", button.description.UTF8String, button.superview.description.UTF8String);
    printf("%s\n", alert.description.UTF8String);
    */

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        printf("oidsjfaoidsjf\n");
    });

    [alert runModal];
    printf("wee\n");
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


