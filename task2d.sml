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

fun all_same_color(hand: card list) = 
    case hand of
    [] => true
    | x::[] => true
    | head::neck::tail => if card_color(head) = card_color(neck)
        then all_same_color(neck::tail)
        else false;
        
all_same_color([(Clubs, Num(6)), (Clubs, Ace), (Spades, Queen)]);
all_same_color([(Clubs, Num(6)), (Diamonds, Ace), (Spades, Queen)]);

(*
    val it = true : bool
    val it = false : bool
*)