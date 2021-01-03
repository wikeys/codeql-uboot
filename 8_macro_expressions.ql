import cpp

from MacroInvocation mi
where mi.getMacro().getName().regexpMatch("ntoh(s|l|ll)")
select mi.getExpr() //getExpr寻找表达式，也就是ntoh(xxxx)，二者差不多