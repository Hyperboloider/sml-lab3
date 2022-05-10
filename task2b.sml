datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

fun card_value(card: card) = 
    let val (suit, rank) = card
    in
        case rank of
        Ace => 11
        | King => 10
        | Queen => 10
        | Jack => 10
        | Num(i) => i
    end;
    

card_value((Clubs, Ace));
card_value((Clubs, King));
card_value((Clubs, Queen));
card_value((Clubs, Jack));
card_value((Clubs, Num(4)));

(*
    val it = 11 : int
    val it = 10 : int
    val it = 10 : int
    val it = 10 : int
    val it = 44 : int
*)