//
//  File.swift
//  
//
//  Created by Buzzwoo MBP on 9/9/21.
//

import Foundation

struct Template {
    static func viper(_ name : String) -> String {
        return """
import Foundation
import ViperUIKit

struct \(name)Viper : ViperUIKit.BaseViper {
    typealias View = \(name)ViewController
    typealias Interactor = \(name)Interactor
    typealias Presenter = \(name)Presenter
    typealias Entity = \(name)Entity
    typealias Router = \(name)Router
}
"""
    }
    
    static func view(_ name : String, _ isTableView : Bool) -> String {
        return """
import UIKit
import ViperUIKit

class \(name)ViewController : UIViewController, ViperUIKit.\(isTableView ? "Table" : "")PresentableView {
    //1. declare type
    typealias Viper = \(name)Viper

    \(isTableView ? "@IBOutlet weak var tableView : UITableView!" : "")
    
    //2. declare presenter
    var presenter: Viper.Presenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //3. call setup
        presenter.setup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //4. load content
        presenter.loadContent()
    }
}
"""
    }
    static func xibTable(_ name : String, _ module : String) -> String {
        return """
<?xml version="1.0" encoding="UTF-8"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.XIB" version="3.0" toolsVersion="17701" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" useSafeAreas="YES" colorMatched="YES">
    <device id="retina6_1" orientation="portrait" appearance="light"/>
    <dependencies>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="17703"/>
        <capability name="Safe area layout guides" minToolsVersion="9.0"/>
        <capability name="System colors in document resources" minToolsVersion="11.0"/>
        <capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>
    </dependencies>
    <objects>
        <placeholder placeholderIdentifier="IBFilesOwner" id="-1" userLabel="File's Owner" customClass="\(name)ViewController" customModule="\(module)" customModuleProvider="target">
            <connections>
                <outlet property="tableView" destination="Jd9-KN-hlM" id="Ys6-DK-YP0"/>
                <outlet property="view" destination="i5M-Pr-FkT" id="sfx-zR-JGt"/>
            </connections>
        </placeholder>
        <placeholder placeholderIdentifier="IBFirstResponder" id="-2" customClass="UIResponder"/>
        <view clearsContextBeforeDrawing="NO" contentMode="scaleToFill" id="i5M-Pr-FkT">
            <rect key="frame" x="0.0" y="0.0" width="414" height="896"/>
            <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
            <subviews>
                <tableView clipsSubviews="YES" contentMode="scaleToFill" alwaysBounceVertical="YES" style="plain" separatorStyle="default" rowHeight="-1" estimatedRowHeight="-1" sectionHeaderHeight="28" sectionFooterHeight="28" translatesAutoresizingMaskIntoConstraints="NO" id="Jd9-KN-hlM">
                    <rect key="frame" x="0.0" y="44" width="414" height="818"/>
                    <color key="backgroundColor" systemColor="systemBackgroundColor"/>
                </tableView>
            </subviews>
            <viewLayoutGuide key="safeArea" id="fnl-2z-Ty3"/>
            <color key="backgroundColor" systemColor="systemBackgroundColor"/>
            <constraints>
                <constraint firstItem="Jd9-KN-hlM" firstAttribute="top" secondItem="fnl-2z-Ty3" secondAttribute="top" id="7rX-vq-evH"/>
                <constraint firstItem="fnl-2z-Ty3" firstAttribute="trailing" secondItem="Jd9-KN-hlM" secondAttribute="trailing" id="Ua6-Ys-8Va"/>
                <constraint firstItem="Jd9-KN-hlM" firstAttribute="leading" secondItem="fnl-2z-Ty3" secondAttribute="leading" id="tXO-h7-7NQ"/>
                <constraint firstItem="fnl-2z-Ty3" firstAttribute="bottom" secondItem="Jd9-KN-hlM" secondAttribute="bottom" id="uKB-oN-Bn6"/>
            </constraints>
            <point key="canvasLocation" x="20" y="57"/>
        </view>
    </objects>
    <resources>
        <systemColor name="systemBackgroundColor">
            <color white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
        </systemColor>
    </resources>
</document>

"""
    }
    static func xib(_ name : String, _ module : String) -> String {
        return """
<?xml version="1.0" encoding="UTF-8"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.XIB" version="3.0" toolsVersion="18122" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" useSafeAreas="YES" colorMatched="YES">
    <device id="retina6_1" orientation="portrait" appearance="light"/>
    <dependencies>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="18093"/>
        <capability name="Safe area layout guides" minToolsVersion="9.0"/>
        <capability name="System colors in document resources" minToolsVersion="11.0"/>
        <capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>
    </dependencies>
    <objects>
        <placeholder placeholderIdentifier="IBFilesOwner" id="-1" userLabel="File's Owner" customClass="\(name)ViewController" customModule="\(module)" customModuleProvider="target">
            <connections>
                <outlet property="view" destination="i5M-Pr-FkT" id="sfx-zR-JGt"/>
            </connections>
        </placeholder>
        <placeholder placeholderIdentifier="IBFirstResponder" id="-2" customClass="UIResponder"/>
        <view clearsContextBeforeDrawing="NO" contentMode="scaleToFill" id="i5M-Pr-FkT">
            <rect key="frame" x="0.0" y="0.0" width="414" height="896"/>
            <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
            <viewLayoutGuide key="safeArea" id="fnl-2z-Ty3"/>
            <color key="backgroundColor" systemColor="systemBackgroundColor"/>
            <point key="canvasLocation" x="20" y="85"/>
        </view>
    </objects>
    <resources>
        <systemColor name="systemBackgroundColor">
            <color white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
        </systemColor>
    </resources>
</document>


"""
    }
    
    static func interactor(_ name : String) -> String {
        return """
import ViperUIKit

struct \(name)Interactor : ViperUIKit.BaseInteractor {
    typealias Input = Any
    typealias Response = Any
    
    func fetch(_ input : Input?, _ completion: @escaping (Response) -> Void) {
        //TODO: add logic here
        completion("Hello, world!")
    }
    
}
"""
    }
    
    static func presenter(_ name : String, _ isTableView : Bool) -> String {
        return """
import UIKit
import ViperUIKit

///NOTE: mark as final class + inherits from NSObject
final class \(name)Presenter : NSObject, ViperUIKit.Base\(isTableView ? "Table" : "")Presenter {
    //1. declare type
    typealias Viper = \(name)Viper
    
    //2. declare variables for your VIPER
    //NOTE: always weak, to prevent retain cycle
    weak var view : Viper.View!
    var interactor: Viper.Interactor!
    var router: Viper.Router!
    var item : Viper.Entity?
    var list : [Viper.Entity] = []

    \(isTableView ? self.componentDeclaration() : "")
    
    //3. default methods
    /// This should be called one time on your viewController when starting the screen
    /// i.e. viewDidLoad()
    func setup() {
        //TODO: add your setup, i.e. navigation title, tableview data source, etc.
    }

    /// This should be called one time on your viewController when destroying
    /// i.e. deinit()
    func tearDown() {
        //TODO: add your tear down, i.e. stop timer, release strong ref, etc.
    }

    /// This should be called when it's necessary to fetch/update UI content
    /// i.e. viewWillAppear()
    func loadContent() {
        //TODO: fetch your data
        interactor.fetch { [weak self] (_) in
            //TODO: refresh UI
            self?.reloadUI()
        }
    }
    /// This is similar to loadContent(), but responsible to refresh logic
    /// i.e. pullToRefresh with a conditional API throttle
    func reloadContent() {
        //TODO: add reload method
    }

    \(isTableView ? self.buildComponentMethod() : "" )

    /// This should be called to purely refresh UI content without any business logic
    private func reloadUI() {
        //TODO: refresh UI data
        \(isTableView ? "self.buildComponents()" : "" )
        \(isTableView ? "self.tableView.reloadData()" : "")
    }
}

\(isTableView ? tableExtension(name) : "")
"""
    }
    
    static func componentDeclaration() -> String {
        return """
        //NOTE: Please change `Component` to suit your view structure
        enum Component {
            case space(CGFloat)
            case header(String?)
        }
        /// components object for tableView structure
        var components : [[Component]] = []
"""
    }
    static func buildComponentMethod() -> String {
        return """
        /// Build components block according to screen's current logic
        func buildComponents() {
            //TODO: add logic for components UI
            self.components = [
                [.header("Hello, World!")],
            ]
        }
"""
    }
    
    static func tableExtension(_ name : String) -> String {
        return """
extension \(name)Presenter : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.components.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.components[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: change
        let component = components[indexPath.section][indexPath.row]
        switch component {
        case .space(_):
            return UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //TODO: change
        let component = components[indexPath.section][indexPath.row]
        switch component {
        case .space(let h): return h
        default: return UITableView.automaticDimension
        }
    }
}
"""
    }
    
    static func entity(_ name : String) -> String {
        return """
import Foundation
import ViperUIKit

struct \(name)Entity : ViperUIKit.BaseEntity {
    typealias PK = Int
    var pk : PK { id }
    var id : Int
}

"""
    }
    
    static func router(_ name : String) -> String {
        return """
import UIKit
import ViperUIKit

struct \(name)Router : ViperUIKit.BaseRouter {
    typealias Viper = \(name)Viper
    
}

"""
    }
    
}
