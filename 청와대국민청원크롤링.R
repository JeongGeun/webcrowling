require(rvest)
url="https://www1.president.go.kr/petitions/1785?page=1"
temp=substr(url,1,nchar(url)-1)
url_ind=1:29630

sns=character()
for(i in 1:20)
{
    w_temp=read_html(paste0(temp,url_ind[i]))
    r_temp=html_nodes(w_temp,"#petitionsReply_area h4")
    u_txt=html_text(r_temp)
    u_txt=substr(u_txt,1,nchar(u_txt)-6)
    sns=c(sns,u_txt)  
}
head(sns)
tot=table(sns)
x=c(27,49,118,6)
x11()
totpie=pie(tot,labels=paste0(names(tot),"(",round(x/sum(x)*100,1),"%",")"),main="SNS로그인서비스 사용빈도", col = c("blue","yellow" ,"green","skyblue" ))
legend("topright",legend=names(tot),fill=c("blue","yellow" ,"green","skyblue" ))
barplot(tot,xlab="SNS",ylab="로그인한 사람 수",main="SNS로그인서비스 사용빈도",col = c("blue","yellow" ,"green","skyblue" ))

url="https://www1.president.go.kr/petitions/18278?page=1"
temp2=substr(url,1,nchar(url)-1)
url_ind2=1:29630
sns2=character()
for(i in 1:20)
{
  w_temp=read_html(paste0(temp2,url_ind2[i]))
  r_temp=html_nodes(w_temp,"#petitionsReply_area h4")
  u_txt=html_text(r_temp)
  u_txt=substr(u_txt,1,nchar(u_txt)-6)
  sns2=c(sns2,u_txt)  
}

head(sns2)
x2=c(26,47,107,20)
tot2=table(sns2)
tot2
x11()
totpie=pie(tot2,labels=paste0(names(tot2),"(",round(x2/sum(x2)*100,1),"%",")"),main="SNS로그인서비스 사용빈도", col = c("blue","yellow" ,"green","skyblue" ))
legend("topright",legend=names(tot),fill=c("blue","yellow" ,"green","skyblue" ))
barplot(tot2,xlab="SNS",ylab="로그인한 사람 수",main="SNS로그인서비스 사용빈도",col = c("blue","yellow" ,"green","skyblue" ))




toc3=vector()
tot3=tot+tot2
x3=c(53,96,225,26)
x11()
totpie=pie(tot3,labels=paste0(names(tot3),"(",round(x3/sum(x3)*100,1),"%",")"),main="SNS로그인서비스 사용빈도", col = c("blue","yellow" ,"green","skyblue" ))
legend("topright",legend=names(tot3),fill=c("blue","yellow" ,"green","skyblue" ))
barplot(tot3,xlab="SNS",ylab="로그인한 사람 수",main="SNS로그인서비스 사용빈도",col = c("blue","yellow" ,"green","skyblue" ),ylim=c(0,250))
