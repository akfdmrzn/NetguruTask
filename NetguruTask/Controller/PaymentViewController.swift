//
//  Netguru iOS code review task
//
import UIKit

protocol PaymentViewControllerDelegate {
    func didFinishFlow(payment : Payment)
}

class PaymentViewController: UIViewController {
    
    var delegate: PaymentViewControllerDelegate?
    let customView = PaymentView()
    let payment = Payment()
    internal let viewModel = PaymentViewModel() //**** actually this line should be removed because it will not be used.but i didn't remove for you see the changes.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        self.customView.setConstraints(view: self.view)
        view.addSubview(customView)
        self.fetchPayment()
        self.callbacks()
    }
    
    func callbacks() {
        view.backgroundColor = UIColor.mainBackground
        self.customView.didTapButton = {
            if self.payment.amount != 0 {
                self.delegate?.didFinishFlow(payment: self.payment)
            }
        }
    }
    
    func fetchPayment() {
        self.customView.statusText = "Fetching data"
        ApiClient.sharedInstance.fetchPayment { payment in
            self.customView.isEuro = (payment.currency?.elementsEqual(CurrencyTypes.euro.rawValue) ?? false) ? true : false
            if payment.amount != 0 {
                self.customView.label?.text = "\(payment.amount ?? 0)"
                return
            }
        }
    }
}
