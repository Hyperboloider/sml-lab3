datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

fun card_color(card: card) = 
    let val (suit, rank) = card
    in
        case suit of
        Clubs => Black
        | Diamonds => Red
        | Hearts => Red
        | Spades => Black
    end;
    
card_color((Clubs, Jack));
card_color((Diamonds, Jack));
card_color((Hearts, Jack));
card_color((Spades, Jack));

(*
    val it = Black : color
    val it = Red : color
    val it = Red : color
    val it = Black : color
*)