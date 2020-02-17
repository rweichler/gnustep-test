#include <Foundation/Foundation.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
    @autoreleasepool {
        NSString *wow = @"is this going to work";
        NSArray *arr = @[@1, @2];
        printf("%s\n", wow.UTF8String);
    }
    return 0;
}
