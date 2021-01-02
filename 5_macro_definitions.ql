import cpp

// from Macro m
// where m.getName() = "ntohs" 
//     or m.getName() = "ntohl"
//     or m.getName() = "ntohll"   //最简单的or分开查询
// select m

// from Macro m
// where m.getName().regexpMatch("ntoh(s|l|ll)")
// select m  //使用正则一步到位


from Macro m
where m.getName() in  ["ntohs","ntohl","ntohll"]
select m  //使用集合表达式
