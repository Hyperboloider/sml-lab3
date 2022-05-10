(*
(a) Напишіть функцію all_except_option, яка приймає string  і string list. 
Поверніть NONE, якщо рядка немає у списку, інакше поверніть SOME lst, 
де lst ідентичний списку аргументів, за винятком того, що рядка в ньому немає. 
Ви можете вважати, що рядок є в списку щонайбільше один раз. 
Використовуйте рядок, наданий вам, для порівняння рядків. 
Приклад рішення становить близько 8 строк. 
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

all_except_option("test", ["test", "second", "third"]);
all_except_option("test", ["first", "second", "third"]);
all_except_option("test", []);

(*
    val it = SOME ["second","third"] : string list option
    val it = NONE : string list option
    val it = NONE : string list option
*)