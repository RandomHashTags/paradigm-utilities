import XCTest
import ParadigmUtilities
import SwiftSovereignStates

final class ParadigmUtilitiesTests: XCTestCase {
    func testExample() async throws {
        let decoder:JSONDecoder = JSONDecoder()
        let smallBoy:CodableOmittable<String> = CodableOmittable<String>.init("smol", omitted: true)
        let big_boy:String = "They're going to call me Mr. Worldwide after this pops off! Aren't they?"
        let bro:TestBro = TestBro(big_boy: big_boy, number: 1, small_boy: smallBoy)
        
        try testFoundation(bro)
        try testSovereignStateInformation(decoder)
        try testUpcomingEvents(decoder)
        try testWeather(decoder)
        try test_home_responses(decoder)
        //await testTranslations(bro)
        
        if #available(macOS 13.0, *) {
            try await test_benchmarks()
        } else {
            print("ParadigmUtilitiesTests;failed to execute benchmarks due to outdated macOS version (less than 13.0)")
        }
    }
    
    private func testFoundation(_ bro: TestBro) throws {
        let big_boy:String = bro.big_boy
        let data:Data = try JSONEncoder().encode(bro)
        let string:String = String(data: data, encoding: .utf8)!
        XCTAssert(string.elementsEqual("{\"big_boy\":\"" + big_boy + "\",\"number\":1}"), "invalid string; string=" + string)
        
        var decoded:TestBro = try JSONDecoder().decode(TestBro.self, from: data)
        XCTAssert(decoded.toString()!.elementsEqual(string))
        decoded.setOmittableValue(.small_boy, value: false)
        let decodedString:String = decoded.toString()!
        XCTAssert(!decodedString.elementsEqual(string), decodedString)
        
        let um:CodableOmittable<String>? = bro.getOmittable(.small_boy)
        XCTAssert(um != nil, "testFoundation; um == nil")
        XCTAssert(um?.wrappedValue?.elementsEqual("smol") ?? false)
        um?.wrappedValue = nil
        XCTAssert(um?.wrappedValue == nil)
        XCTAssert(bro.small_boy == nil)
    }
    
    private func testSovereignStateInformation(_ decoder: JSONDecoder) throws {
        let response_version:Int = 1
        let anthem:NationalAnthem = NationalAnthem(mp3_url: "", sources: EventSources(sources: [EventSource(name: "Wikipedia: United States", url: "https://en.wikipedia.org/wiki/United_States")]))
        let capital:NationalCapital = NationalCapital(place: "Somewhere", notes: nil, sources: EventSources(sources: [EventSource(name: "Paradigm", url: "https://paradigm-app.com")]))
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
    
    private func testUpcomingEvents(_ decoder: JSONDecoder) throws {
        let event_image_url_suffix:String = "2302/Rcw58_Selby_960.jpg", event_image_url:String = "https://apod.nasa.gov/apod/image/" + event_image_url_suffix
        let today:EventDate = EventDate.today, title:String = "test"
        let apod_event:APODEvent = APODEvent(event_date: today, title: title, description: nil, location: nil, image_url: event_image_url, sources: EventSources(sources: []), hyperlinks: nil, countries: nil, subdivisions: nil, copyright: nil, video_url: nil)
        XCTAssert(apod_event.image_url!.elementsEqual(event_image_url_suffix), "apod_event.image_url=" + (apod_event.image_url ?? "nil"))
        let data:Data = apod_event.toData()!
        XCTAssert(GenericUpcomingEvent.parse(decoder: decoder, data: data) == apod_event, String(data: data, encoding: .utf8)!)
        apod_event.image_url = event_image_url
        XCTAssert(apod_event.image_url!.elementsEqual(event_image_url_suffix), "apod_event.image_url=" + (apod_event.image_url ?? "nil"))
        let apod_pre_event:PreUpcomingEvent = apod_event.to_pre_upcoming_event(tag: "")
        XCTAssert(apod_pre_event.image_url!.elementsEqual(event_image_url_suffix), "apod_pre_event.image_url=" + (apod_pre_event.image_url ?? "nil"))
        
        let event_date:EventDate = EventDate(year: 2023, month: Month.january, day: 1)
        let movie_pre_event:PreUpcomingEvent = PreUpcomingEvent(type: .movie, id: "test_movie_title", event_date: event_date, title: "Test Movie Title", tag: "Test Movie Tag", image_url: nil)
        XCTAssert(movie_pre_event.event_date != nil)
        let dates:UpcomingEventTypeDateEvents = UpcomingEventTypeDateEvents(date: event_date, events: [movie_pre_event])
        let test:UpcomingEventTypeEvents = UpcomingEventTypeEvents(type: .movie, date_events: [dates])
        let upcoming_events_json:String = String(data: try JSONEncoder().encode(test), encoding: .utf8)!
        XCTAssert(upcoming_events_json.elementsEqual("{\"type\":\"movie\",\"date_events\":[{\"date\":\"1-2023-01\",\"events\":[{\"id\":\"test_movie_title\",\"title\":\"Test Movie Title\",\"tag\":\"Test Movie Tag\"}]}]}"), "upcoming_events_json=" + upcoming_events_json)
        
        let pre_holiday:PreHoliday = PreHoliday(type: "fun", id: "test_holiday", name: "Test Holiday", emoji: nil)
        let holidays_near:[UpcomingEventDateHolidays] = [UpcomingEventDateHolidays(date: event_date, holidays: [pre_holiday])]
        let holidays_near_json:String = String(data: try JSONEncoder().encode(holidays_near), encoding: .utf8)!
        XCTAssert(holidays_near_json.elementsEqual("[{\"date\":\"1-2023-01\",\"holidays\":[{\"type\":\"fun\",\"id\":\"test_holiday\",\"name\":\"Test Holiday\"}]}]"), "holidays_near_json=" + holidays_near_json)
    }
    
    private func testWeather(_ decoder: JSONDecoder) throws {
    }
    
    private func test_home_responses(_ decoder: JSONDecoder) throws {
        let encoder:JSONEncoder = JSONEncoder()
        
        let countries:HomeResponseCountries = HomeResponseCountries(filters: nil)
        
        let government:HomeResponseGovernment = HomeResponseGovernment(recent_activity: [])
        let news:HomeResponseNews = HomeResponseNews(regional: [])
        let stock_market:HomeResponseStockMarket? = nil
        
        let upcoming_events_holidays_near:[UpcomingEventDateHolidays] = [
            UpcomingEventDateHolidays(date: EventDate(year: 2023, month: Month.january, day: 1), holidays: [
                PreHoliday(type: "test", id: "test_holiday", name: "Test Holiday", emoji: nil)
            ])
        ]
        let upcoming_events:HomeResponseUpcomingEvents = HomeResponseUpcomingEvents(holidays_near: upcoming_events_holidays_near, events: nil, movie_production_companies: nil)
        
        let weather_alerts:[CountryWeatherEvents] = [
            CountryWeatherEvents(country: Country.united_states, subdivisions: [
                SubdivisionWeatherEvents(subdivision: SubdivisionsUnitedStates.minnesota.wrapped(), events: [
                    WeatherEvent(type: .blizzard_warning, defcon: 3)
                ])
            ])
        ]
        let weather_earthquakes:[CountryEarthquakes] = [
            CountryEarthquakes(country: Country.united_states, subdivisions: [
                SubdivisionEarthquakes(subdivision: SubdivisionsUnitedStates.minnesota, magnitudes: [
                    PreEarthquakeMagnitude(mag: "5.0", quakes: [
                        PreEarthquake(id: "mn3948u50294", place: "26km W of Rochester", city: CitiesUnitedStatesMinnesota.rochester)
                    ])
                ])
            ])
        ]
        let weather_natural_events:NaturalWeatherEvents = NaturalWeatherEvents(
            severe_storms: [
                CountryNaturalWeatherEvents(country: Country.united_states, events: [
                    PreNaturalWeatherEvent(id: "az98345", place: "Alaska", tag: nil, country: Country.united_states, subdivision: SubdivisionsUnitedStates.alaska)
                ])
            ],
            volcanoes: [
                
            ],
            wildfires: [
                
            ])
        let weather:HomeResponseWeather = HomeResponseWeather(alerts: weather_alerts, earthquakes: weather_earthquakes, natural_events: weather_natural_events)
        
        let response:HomeResponse = HomeResponse(countries: countries, government: government, news: news, stock_market: stock_market, upcoming_events: upcoming_events, weather: weather)
        let response_data:Data = try encoder.encode(response)
        let response_string:String = String(data: response_data, encoding: .utf8)!
        let target_response_string:String = """
{"upcoming_events":{"holidays_near":[{"date":"1-2023-01","holidays":[{"type":"test","id":"test_holiday","name":"Test Holiday"}]}]},"weather":{"natural_events":{"severe_storms":[{"country":"united_states","events":[{"place":"Alaska","id":"az98345","country":"united_states","subdivision":"united_states-alaska"}]}],"volcanoes":[],"wildfires":[]},"alerts":[{"country":"united_states","subdivisions":[{"subdivision":"united_states-minnesota","events":[{"type":"blizzard_warning","defcon":3}]}]}],"earthquakes":[{"country":"united_states","subdivisions":[{"magnitudes":[{"mag":"5.0","quakes":[{"id":"mn3948u50294","place":"26km W of Rochester","city":"united_states-minnesota-rochester"}]}],"subdivision":"united_states-minnesota"}]}]}}
"""
        //print("response_string=" + response_string)
        XCTAssert(response_string.elementsEqual(target_response_string), "response_string=" + response_string)
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
    
    @available(macOS 13.0, *)
    private func test_benchmarks() async throws {
    }
    private func get_local_data(at path: String) -> Data? {
        let url:URL = URL(fileURLWithPath: path)
        return try? Data.init(contentsOf: url)
    }
    
    @available(macOS 13.0, *)
    private func benchmark(key: String, _ code: @escaping () async throws -> Void) async throws {
        let iteration_count:Int = 100
        let clock:ContinuousClock = ContinuousClock()
        let _:Duration = try await clock.measure(code)
        var timings:[Int64] = [Int64]()
        timings.reserveCapacity(iteration_count)
        for _ in 1...iteration_count {
            let result:Duration = try await clock.measure(code)
            let attoseconds:Int64 = result.components.attoseconds
            let nanoseconds:Int64 = attoseconds / 1_000_000_000
            timings.append(nanoseconds)
        }
        timings = timings.sorted(by: { $0 < $1 })
        let median:Int64 = timings[timings.count/2]
        let sum:Int64 = timings.reduce(0, +)
        let average:Double = Double(sum) / Double(timings.count)
        let key:String = key + (1...(65-key.count)).map({ _ in " " }).joined()
        
        let formatter:NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 20
        
        let average_time_elapsed:String = formatter.string(for: average)! + "ns"
        let minimum_time_elapsed:String = formatter.string(for: timings.first!)! + "ns"
        let maximum_time_elapsed:String = formatter.string(for: timings.last!)! + "ns"
        let median_time_elapsed:String = formatter.string(for: median)! + "ns"
        let total_time_elapsed:String = formatter.string(for: sum)! + "ns"
        
        print("ParadigmUtilitiesTests;benchmark( " + key + "| min=" + minimum_time_elapsed + " | max=" + maximum_time_elapsed + " | median=" + median_time_elapsed + " | average=" + average_time_elapsed + " | total=" + total_time_elapsed)
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
    
    var is_translatable : Bool {
        switch self {
        case .big_boy:
            return true
        default:
            return false
        }
    }
    var is_omittable : Bool {
        switch self {
        case .small_boy:
            return true
        default:
            return false
        }
    }
}
