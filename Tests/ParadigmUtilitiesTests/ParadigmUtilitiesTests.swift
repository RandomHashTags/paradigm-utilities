import XCTest
import ParadigmUtilities
import SwiftSovereignStates

final class ParadigmUtilitiesTests : XCTestCase {
    func testExample() async throws {
        //await testTranslations(bro)
        
        //try await test_benchmarks()
    }
    
    func test_foundation() throws {
        let bruh:String = "They're going to call me Mr. Worldwide after this pops off! Aren't they?"
        let bro:TestBro = TestBro(big_boy: bruh, number: 1)
        
        let big_boy:String = bro.big_boy
        var data:Data = try ParadigmUtilities.json_encoder.encode(bro)
        let string:String = String(data: data, encoding: .utf8)!
        XCTAssertEqual(string, "{\"big_boy\":\"" + big_boy + "\",\"number\":1}")
        
        let decoded:TestBro = try ParadigmUtilities.json_decoder.decode(TestBro.self, from: data)
        data = try ParadigmUtilities.json_encoder.encode(decoded)
        let other_string = String(data: data, encoding: .utf8)!
        XCTAssertEqual(other_string, string)
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
        
        let data:Data = try ParadigmUtilities.json_encoder.encode(information)
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
        var apod_event:UpcomingEvent<APODEvent>! = UpcomingEvent<APODEvent>(type: .astronomy_picture_of_the_day, event_date: today, begins: nil, ends: nil, custom_type_singular_name: nil, title: title, description: nil, location: nil, images: [event_image_url], countries: nil, subdivisions: nil, youtube_video_ids: nil, sources: EventSources(sources: []), hyperlinks: nil, data: APODEvent(copyright: "Evan Anderson", video_url: nil))
        XCTAssertEqual(apod_event.images, [event_image_url_suffix])
        let data:Data = try ParadigmUtilities.json_encoder.encode(apod_event)
        let generic_parsed:AnyUpcomingEvent? = GenericUpcomingEvents.parse_any(data: data)
        XCTAssertEqual(generic_parsed as? UpcomingEvent<APODEvent>, apod_event, "generic_parsed=\(String(describing: generic_parsed));apod_event=\(apod_event)")
        apod_event.images = [event_image_url]
        //let string:String? = generic_parsed?.getValue("copyright")
        //XCTAssertEqual(string, "Evan Anderson")
        
        XCTAssertEqual(apod_event.images, [event_image_url_suffix])
        let apod_pre_event:PreUpcomingEvent = apod_event.to_pre_upcoming_event(tag: "")
        XCTAssertEqual(apod_pre_event.images, [event_image_url_suffix])
        
        let event_date:EventDate = EventDate(year: 2023, month: Month.january, day: 1)
        let movie_pre_event:PreUpcomingEvent = PreUpcomingEvent(type: .movie, event_date: event_date, title: "Test Movie Title", tag: "Test Movie Tag", images: [])
        XCTAssertNotNil(movie_pre_event.event_date)
        let dates:Responses.UpcomingEvents.TypeDateEvents = Responses.UpcomingEvents.TypeDateEvents(date: event_date, events: [movie_pre_event])
        let test:Responses.UpcomingEvents.TypeEvents = Responses.UpcomingEvents.TypeEvents(type: .movie, date_events: [dates])
        let upcoming_events_json:String = String(data: try encoder.encode(test), encoding: .utf8)!
        XCTAssertEqual(upcoming_events_json, "{\"type\":\"movie\",\"date_events\":[{\"date\":\"1-2023-01\",\"events\":[{\"title\":\"Test Movie Title\",\"tag\":\"Test Movie Tag\"}]}]}")
    }
    
    func test_home_responses() throws {
        let encoder:JSONEncoder = ParadigmUtilities.json_encoder
        let decoder:JSONDecoder = ParadigmUtilities.json_decoder
        
        let countries:Responses.Countries.Home = Responses.Countries.Home(filters: nil)
        
        let government:Responses.Government.Home = Responses.Government.Home(recent_activity: [])
        let news:Responses.News.Home = Responses.News.Home(regional: [])
        let stock_market:Responses.StockMarket.Home? = nil

        let upcoming_events:Responses.UpcomingEvents.Home = Responses.UpcomingEvents.Home(events: nil, movie_production_companies: nil)
        
        let weather_alerts:[Responses.Weather.CountryWeatherEvents] = [
            Responses.Weather.CountryWeatherEvents(country: Country.united_states, subdivisions: [
                Responses.Weather.SubdivisionWeatherEvents(subdivision: SubdivisionsUnitedStates.minnesota.wrapped(), events: [
                    WeatherEvent(type: .blizzard_warning, defcon: 3)
                ])
            ])
        ]
        let weather_earthquakes:[Responses.Weather.CountryEarthquakes] = [
            Responses.Weather.CountryEarthquakes(country: Country.united_states, subdivisions: [
                Responses.Weather.SubdivisionEarthquakes(subdivision: SubdivisionsUnitedStates.minnesota, magnitudes: [
                    Responses.Weather.PreEarthquakeMagnitude(mag: "5.0", quakes: [
                        PreEarthquake(id: "mn3948u50294", place: "26km W of Rochester", city: CitiesUnitedStatesMinnesota.rochester)
                    ])
                ])
            ])
        ]
        let weather_natural_events:Responses.Weather.NaturalWeatherEvents = Responses.Weather.NaturalWeatherEvents(
            severe_storms: [
                Responses.Weather.CountryNaturalWeatherEvents(country: Country.united_states, events: [
                    PreNaturalWeatherEvent(id: "az98345", place: "Alaska", tag: nil, country: Country.united_states, subdivision: SubdivisionsUnitedStates.alaska)
                ])
            ],
            volcanoes: [
            ],
            wildfires: [
            ]
        )
        let weather:Responses.Weather.Home = Responses.Weather.Home(alerts: weather_alerts, earthquakes: weather_earthquakes, natural_events: weather_natural_events)
        
        let response:Responses.Home = Responses.Home(countries: countries, government: government, news: news, stock_market: stock_market, upcoming_events: upcoming_events, weather: weather)
        let response_data:Data = try encoder.encode(response)
        let response_string:String = String(data: response_data, encoding: .utf8)!
        let target_response_string:String = """
{"upcoming_events":{"weather":{"natural_events":{"severe_storms":[{"country":"united_states","events":[{"place":"Alaska","id":"az98345","country":"united_states","subdivision":"united_states-alaska"}]}],"volcanoes":[],"wildfires":[]},"alerts":[{"country":"united_states","subdivisions":[{"subdivision":"united_states-minnesota","events":[{"type":"blizzard_warning","defcon":3}]}]}],"earthquakes":[{"country":"united_states","subdivisions":[{"magnitudes":[{"mag":"5.0","quakes":[{"id":"mn3948u50294","place":"26km W of Rochester","city":"united_states-minnesota-rochester"}]}],"subdivision":"united_states-minnesota"}]}]}}
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
    var big_boy:String
    let number:Int
}