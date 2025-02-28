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

extension CatrobatSetup {

    static func registeredSensors(stageSize: CGSize,
                                  motionManager: MotionManager,
                                  locationManager: LocationManager,
                                  visualDetectionManager: VisualDetectionManager,
                                  audioManager: AudioManagerProtocol,
                                  touchManager: TouchManagerProtocol,
                                  bluetoothService: BluetoothService) -> [Sensor] {
        [LoudnessSensor(audioManagerGetter: { audioManager }),
         InclinationXSensor(motionManagerGetter: { motionManager }),
         InclinationYSensor(motionManagerGetter: { motionManager }),
         AccelerationXSensor(motionManagerGetter: { motionManager }),
         AccelerationYSensor(motionManagerGetter: { motionManager }),
         AccelerationZSensor(motionManagerGetter: { motionManager }),
         CompassDirectionSensor(locationManagerGetter: { locationManager }),
         LatitudeSensor(locationManagerGetter: { locationManager }),
         LongitudeSensor(locationManagerGetter: { locationManager }),
         LocationAccuracySensor(locationManagerGetter: { locationManager }),
         AltitudeSensor(locationManagerGetter: { locationManager }),
         UserLanguageSensor(),
         FingerTouchedSensor(touchManagerGetter: { touchManager }),
         FingerXSensor(touchManagerGetter: { touchManager }),
         FingerYSensor(touchManagerGetter: { touchManager }),
         LastFingerIndexSensor(touchManagerGetter: { touchManager }),
         TouchesFingerSensor(touchManagerGetter: { touchManager }),
         TouchesEdgeSensor(touchManagerGetter: { touchManager }),

         DateYearSensor(),
         DateMonthSensor(),
         DateDaySensor(),
         DateWeekdaySensor(),
         TimeHourSensor(),
         TimeMinuteSensor(),
         TimeSecondSensor(),

         FaceDetectedSensor(visualDetectionManagerGetter: { visualDetectionManager }),
         FaceSizeSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         FacePositionXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         FacePositionYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         SecondFaceDetectedSensor(visualDetectionManagerGetter: { visualDetectionManager }),
         SecondFaceSizeSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         SecondFacePositionXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         SecondFacePositionYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),

         HeadTopXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         HeadTopYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         NoseXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         NoseYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         LeftEyeInnerXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         LeftEyeInnerYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         LeftEyeCenterXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         LeftEyeCenterYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         LeftEyeOuterXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         LeftEyeOuterYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         RightEyeInnerXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         RightEyeInnerYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         RightEyeCenterXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         RightEyeCenterYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         RightEyeOuterXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         RightEyeOuterYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         LeftEarXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         LeftEarYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         RightEarXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         RightEarYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         MouthLeftCornerXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         MouthLeftCornerYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         MouthRightCornerXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         MouthRightCornerYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         LeftEyebrowInnerXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         LeftEyebrowInnerYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         LeftEyebrowCenterXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         LeftEyebrowCenterYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         LeftEyebrowOuterXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         LeftEyebrowOuterYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         RightEyebrowInnerXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         RightEyebrowInnerYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         RightEyebrowCenterXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         RightEyebrowCenterYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         RightEyebrowOuterXSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),
         RightEyebrowOuterYSensor(stageSize: stageSize, visualDetectionManagerGetter: { visualDetectionManager }),

         PhiroFrontLeftSensor(bluetoothServiceGetter: { bluetoothService }),
         PhiroFrontRightSensor(bluetoothServiceGetter: { bluetoothService }),
         PhiroBottomLeftSensor(bluetoothServiceGetter: { bluetoothService }),
         PhiroBottomRightSensor(bluetoothServiceGetter: { bluetoothService }),
         PhiroSideLeftSensor(bluetoothServiceGetter: { bluetoothService }),
         PhiroSideRightSensor(bluetoothServiceGetter: { bluetoothService }),

         PositionXSensor(),
         PositionYSensor(),
         TransparencySensor(),
         BrightnessSensor(),
         ColorSensor(),
         SizeSensor(),
         RotationSensor(),
         LayerSensor(),
         BackgroundNumberSensor(),
         BackgroundNameSensor(),
         LookNumberSensor(),
         LookNameSensor()]
    }
}
