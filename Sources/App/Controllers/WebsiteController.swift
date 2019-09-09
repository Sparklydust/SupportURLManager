import Vapor
import Leaf

struct WebsiteController: RouteCollection {
  //MARK: - WebsiteController routes
  func boot(router: Router) throws {
    //MARK: AirsoftCalculator
    let airsoftCalculatorRoutes = router.grouped("airsoftcalculator")
    airsoftCalculatorRoutes.get(CountryCode.england.rawValue, use: enAirsoftCalculatorSupportURL)
    airsoftCalculatorRoutes.get(CountryCode.france.rawValue, use: frAirsoftCalculatorSupportURL)
    
    //MARK: Partages
    let partagesRoutes = router.grouped("partages")
    partagesRoutes.get(CountryCode.england.rawValue, use: enPartagesSupportURL)
    partagesRoutes.get(CountryCode.france.rawValue, use: frPartagesSupportURL)
  }
}

//MARK: - AirsoftCalculator.app routes methods
extension WebsiteController {
  //MARK: English AirsoftCalculator.app Support URL path
  func enAirsoftCalculatorSupportURL(_ req: Request) throws -> Future<View> {
    let context = IndexContext(countryCode: CountryCode.england.rawValue,
                               title: Title.enContact.rawValue,
                               appName: App.AirsoftCalculator.rawValue
    )
    return try req.view().render("enAirsoftCalculator", context)
  }
  
  //MARK: French AirsoftCalculator.app Support URL path
  func frAirsoftCalculatorSupportURL(_ req: Request) throws -> Future<View> {
    let context = IndexContext(countryCode: CountryCode.france.rawValue,
                               title: Title.enContact.rawValue,
                               appName: App.AirsoftCalculator.rawValue
    )
    return try req.view().render("frAirsoftCalculator", context)
  }
}

//MARK: - Partages.app routes methods
extension WebsiteController {
  //MARK: English Partages.app Support URL
  func enPartagesSupportURL(_ req: Request) throws -> Future<View> {
    let context = IndexContext(countryCode: CountryCode.england.rawValue,
                               title: Title.enContact.rawValue,
                               appName: App.Partages.rawValue
    )
    return try req.view().render("enPartages", context)
  }
  
  //MARK: French Partages.app Support URL
  func frPartagesSupportURL(_ req: Request) throws -> Future<View> {
    let context = IndexContext(countryCode: CountryCode.france.rawValue,
                               title: Title.enContact.rawValue,
                               appName: App.Partages.rawValue
    )
    return try req.view().render("frPartages", context)
  }
}

//MARK: - To insert content in Resources/Views/<file name>.leaf files
struct IndexContext: Encodable {
  let countryCode: String
  let title: String
  let appName: String
}
