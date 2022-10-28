import XCTest
import ParadigmUtilities
import ZippyJSON

final class ParadigmUtilitiesTests: XCTestCase {
    func testExample() async throws {
        let decoder:ZippyJSONDecoder = ZippyJSONDecoder()
        let smallBoy:CodableOmittable<String> = CodableOmittable<String>.init("smol", omitted: true)
        let big_boy:String = "They're going to call me Mr. Worldwide after this pops off! Aren't they?"
        let bro:TestBro = TestBro(big_boy: big_boy, number: 1, small_boy: smallBoy)
        
        try testFoundation(bro)
        try testSovereignStateInformation(decoder)
        try testUpcomingEvents(decoder)
        await testTranslations(bro)
    }
    
    private func testFoundation(_ bro: TestBro) throws {
        let big_boy:String = bro.big_boy
        let data:Data = try JSONEncoder().encode(bro)
        let string:String = String(data: data, encoding: .utf8)!
        XCTAssert(string.elementsEqual("{\"big_boy\":\"" + big_boy + "\",\"number\":1}"), "invalid string; string=" + string)
        
        var decoded:TestBro = try ZippyJSONDecoder().decode(TestBro.self, from: data)
        XCTAssert(decoded.toString()!.elementsEqual(string))
        var dud:CodableOmittable<String> = decoded.getOmittableKeyValue(key: .small_boy) as! CodableOmittable<String>
        dud.omitted = false
        decoded.setOmittableKeyValue(key: .small_boy, value: dud)
        XCTAssert(decoded.toString()!.elementsEqual(string) == false)
    }
    
    private func testSovereignStateInformation(_ decoder: ZippyJSONDecoder) throws {
        let response_version:Int = 1
        let anthem:NationalAnthem = NationalAnthem(mp3URL: "", sources: EventSources(sources: [EventSource(siteName: "Wikipedia: United States", url: "https://en.wikipedia.org/wiki/United_States")]))
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
    typealias TranslationKeys = TestBroTranslationKeys
    typealias OmittableKeys = TestBroOmittableKeys
    
    var big_boy:String
    let number:Int
    @CodableOmittable var small_boy:String?
    
    func getTranslationKeyValue(key: TestBroTranslationKeys) -> Any? {
        switch key {
        case .big_boy: return big_boy
        }
    }
    mutating func setTranslationKeyValue<T>(key: TestBroTranslationKeys, value: T) {
        switch key {
        case .big_boy:
            big_boy = value as! String
            break
        }
    }
    
    func getOmittableKeyValue(key: TestBroOmittableKeys) -> (any CodableOmittableProtocol)? {
        switch key {
        case .small_boy: return _small_boy
        }
    }
    mutating func setOmittableKeyValue<T: CodableOmittableProtocol>(key: TestBroOmittableKeys, value: T) {
        switch key {
        case .small_boy:
            _small_boy = value as! CodableOmittable<String>
            break
        }
    }
}
private enum TestBroTranslationKeys : String, JsonableTranslationKey {
    case big_boy
}
private enum TestBroOmittableKeys : String, JsonableOmittableKey {
    case small_boy
}
