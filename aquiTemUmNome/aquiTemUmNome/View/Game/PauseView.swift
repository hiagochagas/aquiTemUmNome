//
//  PauseView.swift
//  aquiTemUmNome
//
//  Created by Cecilia Soares on 18/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//
// swiftlint:disable line_length
import UIKit

class PauseView: UIView {
    lazy var blur: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()
    let modal: UIView = {
        let modalView = UIView()
        modalView.backgroundColor = .systemGray5
        modalView.layer.cornerRadius = 40
        modalView.translatesAutoresizingMaskIntoConstraints = false
        return modalView
    }()
    let circle: AnimatedCircleView = {
        let circle = AnimatedCircleView(lineWidth: 5)
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.infintyOpacity(durationPerCycle: 3)
        return circle
    }()
    let playButton: UIButton = {
        let playButton = UIButton(nameIcon: "play.fill", sizeButton: 95, sizeIcon: 55, weightIcon: .bold, backgroundColor: .clear, tintColor: .white)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.startAnimatingPressActions()
        return playButton
    }()
    let homeButton: UIButton = {
        let color = PalletteManager().getActivePallette().getColor(option: .fifthColor)
        let homeButton = UIButton(nameIcon: "house.fill", sizeButton: 56, sizeIcon: 24, weightIcon: .bold, backgroundColor: color, tintColor: .white)
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.startAnimatingPressActions()
        return homeButton
    }()

    let muteButton: UIButton = {
        let color = PalletteManager().getActivePallette().getColor(option: .secondaryColor)
        let status = UserDefaults.standard.bool(forKey: "mute")
        let muteButton: UIButton
        if status {
            muteButton = UIButton(nameIcon: "speaker.slash.fill", sizeButton: 56, sizeIcon: 24, weightIcon: .bold, backgroundColor: color, tintColor: .white)
        } else {
            muteButton = UIButton(nameIcon: "speaker.wave.2.fill", sizeButton: 56, sizeIcon: 24, weightIcon: .bold, backgroundColor: color, tintColor: .white)
        }
        muteButton.translatesAutoresizingMaskIntoConstraints = false
        muteButton.startAnimatingPressActions()
        return muteButton
    }()

    func updateMute() {
        let status = UserDefaults.standard.bool(forKey: "mute")
        if status {
            muteButton.setCustomIcon(nameIcon: "speaker.slash.fill", sizeIcon: (Int(muteButton.bounds.size.width) / 2) - 5, weightIcon: .bold, tintColor: .white)
        } else {
            muteButton.setCustomIcon(nameIcon: "speaker.wave.2.fill", sizeIcon: (Int(muteButton.bounds.size.width) / 2) - 5, weightIcon: .bold, tintColor: .white)
        }
    }
    let restartButton: UIButton = {
        let color = PalletteManager().getActivePallette().getColor(option: .fourthColor)
        let restartButton = UIButton(nameIcon: "arrow.counterclockwise", sizeButton: 56, sizeIcon: 24, weightIcon: .bold, backgroundColor: color, tintColor: .white)
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        restartButton.startAnimatingPressActions()
        return restartButton
    }()

    func updateCornerRadius() {
        muteButton.layer.cornerRadius = muteButton.bounds.size.width / 2
        homeButton.layer.cornerRadius = homeButton.bounds.size.width / 2
        restartButton.layer.cornerRadius = restartButton.bounds.size.width / 2
        playButton.layer.cornerRadius = playButton.bounds.size.width / 2

        playButton.setCustomIcon(nameIcon: "play.fill", sizeIcon: (Int(playButton.bounds.size.width) / 2) + 5, weightIcon: .bold, tintColor: .white)
        homeButton.setCustomIcon(nameIcon: "house.fill", sizeIcon: (Int(homeButton.bounds.size.width) / 2) - 5, weightIcon: .bold, tintColor: .white)
        restartButton.setCustomIcon(nameIcon: "arrow.counterclockwise", sizeIcon: (Int(homeButton.bounds.size.width) / 2) - 5, weightIcon: .bold, tintColor: .white)
        updateMute()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(modal)
        self.addSubview(circle)
        self.addSubview(playButton)
        self.addSubview(homeButton)
        self.addSubview(muteButton)
        self.addSubview(restartButton)
        setupConstraint()
        updateCornerRadius()
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.addSubview(blur)
        self.backgroundColor = .clear
    }
    func setupConstraint() {
        NSLayoutConstraint.activate([
            modal.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            modal.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            modal.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            modal.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4),
            //            play
            playButton.centerXAnchor.constraint(equalTo: modal.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: modal.centerYAnchor, constant: -39.5),
//            playButton.heightAnchor.constraint(equalToConstant: playButton.bounds.size.height),
//            playButton.widthAnchor.constraint(equalToConstant: playButton.bounds.size.width),
            playButton.heightAnchor.constraint(equalTo: modal.heightAnchor, multiplier: 0.351),
            playButton.widthAnchor.constraint(equalTo: playButton.heightAnchor),
            //            circle
            circle.centerXAnchor.constraint(equalTo: playButton.centerXAnchor),
            circle.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            circle.heightAnchor.constraint(equalTo: playButton.heightAnchor),
            //            home
            homeButton.heightAnchor.constraint(equalTo: modal.heightAnchor, multiplier: 0.207),
            homeButton.widthAnchor.constraint(equalTo: homeButton.heightAnchor),
            homeButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 17),
            homeButton.leadingAnchor.constraint(equalTo: modal.leadingAnchor, constant: 28),
            //            speaker
                        muteButton.heightAnchor.constraint(equalTo: modal.heightAnchor, multiplier: 0.207),
                        muteButton.widthAnchor.constraint(equalTo: muteButton.heightAnchor),
            muteButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 45),
            muteButton.centerXAnchor.constraint(equalTo: modal.centerXAnchor),
            //            restart
            restartButton.heightAnchor.constraint(equalTo: modal.heightAnchor, multiplier: 0.207),
            restartButton.widthAnchor.constraint(equalTo: restartButton.heightAnchor),
            restartButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 17),
//            restartButton.leadingAnchor.constraint(greaterThanOrEqualTo: muteButton.trailingAnchor, constant: 19),
            restartButton.trailingAnchor.constraint(equalTo: modal.trailingAnchor, constant: -28)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
