//
//  BoardView.swift
//  Chess
//
//  Created by Павел Тоцкий on 31.03.2024.
//

import Foundation
import UIKit

class BoardView: UIView {
    
    let ratio: CGFloat = 1
    var originX: CGFloat = 1
    var originY: CGFloat = 1
    var cellSide: CGFloat = 1
    
    var shadowPieces: Set<ChessPiece> = Set<ChessPiece>()
    var chessDelegate: ChessDelegate? = nil
    
    var fromCol: Int? = nil
    var fromRow: Int? = nil
    
    var movingImage: UIImage? = nil
    var movingPieceX: CGFloat = -1
    var movingPieceY: CGFloat = -1
    
    var blackAtTop = true
    
    override func draw(_ rect: CGRect) {
        cellSide = bounds.width * ratio / 8
        originX = bounds.width * (1 - ratio) / 2
        originY = bounds.height * (1 - ratio) / 2
        
        drawBoard()
        drawPieces()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location (in: self)
        
        fromCol = p2p(Int((fingerLocation.x - originX) / cellSide))
        fromRow = p2p(Int((fingerLocation.y - originY) / cellSide))
        
        print("(\(String(describing: fromCol)), \(String(describing: fromRow)))")
        
        if let fromCol = fromCol, let fromRow = fromRow,let movingPice = chessDelegate?.pieceAt(col: fromCol, row: fromRow) {
                movingImage = UIImage(named: movingPice.imageName)
            }
        }
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            let first = touches.first!
            let fingerLocation = first.location (in: self)
            print(fingerLocation)
            
            
            movingPieceX = fingerLocation.x
            movingPieceY = fingerLocation.y
            setNeedsDisplay()
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            let first = touches.first!
            let fingerLocation = first.location (in: self)
            
            let toCol: Int = p2p(Int((fingerLocation.x - originX) / cellSide))
            let toRow: Int = p2p(Int((fingerLocation.y - originY) / cellSide))
            print("(\(toCol), \(toRow))" )
            
            if let fromCol = fromCol, let fromRow = fromRow, fromCol != toCol || fromRow != toRow{
                chessDelegate?.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow )
            }
            
            movingImage = nil
            fromCol = nil
            fromRow = nil
            setNeedsDisplay()
        }
        
        func drawPieces() {
            for piece in shadowPieces where !(fromCol == piece.col &&  fromRow == piece.row){
                let pieceImage = UIImage(named: piece.imageName)
                
                pieceImage?.draw(in: CGRect(x: originX + CGFloat(p2p(piece.col)) * cellSide, y: originY + CGFloat(p2p(piece.row)) * cellSide, width: cellSide, height: cellSide))
            }
            movingImage?.draw(in: CGRect(x: movingPieceX - cellSide/2, y: movingPieceY - cellSide/2, width: cellSide, height: cellSide))
        }
        
        func drawBoard() {
            for row in 0..<4 {
                for col in 0..<4 {
                    drawSquare(col: col * 2, row: row * 2, color: UIColor.systemBrown)
                    drawSquare(col: 1 + col * 2, row: row * 2, color: UIColor.brown)
                    drawSquare(col: col * 2, row: 1 + row * 2, color: UIColor.brown)
                    drawSquare(col: 1 + col * 2, row: 1 + row * 2, color: UIColor.systemBrown)
                }
            }
        }
        
        func drawSquare(col: Int, row: Int, color: UIColor) {
            let path = UIBezierPath(rect: CGRect(x: originX + CGFloat(col) * cellSide, y: originY + CGFloat(row) * cellSide, width: cellSide, height: cellSide))
            color.setFill()
            path.fill()
        }
    
        func p2p(_ coordinate: Int) -> Int {
            return blackAtTop ? coordinate : 7 - coordinate
        }
    
    }
