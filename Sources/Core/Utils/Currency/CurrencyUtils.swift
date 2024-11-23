import Foundation

public struct CurrencyUtils {

    public static func getSymbolForCurrencyCode(code: String) -> String? {
      let locale = NSLocale(localeIdentifier: code)
      return locale.displayName(forKey: NSLocale.Key.currencySymbol, value: code)
    }

    public static func getPriceWithCurrency(price: Float, currency: String) -> String {
        let currencyString = CurrencyUtils.getSymbolForCurrencyCode(code: currency) ?? ""
        let priceString = price.formattedWithSeparator
        return currencyString + priceString
    }

    public static func getPriceValue(from getPriceValueString: String, locale: Locale = .current) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = locale
        formatter.currencySymbol = getSymbolForCurrencyCode(code: Currency.pounds.rawValue)
        formatter.decimalSeparator = "."
        return formatter.number(from: getPriceValueString)?.stringValue ?? "0.0"
    }
}
