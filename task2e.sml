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

fun sum_cards(hand: card list) = 
    let fun reduce(cards: card list, acc: int) = 
        case cards of
        [] => acc
        | x::xs => reduce(xs, acc + card_value(x))
    in
        reduce(hand, 0)
    end;
        
sum_cards([(Clubs, Num(6)), (Clubs, Num(6)), (Clubs, Jack)]);
sum_cards([(Clubs, Num(10))]);
sum_cards([]);

(*
    val it = 22 : int
    val it = 10 : int
    val it = 0 : int
*)
