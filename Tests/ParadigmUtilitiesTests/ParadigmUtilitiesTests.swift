import XCTest
import ParadigmUtilities
import ZippyJSON

final class ParadigmUtilitiesTests: XCTestCase {
    func testExample() throws {
        let decoder:ZippyJSONDecoder = ZippyJSONDecoder()
        try testSovereignStateInformation(decoder)
        try testUpcomingEvents(decoder)
    }
    
    private func testSovereignStateInformation(_ decoder: ZippyJSONDecoder) throws {
        let response_version:Int = 1
        let anthem:NationalAnthem = NationalAnthem(mp3URL: "", sources: EventSources(sources: [EventSource(siteName: "Wikipedia: United States", url: "https://en.wikipedia.org/wiki/United_States")]))
        let capital:NationalCapital = NationalCapital(place: "Somewhere", sources: EventSources(sources: [EventSource(siteName: "Paradigm", url: "https://paradigm-app.com")]))
        let values:[any SovereignStateInformationValue] = [
            anthem,
            capital
        ]
        let information:SovereignStateInformation = SovereignStateInformation(response_version: response_version, administration: ClientGovernmentAdministration(current_version: 1, all_versions: [1,2,3]), values: values)
        XCTAssert(information.nationalCapital != nil)
        
        let data:Data = information.toString()!.data(using: .utf8)!
        let bro:SovereignStateInformation = try decoder.decode(SovereignStateInformation.self, from: data)
        XCTAssert(bro.response_version == response_version)
        XCTAssert(bro.values.count == information.values.count)
        XCTAssert(bro.nationalAnthem == anthem)
        XCTAssert(bro.nationalCapital == capital)
    }
    
    private func testUpcomingEvents(_ decoder: ZippyJSONDecoder) throws {
        let event:APODEvent = APODEvent(eventDate: EventDate.getToday(), title: "test", description: nil, location: nil, imageURL: nil, sources: EventSources(sources: []), hyperlinks: nil, countries: nil, subdivisions: nil, copyright: nil, videoURL: nil)
        let data:Data = event.toData()!
        XCTAssert(GenericUpcomingEvent.parse(decoder: decoder, data: data) == event)
    }
}
