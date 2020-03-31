/* *************************************************************************************************
 HTTPETagTests.swift
   © 2017-2018 YOCKOW.
     Licensed under MIT License.
     See "LICENSE.txt" for more information.
 ************************************************************************************************ */

import XCTest
@testable import NetworkGear

final class HTTPETagTests: XCTestCase {
  func test_initialization() {
    XCTAssertNil(HTTPETag("unquoted"))
    XCTAssertEqual(HTTPETag("\"STRONG\""), .strong("STRONG"))
    XCTAssertEqual(HTTPETag("W/\"WEAK\""), .weak("WEAK"))
    XCTAssertEqual(HTTPETag("*"), .any)
  }
  
  func test_comparison() {
    let strong = HTTPETag("\"HTTPETag\"")!
    let weak = HTTPETag("W/\"HTTPETag\"")!
    
    XCTAssertTrue(strong =~ weak)
    XCTAssertFalse(strong == weak)
  }
  
  func test_list() {
    let trial = { (string:String, expectedError:HTTPETagParseError) -> Void in
      do {
        _ = try HTTPETagList(string)
      } catch {
        guard case let parseError as HTTPETagParseError = error else {
          XCTFail("Unexpected Error was thrown.")
          return
        }
        XCTAssertEqual(expectedError, parseError,
                       "Expected Error: \(expectedError); Actual Error: \(parseError)")
      }
    }
    
    trial(", \"A\"", .extraComma)
    trial("\"A\", , \"B\"", .extraComma)
    
    trial("?", .unexpectedCharacter)
    trial("W-\"A\"", .unexpectedCharacter)
    trial("W/'A'", .unexpectedCharacter)
    
    trial("\"", .unterminatedTag)
    trial("W/\"ABCDEFGHIJKLMN", .unterminatedTag)
    trial("W/\"ABCDEFGHIJKLMN\\\"", .unterminatedTag)
    
    do {
      let list = try HTTPETagList("\"A\", \"B\", W/\"C\",  \"D\" ")
      guard case .list(let array) = list else {
        XCTFail("Unexpected Error")
        return
      }
      XCTAssertEqual(array[0], .strong("A"))
      XCTAssertEqual(array[1], .strong("B"))
      XCTAssertEqual(array[2], .weak("C"))
      XCTAssertEqual(array[3], .strong("D"))
      
      XCTAssertTrue(list.contains(.strong("A")))
      XCTAssertTrue(list.contains(.weak("C")))
      XCTAssertTrue(list.contains(.strong("C"), weakComparison:true))
      XCTAssertTrue(list.contains(.weak("D"), weakComparison:true))
    } catch {
      XCTFail("Unexpected Error: \(error)")
    }
  }
  
  public func test_headerField() {
    let eTag1 = HTTPETag("\"SomeETag\"")!
    let eTag2 = HTTPETag("W/\"SomeWeakETag\"")!

    var eTagField = HTTPETagHeaderFieldDelegate(eTag1)
    XCTAssertEqual(type(of:eTagField).name, .eTag)
    XCTAssertEqual(eTagField.value.rawValue, eTag1.description)

    eTagField.source = eTag2
    XCTAssertEqual(eTagField.value.rawValue, eTag2.description)

    XCTAssertEqual(type(of:eTagField).type, .single)

    var ifMatchField = IfMatchHTTPHeaderFieldDelegate(.list([eTag1]))
    ifMatchField.append(eTag2)
    XCTAssertEqual(type(of:ifMatchField).name, .ifMatch)
    XCTAssertEqual(ifMatchField.value.rawValue, "\(eTag1.description), \(eTag2.description)")
    XCTAssertEqual(type(of:ifMatchField).type, .appendable)

    var ifNoneMatchField = IfMatchHTTPHeaderFieldDelegate(.list([eTag1]))
    ifNoneMatchField.append(eTag2)
    XCTAssertEqual(type(of:ifNoneMatchField).name, .ifMatch)
    XCTAssertEqual(ifNoneMatchField.value.rawValue, "\(eTag1.description), \(eTag2.description)")
    XCTAssertEqual(type(of:ifNoneMatchField).type, .appendable)
  }
}

