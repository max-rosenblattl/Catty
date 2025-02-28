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

@testable import Pocket_Code

final class VisualDetectionManagerMock: VisualDetectionManager {

    var isAvailable = true
    var isStarted = false

    override func start() {
        isStarted = true
    }

    override func stop() {
        isStarted = false
    }

    override func available() -> Bool {
        isAvailable
    }

    func setVisualDetectionFrameSize(_ frameSize: CGSize) {
        self.visualDetectionFrameSize = frameSize
    }

    func setAllEyeSensorValueRatios(to value: Double) {
        self.faceLandmarkPositionRatioDictionary[LeftEyeInnerXSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[LeftEyeInnerYSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[LeftEyeCenterXSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[LeftEyeCenterYSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[LeftEyeOuterXSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[LeftEyeOuterYSensor.tag] = value

        self.faceLandmarkPositionRatioDictionary[RightEyeInnerXSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[RightEyeInnerYSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[RightEyeCenterXSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[RightEyeCenterYSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[RightEyeOuterXSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[RightEyeOuterYSensor.tag] = value
    }

    func setAllEyebrowSensorValueRatios(to value: Double) {
        self.faceLandmarkPositionRatioDictionary[LeftEyebrowInnerXSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[LeftEyebrowInnerYSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[LeftEyebrowCenterXSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[LeftEyebrowCenterYSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[LeftEyebrowOuterXSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[LeftEyebrowOuterYSensor.tag] = value

        self.faceLandmarkPositionRatioDictionary[RightEyebrowInnerXSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[RightEyebrowInnerYSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[RightEyebrowCenterXSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[RightEyebrowCenterYSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[RightEyebrowOuterXSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[RightEyebrowOuterYSensor.tag] = value
    }

    func setAllEarSensorValueRatios(to value: Double) {
        self.faceLandmarkPositionRatioDictionary[LeftEarXSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[LeftEarYSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[RightEarXSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[RightEarYSensor.tag] = value
    }

    func setAllMouthSensorValueRatios(to value: Double) {
        self.faceLandmarkPositionRatioDictionary[MouthLeftCornerXSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[MouthLeftCornerYSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[MouthRightCornerXSensor.tag] = value
        self.faceLandmarkPositionRatioDictionary[MouthRightCornerYSensor.tag] = value
    }
}
