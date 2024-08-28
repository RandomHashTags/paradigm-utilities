import XCTest
import ParadigmUtilities
import SwiftSovereignStates

final class ParadigmUtilitiesTests : XCTestCase {
    func testExample() async throws {
        //await testTranslations(bro)
        
        try await test_benchmarks()
    }
    
    func test_foundation() throws {
        let bruh:String = "They're going to call me Mr. Worldwide after this pops off! Aren't they?"
        let bro:TestBro = TestBro(big_boy: bruh, number: 1)
        
        let big_boy:String = bro.big_boy
        let data:Data = try ParadigmUtilities.json_encoder.encode(bro)
        let string:String = String(data: data, encoding: .utf8)!
        XCTAssertEqual(string, "{\"big_boy\":\"" + big_boy + "\",\"number\":1}")
        
        var decoded:TestBro = try ParadigmUtilities.json_decoder.decode(TestBro.self, from: data)
        XCTAssertEqual(decoded.toString(), string)
    }
    
    func test_cache() {
        let api_version:APIVersion = APIVersion.v1
        let test_cache:ParadigmNSCache<AnyHashable, String> = ParadigmCache.get_or_load_cache(api_version: api_version, type: ParadigmCacheType.shared_instances)
        let string_1:String = test_cache.get_or_insert("test_1") {
            return "TEST_BRO_1"
        }
        let string_2:String = test_cache.get_or_insert("test_1") {
            return "TEST_BRO_2"
        }
        XCTAssertEqual(string_1, string_2)
        XCTAssertEqual(test_cache["test_1"], "TEST_BRO_1")
        test_cache["test_1"] = string_2
        test_cache["test_2"] = string_1
        XCTAssertEqual(test_cache.count, 2)
        test_cache.remove_value(for_key: "test_2")
        XCTAssertEqual(test_cache.count, 1)
        test_cache.remove_all()
        XCTAssertEqual(test_cache.count, 0)
        ParadigmCache.remove_all(api_version: api_version, type: ParadigmCacheType.shared_instances)
        
        let shared_instances_cache:ParadigmNSCache<AnyHashable, any ParadigmSharedInstance> = ParadigmCache.get_shared_instances_cache()
        XCTAssertEqual(shared_instances_cache.count, 0)
        let _:AsyncTask = AsyncTask.shared
        XCTAssertEqual(shared_instances_cache.count, 1)
        let _:AsyncTask = AsyncTask.shared
        let _:AsyncTask = AsyncTask.get(identifier: ParadigmSharedInstanceIdentifier.async_task)
        XCTAssertEqual(shared_instances_cache.count, 1)
        AsyncTask.shared.remove()
        XCTAssertEqual(shared_instances_cache.count, 0)
    }
    
    func test_sovereign_state_information() throws {
        let decoder:JSONDecoder = ParadigmUtilities.json_decoder
        let response_version:Int = 1
        let anthem:NationalAnthem = NationalAnthem(mp3_url: "", sources: EventSources(sources: [EventSource(name: "Wikipedia: United States", url: "https://en.wikipedia.org/wiki/United_States")]))
        let capital:NationalCapital = NationalCapital(place: "Somewhere", notes: nil, sources: EventSources(sources: [EventSource(name: "Paradigm", url: "https://paradigm-app.com")]))
        let information:SovereignStateInformation = SovereignStateInformation(administration: ClientGovernmentAdministration(current_version: 1, all_versions: [1,2,3]),
                                                                              _static: SovereignStateStaticInformation(response_version: response_version, availabilities: nil, agriculture: nil, info: nil, legalities: nil, rankings: nil, single_values: nil, national_animals: nil, national_anthem: anthem, national_capital: capital, national_trees: nil, cia_services: nil, history: nil, wikipedia: nil, wikipedia_featured_pictures: nil, sources: nil),
                                                                              nonstatic: nil)
        
        XCTAssertNotNil(information._static?.national_capital)
        
        let data:Data = information.toString()!.data(using: .utf8)!
        let bro:SovereignStateInformation = try decoder.decode(SovereignStateInformation.self, from: data)
        XCTAssertEqual(bro._static?.response_version, response_version)
        XCTAssertEqual(bro._static?.national_anthem, anthem)
        XCTAssertEqual(bro._static?.national_capital, capital)
    }
    
    func test_upcoming_events() throws {
        let encoder:JSONEncoder = ParadigmUtilities.json_encoder
        let decoder:JSONDecoder = ParadigmUtilities.json_decoder
        
        let event_image_url_suffix:String = "2302/Rcw58_Selby_960.jpg", event_image_url:String = "https://apod.nasa.gov/apod/image/" + event_image_url_suffix
        let today:EventDate = EventDate.today, title:String = "test"
        var apod_event:APODEvent = APODEvent(event_date: today, title: title, description: nil, location: nil, image_url: event_image_url, sources: EventSources(sources: []), hyperlinks: nil, countries: nil, subdivisions: nil, copyright: "Evan Anderson", video_url: nil)
        XCTAssertEqual(apod_event.image_url, event_image_url_suffix)
        let data:Data = apod_event.toData()!
        let generic_parsed:APODEvent? = GenericUpcomingEvents.parse_any(data: data)
        XCTAssertEqual(generic_parsed, apod_event, "generic_parsed=\(String(describing: generic_parsed));apod_event=\(apod_event)")
        apod_event.image_url = event_image_url
        let string:String? = generic_parsed?.getValue("copyright")
        XCTAssertEqual(string, "Evan Anderson")
        
        XCTAssertEqual(apod_event.image_url, event_image_url_suffix)
        let apod_pre_event:PreUpcomingEvent = apod_event.to_pre_upcoming_event(tag: "")
        XCTAssertEqual(apod_pre_event.image_url, event_image_url_suffix)
        
        let event_date:EventDate = EventDate(year: 2023, month: Month.january, day: 1)
        let movie_pre_event:PreUpcomingEvent = PreUpcomingEvent(type: .movie, event_date: event_date, title: "Test Movie Title", tag: "Test Movie Tag", image_url: nil)
        XCTAssertNotNil(movie_pre_event.event_date)
        let dates:UpcomingEventTypeDateEvents = UpcomingEventTypeDateEvents(date: event_date, events: [movie_pre_event])
        let test:UpcomingEventTypeEvents = UpcomingEventTypeEvents(type: .movie, date_events: [dates])
        let upcoming_events_json:String = String(data: try encoder.encode(test), encoding: .utf8)!
        XCTAssert(upcoming_events_json.elementsEqual("{\"type\":\"movie\",\"date_events\":[{\"date\":\"1-2023-01\",\"events\":[{\"title\":\"Test Movie Title\",\"tag\":\"Test Movie Tag\"}]}]}"), "upcoming_events_json=" + upcoming_events_json)
        
        let pre_holiday:PreHoliday = PreHoliday(type: "fun", id: "test_holiday", name: "Test Holiday", emoji: nil)
        let holidays_near:[UpcomingEventDateHolidays] = [UpcomingEventDateHolidays(date: event_date, holidays: [pre_holiday])]
        let holidays_near_json:String = String(data: try encoder.encode(holidays_near), encoding: .utf8)!
        XCTAssert(holidays_near_json.elementsEqual("[{\"date\":\"1-2023-01\",\"holidays\":[{\"type\":\"fun\",\"id\":\"test_holiday\",\"name\":\"Test Holiday\"}]}]"), "holidays_near_json=" + holidays_near_json)
    }
    
    func test_home_responses() throws {
        let encoder:JSONEncoder = ParadigmUtilities.json_encoder
        let decoder:JSONDecoder = ParadigmUtilities.json_decoder
        
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
        XCTAssertEqual(response_string, target_response_string)
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
    
    private func test_benchmarks() async throws {
        /*let test:PreUpcomingEvent = PreUpcomingEvent(type: UpcomingEventType.astronomy_picture_of_the_day, event_date: EventDate(year: 2023, month: Month.may, day: 21), title: "test", tag: "bro", image_url: nil)
        try await benchmark(key: "all_values_are_nil", {
            let value:Bool = test.all_values_are_nil()
            XCTAssert(!value)
        })
        try await benchmark(key: "all_values_are_nil_2", {
            let value:Bool = test.all_values_are_nil_2()
            XCTAssert(!value)
        })*/
    }
    private func get_local_data(at path: String) -> Data? {
        let url:URL = URL(fileURLWithPath: path)
        return try? Data.init(contentsOf: url)
    }
}

private struct TestBro : Jsonable {
    typealias JSONKeys = TestBroValueKeys
    
    var big_boy:String
    let number:Int
    
    func getKeyValue(key: TestBroValueKeys) -> Any? {
        switch key {
        case .big_boy: return big_boy
        }
    }
    mutating func setKeyValue<T>(key: TestBroValueKeys, value: T) {
        switch key {
        case .big_boy:
            big_boy = value as! String
            break
        }
    }
}
private enum TestBroValueKeys : String, JsonableKeys {
    case big_boy
}
