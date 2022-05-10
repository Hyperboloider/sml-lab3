(*
(b) Напишіть функцію get_substitutions1, яка приймає string list list (список списків рядків, замін ) 
і string s і повертає string list. Результат містить всі рядки, які є в якомусь із списків  замін, 
які також мають s, але сам s не повинен бути в результаті.
*)

fun same_string(s1 : string, s2 : string) =
    s1 = s2
    
fun all_except_option (str: string, strings: string list) =
    case strings of
        [] => NONE
        | x::xs => 
            if same_string(str, x) then SOME(xs)
            else 
                case all_except_option(str, xs) of
                    NONE => NONE
                    | SOME xx => SOME(x::xx); 

fun get_substitutions1(str: string, lists: string list list) =
    case lists of
        [] => []
        | (x::xs) => case all_except_option(str, x) of
            NONE => get_substitutions1(str, xs)
            | SOME(lst) => lst @ get_substitutions1(str, xs);
            
get_substitutions1("Jeff", [["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]]);
(* val it = ["Jeffrey","Geoff","Jeffrey"] : string list *)