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
            then intermediate_score(hand) div 2
            else intermediate_score(hand)
    end;
    
fun remove_card(card: card, hand: card list) = 
    case hand of
    [] => raise IllegalMove
    | x::xs => if x = card then xs
        else case remove_card(card, xs) of
            [] => [x]
            | xxs => x::xxs;
    
fun officiate(deck: card list, moves: move list, goal: int) = 
    let fun make_moves(deck: card list, moves: move list, hand: card list) = 
        case moves of
            [] => hand
            | current_move::other_moves =>
                case current_move of
                    Discard(card) => make_moves(deck, other_moves, remove_card(card, hand))
                    | Draw => case deck of
                        [] => hand
                        | top::rest => if sum_cards(top::hand) > goal then top::hand
                            else make_moves(rest, other_moves, top::hand);
    in
        score(make_moves(deck, moves, []), goal)
    end;

officiate([(Clubs, Ace), (Hearts, Num(10)), (Spades, Jack)], [Draw, Draw, Discard(Hearts, Num(10))], 12);
officiate([(Clubs, Ace), (Hearts, Num(10)), (Spades, Jack)], [Draw, Discard(Clubs, Ace), Draw], 12);
officiate([(Clubs, Ace), (Hearts, Num(10)), (Spades, Jack)], [Draw, Discard(Spades, Jack), Draw], 12);

(*
    val it = 27 : int
    val it = 1 : int

    uncaught exception IllegalMove
*)