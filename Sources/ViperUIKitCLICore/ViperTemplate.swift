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

struct \(name)Viper : BaseViper {
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

class \(name)ViewController : UIViewController, \(isTableView ? "Table" : "")PresentableView {
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
                <outlet property="view" destination="i5M-Pr-FkT" id="sfx-zR-JGt"/>
            </connections>
        </placeholder>
        <placeholder placeholderIdentifier="IBFirstResponder" id="-2" customClass="UIResponder"/>
        <view clearsContextBeforeDrawing="NO" contentMode="scaleToFill" id="i5M-Pr-FkT">
            <rect key="frame" x="0.0" y="0.0" width="414" height="896"/>
            <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
            <subviews>
                <activityIndicatorView opaque="NO" contentMode="scaleToFill" horizontalHuggingPriority="750" verticalHuggingPriority="750" hidesWhenStopped="YES" animating="YES" style="large" translatesAutoresizingMaskIntoConstraints="NO" id="tkM-wH-pz4">
                    <rect key="frame" x="188.5" y="429.5" width="37" height="37"/>
                </activityIndicatorView>
            </subviews>
            <viewLayoutGuide key="safeArea" id="fnl-2z-Ty3"/>
            <color key="backgroundColor" systemColor="systemBackgroundColor"/>
            <constraints>
                <constraint firstItem="tkM-wH-pz4" firstAttribute="centerX" secondItem="i5M-Pr-FkT" secondAttribute="centerX" id="7Ov-1D-RsH"/>
                <constraint firstItem="tkM-wH-pz4" firstAttribute="centerY" secondItem="i5M-Pr-FkT" secondAttribute="centerY" id="iCS-u8-6rF"/>
            </constraints>
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

struct \(name)Interactor : BaseInteractor {
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
final class \(name)Presenter : NSObject, Base\(isTableView ? "Table" : "")Presenter {
    //1. declare type
    typealias Viper = \(name)Viper
    
    //2. declare variables for your VIPER
    //NOTE: always weak, to prevent retain cycle
    weak var view : Viper.View!
    var interactor: Viper.Interactor!
    var router: Viper.Router!
    var item : Viper.Entity?
    var list : [Viper.Entity] = []
    
    //3. default methods
    func setup() {
        //TODO: add your setup, i.e. navigation title, tableview data source, etc.
    }
    func loadContent() {
        //TODO: fetch your data
        interactor.fetch { (_) in
            //TODO: refresh UI
        }
    }
    func reloadContent() {
        //TODO: add reload method
    }
}

"""
    }
    
    static func entity(_ name : String) -> String {
        return """
import Foundation
import ViperUIKit

struct \(name)Entity : BaseEntity {
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

struct \(name)Router : BaseRouter {
    typealias Viper = \(name)Viper
    
}

"""
    }
    
}
