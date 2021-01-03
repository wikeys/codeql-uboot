
import cpp

// from MacroInvocation mi, Function func
// where
//     mi.getTarget() = func and
//     func.getName() = "memcpy"
// select mi

// from MacroInvocation mi
// where mi.getTarget().getName() in  ["ntohs","ntohl","ntohll"]
// select mi  //使用集合表达式



// from MacroInvocation mi
// where mi.getMacro().getName() = "ntohs" 
//  or mi.getMacro().getName() = "ntohl"
//  or mi.getMacro().getName() = "ntohll"
// select mi  //使用集合表达式


from MacroInvocation mi
where mi.getMacro().getName().regexpMatch("ntoh(s|l|ll)")
select mi

