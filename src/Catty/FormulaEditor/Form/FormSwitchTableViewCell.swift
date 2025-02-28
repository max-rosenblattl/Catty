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

import Foundation
import UIKit

class FormSwitchTableViewCell: FormTableViewCell {

    private let switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.accessibilityIdentifier = "formSwitch"
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        return switchControl
    }()

    private var switchAction: ((Bool) -> Void)?

    override class var id: String {
        "FormSwitchTableViewCell"
    }

    override func setupViews() {
        super.setupViews()

        contentView.addSubview(switchControl)
        switchControl.addTarget(self, action: #selector(switchControlValueChanged), for: .valueChanged)
    }

    override func setupConstraints() {
        super.setupConstraints()

        NSLayoutConstraint.activate([
            switchControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            switchControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }

    @objc private func switchControlValueChanged() {
        switchAction?(switchControl.isOn)
    }

    override func configure(with formItem: FormItem) {
        super.configure(with: formItem)

        if let item = formItem as? FormSwitchItem {
            switchAction = item.switchAction
        }
    }
}
