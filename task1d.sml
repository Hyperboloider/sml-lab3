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
    
type FullName = {
    first   :string, 
    middle  :string, 
    last    :string
}

fun similar_names (variations: string list list, name: FullName) = 
    let 
    val {first, middle, last} = name
    fun helper(acc: FullName list, substitutions: string list) =
        case substitutions of
            [] => acc
            | x::xs => helper({first=x, middle=middle, last=last} :: acc, xs)
    in
        helper([name], get_substitutions2(first, variations))
    end;
    
similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", last="Smith", middle="W"})

(*
    [{first="Fredrick",last="Smith",middle="W"},
    {first="F",last="Smith",middle="W"},
    {first="Freddie",last="Smith",middle="W"},
    {first="Fred",last="Smith",middle="W"}] : FullName list
*)