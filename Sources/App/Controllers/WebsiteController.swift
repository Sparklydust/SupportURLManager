import Vapor
import Leaf

struct WebsiteController: RouteCollection {
  //MARK: - WebsiteController routes
  func boot(router: Router) throws {
    //MARK: AirsoftCalculator
    let airsoftCalculatorRoutes = router.grouped("airsoftcalculator")
    airsoftCalculatorRoutes.get(CountryCode.england.rawValue, use: ukSupportURL)
    airsoftCalculatorRoutes.get(CountryCode.france.rawValue, use: frSupportURL)
  }
}

//MARK: - AirsoftCalculator.app routes methods
extension WebsiteController {
  //MARK: English AirsoftCalculator.app Support URL path
  func ukSupportURL(_ req: Request) throws -> Future<View> {
    let context = IndexContext(countryCode: CountryCode.england.rawValue,
                               title: Title.enContact.rawValue,
                               appName: App.AirsoftCalculator.rawValue
    )
    return try req.view().render("enAirsoftCalculator", context)
  }
  
  //MARK: French AirsoftCalculator.app Support URL path
  func frSupportURL(_ req: Request) throws -> Future<View> {
    let context = IndexContext(countryCode: CountryCode.france.rawValue,
                               title: Title.enContact.rawValue,
                               appName: App.AirsoftCalculator.rawValue
    )
    return try req.view().render("frAirsoftCalculator", context)
  }
}

//MARK: - To insert content in Resources/Views/<file name>.leaf files
struct IndexContext: Encodable {
  let countryCode: String
  let title: String
  let appName: String
}
