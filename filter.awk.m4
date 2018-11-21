# vim: syn=m4
m4_divert(KILL)
m4_define([TIMESTAMP],[[[0-9]]{2}:[[0-9]]{2}:[[0-9]]{2}.[[0-9]]{6}])
m4_define([PROTO],[[[A-Z]]+])
m4_define([SRC],[[[0-9]]{1[,]3}.[[0-9]]{1[,]3}.[[0-9]]{1[,]3}.[[0-9]]{1[,]3}])
m4_define([DEST],[SRC])
m4_define([SRC_PORT],[[[0-9]]+])
m4_define([DEST_PORT],[SRC_PORT])
m4_define([ID],[[[0-9]]+[[+%]]])
m4_define([FLAGS],[@<:@[[0-9a-z]]+@:>@])
m4_define([RR_TYPE],[[[A-Z]]+\?])
m4_define([QUERY],[[[a-zA-Z0-9.]+.]])
m4_define([LEN],[\@{:@[[0-9]]+\@:}@])
m4_divert(GROW)dnl
m4_normalize([
    match($0,/(]TIMESTAMP[)\s(]PROTO[)\s(]SRC[).(]SRC_PORT[)\s>\s]DEST[.]DEST_PORT[:\s]ID[\s]FLAGS[\s]RR_TYPE[\s(]QUERY[)\s]LEN[/,matches){
        print
            "insert into query (timestamp,proto,src_ip,src_port,query) values ("
                "'"matches@<:@1@:>@"',"
                "'"matches@<:@2@:>@"',"
                "'"matches@<:@3@:>@"',"
                matches@<:@4@:>@","
                "'"matches@<:@5@:>@"'"
            ");";
            system("") dnl prevent line buffering output
    } 
])
