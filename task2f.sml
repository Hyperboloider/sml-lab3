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

fun score(hand: card list, goal: int) = 
    let val sum = sum_cards(hand)
        fun intermediate_score(cards: card list) = 
            if sum > goal 
                then 3 * (sum - goal)
                else goal - sum
    in
        if all_same_color(hand)
            then intermediate_score(hand)
            else intermediate_score(hand) div 2
    end;
    
score([(Hearts, Num 2), (Clubs, Num 4), (Clubs, Ace)], 16);
score([(Hearts, Num 2), (Clubs, Num 4), (Clubs, Ace)], 14);
score([(Spades, Num 2), (Clubs, Num 4), (Clubs, Ace)], 14);

(*
    val it = 3 : int
    val it = 9 : int
    val it = 4 : int
*)