import XCTest
import ParadigmUtilities
import ZippyJSON
import SwiftSovereignStates

final class ParadigmUtilitiesTests: XCTestCase {
    func testExample() async throws {
        let decoder:ZippyJSONDecoder = ZippyJSONDecoder()
        let smallBoy:CodableOmittable<String> = CodableOmittable<String>.init("smol", omitted: true)
        let big_boy:String = "They're going to call me Mr. Worldwide after this pops off! Aren't they?"
        let bro:TestBro = TestBro(big_boy: big_boy, number: 1, small_boy: smallBoy)
        
        try testFoundation(bro)
        try testSovereignStateInformation(decoder)
        try testUpcomingEvents(decoder)
        try testWeather(decoder)
        //await testTranslations(bro)
    }
    
    private func testFoundation(_ bro: TestBro) throws {
        let big_boy:String = bro.big_boy
        let data:Data = try JSONEncoder().encode(bro)
        let string:String = String(data: data, encoding: .utf8)!
        XCTAssert(string.elementsEqual("{\"big_boy\":\"" + big_boy + "\",\"number\":1}"), "invalid string; string=" + string)
        
        var decoded:TestBro = try ZippyJSONDecoder().decode(TestBro.self, from: data)
        XCTAssert(decoded.toString()!.elementsEqual(string))
        decoded.setOmittKeyValue(.small_boy, value: false)
        let decodedString:String = decoded.toString()!
        XCTAssert(decodedString.elementsEqual(string) == false, decodedString)
    }
    
    private func testSovereignStateInformation(_ decoder: ZippyJSONDecoder) throws {
        let response_version:Int = 1
        let anthem:NationalAnthem = NationalAnthem(mp3_url: "", sources: EventSources(sources: [EventSource(siteName: "Wikipedia: United States", url: "https://en.wikipedia.org/wiki/United_States")]))
        let capital:NationalCapital = NationalCapital(place: "Somewhere", notes: nil, sources: EventSources(sources: [EventSource(siteName: "Paradigm", url: "https://paradigm-app.com")]))
        let information:SovereignStateInformation = SovereignStateInformation(administration: ClientGovernmentAdministration(current_version: 1, all_versions: [1,2,3]),
                                                                              _static: SovereignStateStaticInformation(response_version: response_version, availabilities: nil, agriculture: nil, info: nil, legalities: nil, rankings: nil, single_values: nil, national_animals: nil, national_anthem: anthem, national_capital: capital, national_trees: nil, cia_services: nil, history: nil, wikipedia: nil, wikipedia_featured_pictures: nil, national_parks: nil, volcanoes: nil, sources: nil),
                                                                              nonstatic: nil)
        
        XCTAssert(information._static?.national_capital != nil)
        
        let data:Data = information.toString()!.data(using: .utf8)!
        let bro:SovereignStateInformation = try decoder.decode(SovereignStateInformation.self, from: data)
        XCTAssert(bro._static?.response_version == response_version)
        XCTAssert(bro._static?.national_anthem == anthem)
        XCTAssert(bro._static?.national_capital == capital)
    }
    
    private func testUpcomingEvents(_ decoder: ZippyJSONDecoder) throws {
        let event:APODEvent = APODEvent(eventDate: EventDate.getToday(), title: "test", description: nil, location: nil, imageURL: nil, sources: EventSources(sources: []), hyperlinks: nil, countries: nil, subdivisions: nil, copyright: nil, videoURL: nil)
        let data:Data = event.toData()!
        XCTAssert(GenericUpcomingEvent.parse(decoder: decoder, data: data) == event)
        
        let event_date:EventDate = EventDate(year: 2023, month: Month.january, day: 1)
        let pre_event:PreUpcomingEvent = PreUpcomingEvent(type: .movie, id: "test_movie_title", event_date: event_date, title: "Test Movie Title", tag: "Test Movie Tag", image_url: nil)
        XCTAssert(pre_event.event_date != nil)
        let dates:HomeResponseUpcomingEventsDateResponse = HomeResponseUpcomingEventsDateResponse(date: event_date, events: [pre_event])
        let test:HomeResponseUpcomingEventTypeResponse = HomeResponseUpcomingEventTypeResponse(type: .movie, date_events: [dates])
        let upcoming_events_json:String = String(data: try JSONEncoder().encode(test), encoding: .utf8)!
        XCTAssert(upcoming_events_json.elementsEqual("{\"type\":\"movie\",\"date_events\":[{\"date\":\"1-2023-01\",\"events\":[{\"id\":\"test_movie_title\",\"title\":\"Test Movie Title\",\"tag\":\"Test Movie Tag\"}]}]}"), "upcoming_events_json=" + upcoming_events_json)
        
        let pre_holiday:PreHoliday = PreHoliday(type: "fun", id: "test_holiday", name: "Test Holiday", emoji: nil)
        let holidays_near:[HomeResponseUpcomingEventHolidaysResponse] = [HomeResponseUpcomingEventHolidaysResponse(date: event_date, holidays: [pre_holiday])]
        let holidays_near_json:String = String(data: try JSONEncoder().encode(holidays_near), encoding: .utf8)!
        XCTAssert(holidays_near_json.elementsEqual("[{\"date\":\"1-2023-01\",\"holidays\":[{\"type\":\"fun\",\"id\":\"test_holiday\",\"name\":\"Test Holiday\"}]}]"), "holidays_near_json=" + holidays_near_json)
    }
    
    private func testWeather(_ decoder: ZippyJSONDecoder) throws {
        let test:[CountryEarthquakesResponse] = [
            CountryEarthquakesResponse(country: Country.united_states, subdivisions: [
                SubdivisionEarthquakesResponse(subdivision: SubdivisionsUnitedStates.minnesota, magnitudes: [
                    SovereignRegionEarthquakes(magnitude: "5.0", quakes: [
                        PreEarthquake(id: "test", place: "nowhere", city: nil)
                    ])
                ])
            ])
        ]
        let test_string:String = String(data: try JSONEncoder().encode(test), encoding: .utf8)!
        XCTAssert(test_string.elementsEqual("[{\"country\":\"united_states\",\"subdivisions\":[{\"magnitudes\":[{\"magnitude\":\"5.0\",\"quakes\":[{\"id\":\"test\",\"place\":\"nowhere\"}]}],\"subdivision\":\"united_states_minnesota\"}]}]"), "test_string=" + test_string)
    }
    
    private func testTranslations(_ bro: TestBro) async {
        //let string:String? = await bro.toString(language: Language.spanish)
        //print("ParadigmUtilitiesTests.testTranslations;string=\(string)")
        /*let translatedText:String = response.translatedText, valid:Bool = translatedText.elementsEqual("¡Me van a llamar Sr. Worldwide después de que esto salga! ¿Verdad?")
        if valid {
            print("ParadigmUtilitiesTests.testTranslations;valid == true; translatedText=" + translatedText)
        } else {
            XCTAssert(valid, "translated text did not translate correctly! (" + translatedText + ")")
        }*/
    }
}

private struct TestBro : Jsonable {
    typealias ValueKeys = TestBroValueKeys
    
    var big_boy:String
    let number:Int
    @CodableOmittable var small_boy:String?
    
    func getKeyValue(key: TestBroValueKeys) -> Any? {
        switch key {
        case .big_boy: return big_boy
        case .small_boy: return _small_boy
        }
    }
    mutating func setKeyValue<T>(key: TestBroValueKeys, value: T) {
        switch key {
        case .big_boy:
            big_boy = value as! String
            break
        case .small_boy:
            _small_boy = value as! CodableOmittable<String>
            break
        }
    }
}
private enum TestBroValueKeys : String, JsonableValueKeys {
    case big_boy
    case small_boy
    
    func isTranslatable() -> Bool {
        switch self {
        case .big_boy:
            return true
        default:
            return false
        }
    }
    func isOmittable() -> Bool {
        switch self {
        case .small_boy:
            return true
        default:
            return false
        }
    }
}
