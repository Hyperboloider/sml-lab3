(*
Напишіть функцію get_substitutions2, схожу на get_substitutions1, за винятком того, що вона використовує хвостову рекурсивну локальну допоміжну функцію.
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

fun get_substitutions2(str: string, lists: string list list) =
    let fun helper(xs: string list list, acc: string list) =
        case xs of
            [] => acc
            | (x::xxs) => case all_except_option(str, x) of
                NONE => helper( xxs, acc)
                | SOME(lst) => helper(xxs, lst @ acc)
    in
        helper(lists, [])
    end;
    
get_substitutions2("Jeff", [["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]]);
(*
val it = ["Geoff","Jeffrey","Jeffrey"] : string list
*)