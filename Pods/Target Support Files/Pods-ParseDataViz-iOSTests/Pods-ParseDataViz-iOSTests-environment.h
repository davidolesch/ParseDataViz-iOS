
// To check if a library is compiled with CocoaPods you
// can use the `COCOAPODS` macro definition which is
// defined in the xcconfigs so it is available in
// headers also when they are imported in the client
// project.


// Expecta
#define COCOAPODS_POD_AVAILABLE_Expecta
#define COCOAPODS_VERSION_MAJOR_Expecta 0
#define COCOAPODS_VERSION_MINOR_Expecta 4
#define COCOAPODS_VERSION_PATCH_Expecta 0

// Expecta+Snapshots
#define COCOAPODS_POD_AVAILABLE_Expecta_Snapshots
#define COCOAPODS_VERSION_MAJOR_Expecta_Snapshots 1
#define COCOAPODS_VERSION_MINOR_Expecta_Snapshots 3
#define COCOAPODS_VERSION_PATCH_Expecta_Snapshots 2

// FBSnapshotTestCase
#define COCOAPODS_POD_AVAILABLE_FBSnapshotTestCase
#define COCOAPODS_VERSION_MAJOR_FBSnapshotTestCase 1
#define COCOAPODS_VERSION_MINOR_FBSnapshotTestCase 6
#define COCOAPODS_VERSION_PATCH_FBSnapshotTestCase 0

// OCMock
#define COCOAPODS_POD_AVAILABLE_OCMock
#define COCOAPODS_VERSION_MAJOR_OCMock 3
#define COCOAPODS_VERSION_MINOR_OCMock 1
#define COCOAPODS_VERSION_PATCH_OCMock 2

// OHHTTPStubs
#define COCOAPODS_POD_AVAILABLE_OHHTTPStubs
#define COCOAPODS_VERSION_MAJOR_OHHTTPStubs 3
#define COCOAPODS_VERSION_MINOR_OHHTTPStubs 1
#define COCOAPODS_VERSION_PATCH_OHHTTPStubs 11

// OHHTTPStubs/Core
#define COCOAPODS_POD_AVAILABLE_OHHTTPStubs_Core
#define COCOAPODS_VERSION_MAJOR_OHHTTPStubs_Core 3
#define COCOAPODS_VERSION_MINOR_OHHTTPStubs_Core 1
#define COCOAPODS_VERSION_PATCH_OHHTTPStubs_Core 11

// Specta
#define COCOAPODS_POD_AVAILABLE_Specta
#define COCOAPODS_VERSION_MAJOR_Specta 0
#define COCOAPODS_VERSION_MINOR_Specta 5
#define COCOAPODS_VERSION_PATCH_Specta 0

// Debug build configuration
#ifdef DEBUG

  // KIF
  #define COCOAPODS_POD_AVAILABLE_KIF
  #define COCOAPODS_VERSION_MAJOR_KIF 3
  #define COCOAPODS_VERSION_MINOR_KIF 2
  #define COCOAPODS_VERSION_PATCH_KIF 1

  // KIF/XCTest
  #define COCOAPODS_POD_AVAILABLE_KIF_XCTest
  #define COCOAPODS_VERSION_MAJOR_KIF_XCTest 3
  #define COCOAPODS_VERSION_MINOR_KIF_XCTest 2
  #define COCOAPODS_VERSION_PATCH_KIF_XCTest 1

#endif
