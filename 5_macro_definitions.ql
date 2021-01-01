import cpp

// from Macro m
// where m.getName().regexpMatch("ntoh(s|l|ll)")
// select m  //使用正则一步到位

from Macro m
where m.getName() = "ntohs" 
    or m.getName() = "ntohl"
    or m.getName() = "ntohll"   //or分开查询
select m
