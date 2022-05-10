datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

fun remove_card(card: card, hand: card list) = 
    case hand of
    [] => raise IllegalMove
    | x::xs => if x = card then xs
        else case remove_card(card, xs) of
            [] => [x]
            | xxs => x::xxs;
        
remove_card((Clubs, Jack), [(Clubs, Num(6)), (Clubs, Num(6)), (Clubs, Jack)]);
remove_card((Clubs, Jack), [(Clubs, Num(6)), (Clubs, Jack), (Clubs, Num(6))]);
remove_card((Clubs, Jack), [(Clubs, Jack), (Clubs, Num(6)), (Clubs, Num(6))]);
remove_card((Clubs, Queen), [(Clubs, Num(6)), (Clubs, Num(6)), (Clubs, Jack)]);

(*
    val it = [(Clubs,Num 6),(Clubs,Num 6)] : card list
    val it = [(Clubs,Num 6),(Clubs,Num 6)] : card list
    val it = [(Clubs,Num 6),(Clubs,Num 6)] : card list

    uncaught exception IllegalMove
*)