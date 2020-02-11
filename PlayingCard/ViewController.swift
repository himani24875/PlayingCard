//
//  ViewController.swift
//  PlayingCard
//
//  Created by Himani on 05/12/19.
//  Copyright © 2019 Himani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    
    @IBOutlet weak var cardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left, .right]
            cardView.addGestureRecognizer(swipe)
            
            let pinch = UIPinchGestureRecognizer(target: cardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognized:)))
            
            cardView.addGestureRecognizer(pinch)
        }
    }
    
    
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            cardView.isFaceUp = !cardView.isFaceUp
        default:
            break
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func nextCard() {
        if let card = deck.draw() {
            cardView.rank = card.rank.order
            cardView.suit = card.suit.rawValue
        }
    }

}

