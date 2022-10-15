import XCTest
import ParadigmUtilities
import ZippyJSON

final class ParadigmUtilitiesTests: XCTestCase {
    func testExample() throws {
        try testSovereignStateInformation()
    }
    
    private func testSovereignStateInformation() throws {
        let response_version:Int = 1
        let anthem:NationalAnthem = NationalAnthem(mp3URL: "", sources: EventSources(sources: [EventSource(siteName: "Wikipedia: United States", url: "https://en.wikipedia.org/wiki/United_States")]))
        let capital:NationalCapital = NationalCapital(place: "Somewhere", sources: EventSources(sources: [EventSource(siteName: "Paradigm", url: "https://paradigm-app.com")]))
        let values:[any SovereignStateInformationValue] = [
            anthem,
            capital
        ]
        let information:SovereignStateInformation = SovereignStateInformation(response_version: response_version, values: values)
        XCTAssert(information.nationalCapital != nil)
        
        let data:Data = information.toString().data(using: .utf8)!
        let bro:SovereignStateInformation = try ZippyJSONDecoder().decode(SovereignStateInformation.self, from: data)
        XCTAssert(bro.response_version == response_version)
        XCTAssert(bro.values.count == information.values.count)
        XCTAssert(bro.nationalAnthem == anthem)
        XCTAssert(bro.nationalCapital == capital)
    }
}
