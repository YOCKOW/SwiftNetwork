/***************************************************************************************************
 URL+HostTests.swift
   © 2018 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 **************************************************************************************************/
 
import XCTest
@testable import Network

class URLHostTests: XCTestCase {
  func testInitialization() {
    let url1 = URL(string:"http://www.example.com/")!
    let url2 = URL(string:"http://[::ffff:127.0.0.1]/")!
    
    XCTAssertEqual(url1.hostComponent, URL.Host(string:"www.example.com."))
    XCTAssertEqual(url2.hostComponent, URL.Host(string:"127.0.0.1"))
  }
  
  static var allTests = [
    ("testInitialization", testInitialization),
  ]
}




