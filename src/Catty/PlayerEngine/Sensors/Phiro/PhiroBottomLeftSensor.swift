/**
 *  Copyright (C) 2010-2022 The Catrobat Team
 *  (http://developer.catrobat.org/credits)
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Affero General Public License as
 *  published by the Free Software Foundation, either version 3 of the
 *  License, or (at your option) any later version.
 *
 *  An additional term exception under section 7 of the GNU Affero
 *  General Public License, version 3, is available at
 *  (http://developer.catrobat.org/license_additional_term)
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU Affero General Public License for more details.
 *
 *  You should have received a copy of the GNU Affero General Public License
 *  along with this program.  If not, see http://www.gnu.org/licenses/.
 */

@objc class PhiroBottomLeftSensor: NSObject, PhiroSensor {

    @objc static let tag = "bottom_left"
    static let name = kUIFESensorPhiroBottomLeft
    static let defaultRawValue = 0.0
    static let requiredResource = ResourceType.bluetoothPhiro
    static let pinNumber = PhiroDevice.pinSensorBottomLeft
    static let position = 310

    let getBluetoothService: () -> BluetoothService?

    init(bluetoothServiceGetter: @escaping () -> BluetoothService?) {
        self.getBluetoothService = bluetoothServiceGetter
    }

    func tag() -> String {
        type(of: self).tag
    }

    func rawValue(landscapeMode: Bool) -> Double {
        self.getBluetoothService()?.getSensorPhiro()?.getSensorValue(type(of: self).pinNumber) ?? type(of: self).defaultRawValue
    }

    func convertToStandardized(rawValue: Double) -> Double {
        rawValue
    }

    func formulaEditorSections(for spriteObject: SpriteObject) -> [FormulaEditorSection] {
        if UserDefaults.standard.bool(forKey: kUsePhiroBricks) == false {
            return []
        }
        return [.sensors(position: type(of: self).position, subsection: .phiro)]
    }
}
