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
        let information:SovereignStateInformation = SovereignStateInformation(response_version: response_version, administration: ClientGovernmentAdministration(current_version: 1, all_versions: [1,2,3]),
                                                                              _static: SovereignStateStaticInformation(availabilities: nil, agriculture: nil, info: nil, legalities: nil, rankings: nil, single_values: nil, national_animals: nil, national_anthem: anthem, national_capital: capital, national_trees: nil, cia_values: nil, history: nil, wikipedia: nil, wikipedia_featured_pictures: nil, national_parks: nil, volcanoes: nil, sources: nil),
                                                                              nonstatic: nil)
        XCTAssert(information._static?.national_capital != nil)
        
        let data:Data = information.toString()!.data(using: .utf8)!
        let bro:SovereignStateInformation = try decoder.decode(SovereignStateInformation.self, from: data)
        XCTAssert(bro.response_version == response_version)
        XCTAssert(bro._static?.national_anthem == anthem)
        XCTAssert(bro._static?.national_capital == capital)
    }
    
    private func testUpcomingEvents(_ decoder: ZippyJSONDecoder) throws {
        let event:APODEvent = APODEvent(eventDate: EventDate.getToday(), title: "test", description: nil, location: nil, imageURL: nil, sources: EventSources(sources: []), hyperlinks: nil, countries: nil, subdivisions: nil, copyright: nil, videoURL: nil)
        let data:Data = event.toData()!
        XCTAssert(GenericUpcomingEvent.parse(decoder: decoder, data: data) == event)
    }
}
