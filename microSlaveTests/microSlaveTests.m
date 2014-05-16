//
//  microSlaveTests.m
//  microSlaveTests
//
//  Created by Federico Brandani on 22/04/14.
//  Copyright (c) 2014 Eshva. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppController.h"

@interface microSlaveTests : XCTestCase

@end

@implementation microSlaveTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFilesAreShown
{
    //XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
    //XCTAssertNotNil((id)[AppController areHiddenFilesShown]);
    NSString*result=[NSString stringWithFormat:@"%hhd",[AppController areHiddenFilesShown]];
    XCTAssertNotNil(result);
}
-(void)testSetFilesHidden
{
    XCTAssertFalse([AppController setHiddenFilesShown:NO]);
}
-(void)testSetFilesShown
{
    XCTAssertTrue([AppController setHiddenFilesShown:YES]);
}
@end
