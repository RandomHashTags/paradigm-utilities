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
        
        var decoded:TestBro = try ZippyJSONDecoder().decode(TestBro.self, from: data)
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
    
    private func testSovereignStateInformation(_ decoder: ZippyJSONDecoder) throws {
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
    
    private func testUpcomingEvents(_ decoder: ZippyJSONDecoder) throws {
        let event:APODEvent = APODEvent(event_date: EventDate.getToday(), title: "test", description: nil, location: nil, image_url: nil, sources: EventSources(sources: []), hyperlinks: nil, countries: nil, subdivisions: nil, copyright: nil, video_url: nil)
        let data:Data = event.toData()!
        let event_string:String = String(data: data, encoding: .utf8)!
        XCTAssert(GenericUpcomingEvent.parse(decoder: decoder, data: data) == event, event_string)
        
        let event_date:EventDate = EventDate(year: 2023, month: Month.january, day: 1)
        let pre_event:PreUpcomingEvent = PreUpcomingEvent(type: .movie, id: "test_movie_title", event_date: event_date, title: "Test Movie Title", tag: "Test Movie Tag", image_url: nil)
        XCTAssert(pre_event.event_date != nil)
        let dates:UpcomingEventTypeDateEvents = UpcomingEventTypeDateEvents(date: event_date, events: [pre_event])
        let test:UpcomingEventTypeEvents = UpcomingEventTypeEvents(type: .movie, date_events: [dates])
        let upcoming_events_json:String = String(data: try JSONEncoder().encode(test), encoding: .utf8)!
        XCTAssert(upcoming_events_json.elementsEqual("{\"type\":\"movie\",\"date_events\":[{\"date\":\"1-2023-01\",\"events\":[{\"id\":\"test_movie_title\",\"title\":\"Test Movie Title\",\"tag\":\"Test Movie Tag\"}]}]}"), "upcoming_events_json=" + upcoming_events_json)
        
        let pre_holiday:PreHoliday = PreHoliday(type: "fun", id: "test_holiday", name: "Test Holiday", emoji: nil)
        let holidays_near:[UpcomingEventDateHolidays] = [UpcomingEventDateHolidays(date: event_date, holidays: [pre_holiday])]
        let holidays_near_json:String = String(data: try JSONEncoder().encode(holidays_near), encoding: .utf8)!
        XCTAssert(holidays_near_json.elementsEqual("[{\"date\":\"1-2023-01\",\"holidays\":[{\"type\":\"fun\",\"id\":\"test_holiday\",\"name\":\"Test Holiday\"}]}]"), "holidays_near_json=" + holidays_near_json)
    }
    
    private func testWeather(_ decoder: ZippyJSONDecoder) throws {
    }
    
    private func test_home_responses(_ decoder: ZippyJSONDecoder) throws {
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
                    WeatherEvent(id: "blizzardwarning", event: "Blizzard Warning", defcon: 3)
                ])
            ])
        ]
        let weather_earthquakes:[CountryEarthquakes] = [
            CountryEarthquakes(country: Country.united_states, magnitudes: [
                PreEarthquakeMagnitude(mag: "5.0", quakes: [
                    PreEarthquake(id: "mn3948u50294", place: "Rochester, Minnesota")
                ])
            ])
        ]
        let weather:HomeResponseWeather = HomeResponseWeather(alerts: weather_alerts, earthquakes: weather_earthquakes, natural_events: nil)
        
        let response:HomeResponse = HomeResponse(countries: countries, government: government, news: news, stock_market: stock_market, upcoming_events: upcoming_events, weather: weather)
        let response_data:Data = try encoder.encode(response)
        let response_string:String = String(data: response_data, encoding: .utf8)!
        let target_response_string:String = """
{"upcoming_events":{"holidays_near":[{"date":"1-2023-01","holidays":[{"type":"test","id":"test_holiday","name":"Test Holiday"}]}]},"weather":{"alerts":[{"country":"united_states","subdivisions":[{"subdivision":"united_states_minnesota","events":[{"id":"blizzardwarning","event":"Blizzard Warning","defcon":3}]}]}],"earthquakes":[{"country":"united_states","magnitudes":[{"mag":"5.0","quakes":[{"id":"mn3948u50294","place":"Rochester, Minnesota"}]}]}]}}
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
        guard let data:Data = get_local_data(at: "/Users/randomhashtags/Downloads/api_tvmaze_schedule_full.json") else { return }
        let zippy_decoder:ZippyJSONDecoder = ZippyJSONDecoder()
        
        try await benchmark(key: "zippy_json_decode_array_tvshowepisode", {
            let bruh:[TVShowEpisode]? = try? zippy_decoder.decode([TVShowEpisode].self, from: data)
        })
        try await benchmark(key: "zippy_json_decode_set_tvshowepisode", {
            let bruh:Set<TVShowEpisode>? = try? zippy_decoder.decode(Set<TVShowEpisode>.self, from: data)
        })
        try await benchmark(key: "zippy_json_decode_set_fixedtvshowepisode", {
            let bruh:Set<FixedTVShowEpisode>? = try? zippy_decoder.decode(Set<FixedTVShowEpisode>.self, from: data)
        })
        
        let apple_decoder:JSONDecoder = JSONDecoder()
        try await benchmark(key: "apple_json_decode_array_tvshowepisode", {
            let bruh:[TVShowEpisode]? = try? apple_decoder.decode([TVShowEpisode].self, from: data)
        })
        try await benchmark(key: "apple_json_decode_set_tvshowepisode", {
            let bruh:Set<TVShowEpisode>? = try? apple_decoder.decode(Set<TVShowEpisode>.self, from: data)
        })
        try await benchmark(key: "apple_json_decode_set_fixedtvshowepisode", {
            let bruh:Set<FixedTVShowEpisode>? = try? apple_decoder.decode(Set<FixedTVShowEpisode>.self, from: data)
        })
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

public struct FixedTVShowEpisode : Jsonable {
    public let id:Int, name:String, season:Int, number:Int?, runtime:Int?, summary:String?, image:FixedTVShowImage?, airstamp:String, airdate:String, airtime:String
    public let _embedded:FixedTVShowEpisodeEmbedded?
}
public struct FixedTVShowImage : Jsonable {
    public let medium:String, original:String
}
public struct FixedTVShowEpisodeEmbedded : Jsonable {
    public let show:FixedTVShowInfo?
}
public struct FixedTVShowInfo : Jsonable {
    public let id:Int, name:String, type:String, language:String?, genres:Set<String>, image:FixedTVShowImage?, summary:String?, status:String, url:String
    public let runtime:Int?, averageRuntime:Int?, weight:Int
    public let premiered:String, ended:String?, schedule:FixedTVShowSchedule
    public let _embedded:FixedTVShowInfoEmbedded?
    public let officialSite:String?, webChannel:FixedTVShowWebChannel?, externals:FixedTVShowExternals?, network:FixedTVShowNetwork?
    public let updated:Int64
}
public struct FixedTVShowNetwork : Jsonable {
    public let id:Int, name:String, country:FixedTVShowCountry?, officialSite:String?
}
public struct FixedTVShowCountry : Jsonable {
    public let name:String, code:String, timezone:String
}
public struct FixedTVShowExternals : Jsonable {
    public let tvrage:Int?, thetvdb:Int?, imdb:String?
}
public struct FixedTVShowInfoEmbedded : Jsonable {
    public let episodes:Set<FixedTVShowEpisode>?, cast:Set<FixedTVShowCast>?, akas:Set<FixedTVShowAlias>?
}
public struct FixedTVShowPerson : Jsonable {
    public let name:String, birthday:String?, deathday:String?, imageURL:String?, country:FixedTVShowCountry?, image:FixedTVShowImage?, url:String
}
public struct FixedTVShowSchedule : Jsonable {
    public let time:String, days:Set<String>
}
public struct FixedTVShowWebChannel : Jsonable {
    public let id:Int, name:String, country:FixedTVShowCountry?, officialSite:String?
}
public struct FixedTVShowAlias : Jsonable {
    public let name:String, country:FixedTVShowCountry?
}
public struct FixedTVShowCast : Jsonable {
    public let person:FixedTVShowPerson?
    public let character:FixedTVShowPerson?
    public let `self`:Bool, voice:Bool
}
