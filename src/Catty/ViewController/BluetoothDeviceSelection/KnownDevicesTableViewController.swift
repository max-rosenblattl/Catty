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

import BluetoothHelper
import CoreBluetooth
import UIKit

class KnownDevicesTableViewController: BluetoothDevicesTableViewController {

    var knownDevices: [Peripheral] = Array()

    override func viewDidLoad() {
        super.viewDidLoad()
        let central = CentralManager.sharedInstance
        if central.isScanning {
            central.stopScanning()
        } else {
            CentralManager.sharedInstance.start().onSuccess {
                self.getKnownDevices()
            }

        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { knownDevices.count }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.textColor = UIColor.globalTint
        cell.isUserInteractionEnabled = true

        cell.textLabel?.text = knownDevices[indexPath.row].name

        return cell
    }

    func getKnownDevices() {
        //        let afterPeripheralDiscovered = {(peripherals:[Peripheral]) -> Void in
        //            self.knownDevices = peripherals
        //            self.updateWhenActive()
        //        }
        //        let afterTimeout = {(error:NSError) -> Void in
        //
        //        }
        var knownCBPeripherals: [CBPeripheral]
        let stringArray = UserDefaults.standard.array(forKey: "KnownBluetoothDevices") as? [String]
        let uuidArray = stringArray?.compactMap { UUID(uuidString: $0) }
        knownCBPeripherals = CentralManager.sharedInstance.getKnownPeripheralsWithIdentifiers(uuidArray ?? [])
        for peri in knownCBPeripherals {
            let peripheral = Peripheral(cbPeripheral: peri, advertisements: [:], rssi: 0)
            peripheral.discoverAllServices()
            self.knownDevices.append(peripheral)
        }
        self.updateWhenActive()
    }

    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */

    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */

    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

     }
     */

    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
