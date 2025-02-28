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

extension LooksTableViewController {

    @objc
    func showBackgroundsMediaLibrary() {
        let viewController = MediaLibraryViewController(for: .backgrounds)
        viewController.importDelegate = self
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    @objc
    func showLooksMediaLibrary() {
        let viewController = MediaLibraryViewController(for: .looks)
        viewController.importDelegate = self
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    private func showImportAlert(itemName: String) {
        let alertTitle = kLocalizedMediaLibraryImportFailedTitle
        let alertMessage = "\(kLocalizedMediaLibraryImportFailedMessage) \(itemName)"
        let buttonTitle = kLocalizedOK

        let alertController = UIAlertController.init(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alertController.addAction(title: buttonTitle, style: .default, handler: nil)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension LooksTableViewController: MediaLibraryViewControllerImportDelegate {
    func mediaLibraryViewController(_ mediaLibraryViewController: MediaLibraryViewController, didPickItemsForImport items: [MediaItem]) {
        for item in items {
            guard let data = item.cachedData else { self.showImportAlert(itemName: item.name); continue }

            if let image = UIImage(data: data) {
                self.addMediaLibraryLoadedImage(image, withName: item.name)
                continue
            }
        }
    }
}
