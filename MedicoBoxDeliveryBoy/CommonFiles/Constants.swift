

import Foundation
import UIKit


@available(iOS 10.0, *)
let appDelegate = UIApplication.shared.delegate as? AppDelegate
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height

//Base url of App
let BASEURL = ""

//Google APIs
let cinstantbaseUrl1 = "https://maps.googleapis.com/maps/api/directions/json?origin=Toronto&destination=Montreal&key=AIzaSyA6zN2d9EifRnGoBTVX_dSvOJ5I7jg2Sec=true"

//Menu buttons on Navigation Bar (Right and Left) Buttons

let API_TOKEN = " "

//APP Font
// Mark: StoryBoard
let kMainStoryboard = UIStoryboard(name: "Main", bundle: nil)

//MARK: UIViewControllers
let kSignUpVC = "SignUpViewController"
let kSignInVC = "SignInViewController"
let kVerifyOTPVC = "VerifyOTPViewController"
let kHomeVC = "HomeViewController"
let kForgotPasswordFromMobileNoVC = "ForgotPasswordFromMobileNoViewController"
let kSetNewPasswordVC = "SetNewPasswordViewController"
let kOrdersVC = "OrdersViewController"
let kMyProfileVC = "MyProfileViewController"
let kEditProfileVC  = "EditProfileViewController"
let kPendingOrdersVC = "PendingOrdersViewController"
let kCompletedOrdersVC = "CompletedOrdersViewController"

// MARK: Image Constant
let kbackgroundColor  =  UIColor.init(hexString: "#d7e0e7")
let KNavigationBarColor = UIColor.init(hexString: "#fbc525")
let kButtonBackgroundColor = UIColor.init(hexString: "#1f2c4c")

//MARK: Keys
let kLoginRole = ""
