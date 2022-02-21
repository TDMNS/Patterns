import Cocoa

protocol BuyClerical {
    func buyPencil()
    func buyEraser()
    func buyPen()
}

/// Существует фреймворк покупки концелярских товаров на японском языке, в котором реализованы 3 метода покупок (покупка карандаша, ручки и ластика). Реализовав протокол через адаптер, мы можем спокойно использовать этот фреймворк. Таким образом, если данный фреймворк будет передалан кем-либо, мы сможем реализовать еще 1 адаптер и дальше продолжать использование клиентского кода.

final private class ClericalFramework {
    func enpitsuOKau() {
        print("Buy pencil")
    }
    
    func kashigomuOKonoyuSuru() {
        print("Buy eraser")
    }
    
    func penOKau() {
        print("Buy pen")
    }
}

final private class PurchaseAdapter: BuyClerical {
    private let clericalFramework = ClericalFramework()
    
    func buyPencil() {
        clericalFramework.penOKau()
    }
    
    func buyEraser() {
        clericalFramework.kashigomuOKonoyuSuru()
    }
    
    func buyPen() {
        clericalFramework.enpitsuOKau()
    }
}

final class ClientCode {
    func furnishingOffice() {
        let purchaseAdapter = PurchaseAdapter()
        purchaseAdapter.buyPen()
        purchaseAdapter.buyPencil()
        purchaseAdapter.buyEraser()
        buyChairs()
        buyTables()
    }
    
    func buyTables() {
        print("Buy tables")
    }
    
    func buyChairs() {
        print("Buy chairs")
    }
}

let clientCode = ClientCode()
print("Furnishing Office:")
clientCode.furnishingOffice()
