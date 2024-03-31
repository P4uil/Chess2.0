//
//  ChessEngine.swift
//  Chess
//
//  Created by Павел Тоцкий on 31.03.2024.
//

import Foundation

struct ChessEngine{
    var pieces: Set<ChessPiece> =  Set<ChessPiece>()
    var whitesTurn: Bool = true
    
    mutating func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        
        if !canMovePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow){
            return
        }
        
        guard let candidate = pieceAt(col: fromCol, row: fromRow) else {
            return
        }
        
        if let target = pieceAt(col: toCol, row: toRow) {
            if target.isWhite == candidate.isWhite {
                return
            }
            pieces.remove(target)
        }
        
        pieces.remove(candidate)
        pieces.insert(ChessPiece(row: toRow, col: toCol, imageName: candidate.imageName, isWhite: candidate.isWhite))
        
        whitesTurn = !whitesTurn
    }
    
    func canMovePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        if fromCol == toCol && fromRow == toRow {
            return false
        }
        
        guard let candidate = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }
        
        if candidate.isWhite != whitesTurn{
            return false
        }
        
        return true
    }
    
    func pieceAt(col: Int, row: Int) -> ChessPiece? {
        for piece in pieces{
            if col == piece.col && row == piece.row{
                return piece
            }
        }
        
        return nil
    }
    
    mutating func initializeGame() {
        whitesTurn = true
        
        pieces.removeAll()
        
        for i in 0..<2 {
            pieces.insert(ChessPiece(row: 0, col: i * 7, imageName: "Chess_Black_Rook", isWhite: false))
            pieces.insert(ChessPiece(row: 7, col: i * 7, imageName: "Chess_White_Rook", isWhite: true))
            pieces.insert(ChessPiece(row: 0, col: 1 + i * 5, imageName: "Chess_Black_Knight", isWhite: false))
            pieces.insert(ChessPiece(row: 7, col: 1 + i * 5, imageName: "Chess_White_Knight", isWhite: true))
            pieces.insert(ChessPiece(row: 0, col: 2 + i * 3, imageName: "Chess_Black_Bishop", isWhite: false))
            pieces.insert(ChessPiece(row: 7, col: 2 + i * 3, imageName: "Chess_White_Bishop", isWhite: true))
        }
        
        pieces.insert(ChessPiece(row: 0, col: 3, imageName: "Chess_Black_Queen", isWhite: false))
        pieces.insert(ChessPiece(row: 7, col: 3, imageName: "Chess_White_Queen", isWhite: true))
        pieces.insert(ChessPiece(row: 0, col: 4, imageName: "Chess_Black_King", isWhite: false))
        pieces.insert(ChessPiece(row: 7, col: 4, imageName: "Chess_White_King", isWhite: true))
        
        for col in 0..<8 {
            pieces.insert(ChessPiece(row: 1, col: col, imageName: "Chess_Black_Pawn", isWhite: false))
            pieces.insert(ChessPiece(row: 6, col: col, imageName: "Chess_White_Pawn", isWhite: true))
        }
        
    }
}
