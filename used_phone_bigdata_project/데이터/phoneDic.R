library(stringi)
library(stringr)

# 데이터 전처리 및 컬럼 생성
Sys.setlocale("LC_ALL", "ko_KR.UTF-8") # 한글 인코딩 가능하게 해줌
tong_origin = read.csv("newdata6.csv", header = T, encoding="utf-8")
tong = tong_origin
tong$contents <- str_to_lower(tong$contents)
tong$제목 <- str_to_lower(tong$제목)
tong$상세설명 <- str_to_lower(tong$상세설명)
new_columns <- c("제품명", "용량", "출고가", "제조사")
tong[,new_columns] <- NA



# 제목에서 폰명 검색, 제품명 달아주기
# 2.LG AKA 
product_name = "aka"
maker_name = "lg"
AKA = c("aka 폰", "aka폰", "aka", "아카폰", "아카 폰", "lg 아카 폰",
        "lg 아카폰", "lg아카폰", "lg aka 폰", "lg aka폰", "lgaka폰", "aka phone", "aka lg Phone", "lg-f520k")

# 3. LG Band play 
product_name = "band play"
maker_name = "lg"
BandPlay = c("band play", "bandplay", "밴드 플레이 폰", "밴드플레이 폰", "밴드플레이폰", "벤드 플레이 폰",
             "벤드플레이 폰", "벤드플레이폰", "band play phone", "bandplay phone", "band play 폰", "bandplay 폰",
             "lg 벤드 플레이 폰", "lg 벤드플레이 폰", "lg 밴드 플레이 폰", "lg 밴드 플레이", "lg band play", "lg bandplay",
             "lg 벤드 플레이", "lg 밴드 플레이", "lg-f570s"
)

# 4. Be Y Phone
product_name = "Be Y Phone"
maker_name = "화웨이"
BeYPhone = c("be y Phone", "bey phone", "비와이 폰", "비 와이 폰", "비와이폰", "비 와이폰", "bey폰",
             "bey 폰", "be y폰", "be y 폰", "be y phone", "bey phone", "be yphone", "beyphone",
             "비와이", "비 와이", "be y", "hw-vns-l62", "hw-vns-l62b", "화웨이 비와이 폰", "화웨이 비 와이 폰", "화웨이 비 와이")

# 5. BlackBerry Priv
product_name = "blackberry priv"
maker_name = "blackberry"
blackberryPriv = c("blackberry priv", "블랙베리 프리브", "블랙베리프리브", "블랙배리 프리브", "블랙배리프리브", "블랙베리 프리브",
                   "STV100-3_OMD")

# 6. F70
product_name = "f70"
maker_name = "lg"
F70 = c("lg-f370k", "lg-f370s", "lg-f370l", "lg-f70", "lg f70 phone", "lg f70 폰", "lg f70폰", "f70폰", "f70 폰", "f70 phone",
        "엘쥐f70폰", "엘지 f70 폰", "엘지 f70폰", "엘지f70폰"
)

# 7.G Flex
product_name = "g flex"
maker_name = "lg"
gFlexKT = c("g flex", "g-flex", "지 플렉스", "지-플렉스", "엘지지플렉스", "지플렉스", "지플렉스폰", "g-flex폰", "LG-F340K", "lg-f340s")


# 8. G Flex 2
product_name = "g flex 2"
maker_name = "lg"
gFlex2 = c("g-flex2", "g-flex 2", "g flex 2", "g flex2", "지플렉스 2", "지 플렉스 2", "지플렉스2", "지 플렉스2",
           "쥐플렉스2", "쥐-플렉스2", "쥐 플렉스2","쥐 플렉스 2", "g-flex2폰", "g flex2폰"
)

# 9. G Stylo
product_name = "g stylo"
maker_name = "lg"
gStylo = c("g stylo", "gstylo", "지스타일로", "지 스타일로", "g stylo폰", "gstylo폰", "지스타일로폰", "지 스타일로폰", "lg지스타일로"
           ,"lg지스타일로폰","lg-f560k","lg지 스타일로폰")

# 10. G3
product_name = "g3"
maker_name = "lg"
g3 = c("g3", "g쓰리", "지3", "지쓰리", "lgg3", "lg지쓰리", "지 쓰리", "lg지 쓰리", "g3폰", "g쓰리폰", "지쓰리폰", "lgg3폰",
       "lg지쓰리폰", "지 쓰리폰", "lg지 쓰리폰", "lg-f400S", "LG-F400S")

# 11. G3 Beat
product_name = "g3 beat"
maker_name = "lg"
g3Beat = c("g3 beat", "g3beat", "g3-beat", "g쓰리beat", "지쓰리비트", "g쓰리비트", "g3비트", "지3beat", "지3비트", "lgg3beat",
           "lgg3 beat", "lgg3-beat", "lgg쓰리beat", "lg지쓰리비트", "lgg쓰리비트", "lgg3비트", "lg지3beat", "lg지3비트", "g3 beat폰",
           "g3beat폰", "g3-beat폰", "g쓰리beat폰", "지쓰리비트폰", "g쓰리비트폰", "g3비트폰", "지3beat폰", "지3비트폰", "lgg3beat폰",
           "lg3 beat폰", "lgg3-beat폰", "lgg쓰리beat폰", "lg지쓰리비트폰", "lgg쓰리비트폰", "lgg3비트폰", "lg지3beat폰", "lg지3비트폰",
           "lg-f470k", "lg-f470s"
)

# 12. G3 Cat.6
product_name = "g3 Cat.6"
maker_name = "lg"
g3Cat6 = c("g3cat6","g3 cat6", "g3 cat 6", "지3cat6", "g쓰리cat6", "g쓰리 cat6", "g쓰리 cat 6", "g3캣6", "g 3캣6", "g3 캣6", "g3캣 6", "g3cat식스", "g 3cat식스",
           "g3 cat식스", "g3cat 식스", "g3cat 식스", "지쓰리cat6", "지 쓰리cat6", "지쓰리 cat6", "지쓰리cat 6", "지3캣6", "지 3캣6", "지3 캣6", "지3캣 6",
           "지3cat6", "지 3cat6", "지3 cat6", "지3cat 6", "lgg3cat6", "lgg3 cat6", "lgg3cat 6", "엘지g3cat6", "엘지g3 cat6", "엘지g3cat 6",
           "g3cat6폰","g3 cat6폰", "g3 cat 6폰", "지3cat6폰", "g쓰리cat6폰", "g쓰리 cat6폰", "g쓰리 cat 6폰", "g3캣6폰", "g 3캣6폰", "g3 캣6폰", "g3캣 6폰", "g3cat식스폰", "g 3cat식스",
           "g3 cat식스폰", "g3cat 식스폰", "g3cat 식스폰", "지쓰리cat6폰", "지 쓰리cat6폰", "지쓰리 cat6폰", "지쓰리cat 6폰", "지3캣6폰", "지 3캣6폰", "지3 캣6폰", "지3캣 6폰",
           "지3cat6폰", "지 3cat6폰", "지3 cat6폰", "지3cat 6폰", "lgg3cat6폰", "lgg3 cat6폰", "lgg3cat 6폰", "엘지g3cat6폰", "엘지g3 cat6폰", "엘지g3cat 6폰",
           "lg-f460k"
)

# 13. G3A
product_name = "g3a"
maker_name = "lg"
g3a = c("g3a", "g3 a", "g 3a", "지3a", "지 3a", "지3 a", "g쓰리a", "g 쓰리a", "g쓰리 a", "g3에이", "g 3에이", "g3 에이",
        "지쓰리a", "지 쓰리a", "지쓰리 a", "지쓰리에이", "지 쓰리에이", "지쓰리 에이", "lgg3a", "lgg3 a", "lgg 3a", "lg지3a", "lg지 3a", "lg지3 a", "lgg쓰리a", "lgg 쓰리a", "lgg쓰리 a", "lgg3에이", "lgg 3에이", "lgg3 에이",
        "lg지쓰리a", "lg지 쓰리a", "lg지쓰리 a", "lg지쓰리에이", "lg지 쓰리에이", "lg지쓰리 에이","g3a폰", "g3 a폰", "g 3a폰", "지3a폰", "지 3a폰", "지3 a폰", "g쓰리a폰", "g 쓰리a폰", "g쓰리 a폰", "g3에이폰", "g 3에이폰", "g3 에이폰",
        "지쓰리a폰", "지 쓰리a폰", "지쓰리 a폰", "지쓰리에이폰", "지 쓰리에이폰", "지쓰리 에이폰", "lgg3a폰", "lgg3 a폰", "lgg 3a폰", "lg지3a폰", "lg지 3a폰", "lg지3 a폰", "lgg쓰리a폰", "lgg 쓰리a폰", "lgg쓰리 a폰", "lgg3에이폰", "lgg 3에이폰", "lgg3 에이폰",
        "lg지쓰리a폰", "lg지 쓰리a폰", "lg지쓰리 a폰", "lg지쓰리에이폰", "lg지 쓰리에이폰", "lg지쓰리 에이폰", "lg-f410s"
)
# 14. G4 -> 통신사 별로 가격 다름
product_name = "g4"
maker_name = "lg"
g4 = c("g4", "지4", "지포","g 4", "지 4", "지 포", "g포", "g 포", "lgg4", "lg지4", "lg지포","lgg 4", "lg지 4", "lg지 포", "lgg포", "lgg 포",
       "g4폰", "지4폰", "지포폰","g 4폰", "지 4폰", "지 포폰", "g포폰", "g 포폰", "lgg4폰", "lg지4폰", "lg지포폰","lgg 4폰", "lg지 4폰", "lg지 포폰", "lgg포폰", "lgg 포폰",
       "lg-f500k", "lg-f500kc", "lg-f500s", "lg-f500l"
)
# 15. Galaxy A3 2016
dic15 = c("a3 2016", "a3(2016)", "a3 (2016)", "2016 a3", "2016년 a3", "a3 2016년")

# 16. 갤럭시 j3 (2016)
dic16 = c("j3 2016", "j3(2016)", "j3 (2016)", "2016 j3", "2016년 j3", "j3 2016년") 

# 17. 갤럭시 j5 (2017)
dic17 = c("j5 2017", "j5(2017)", "j5 (2017)", "2017 j5", "2017년 j5", "j5 2017년")

# 18. 갤럭시 j7 (2017)
dic18 = c("j7 2017", "j7(2017)", "j7 (2017)", "2017 j7", "2017년 j7", "j7 2017년")

# 19. 노트FE
dic19 = c("노트fe", "노트 fe", "note fe", "notefe", "놋fe", "놋 fe", "갤놋fe", "겔놋fe",
          "sm-n935s", "sm n935s", "smn935s")

# 20 갤럭시 on7 (2016) - 있음

# 21 Galaxy S Ⅲ 16G

# 22 Galaxy Tab A 10.1

# 23 Galaxy Tab S3 LTE


# 24. G PRO2
product_name = "g pro2"
maker_name = "lg"
gpro2 = c("gpro2", "gpro2폰", "g pro2", "g pro 2", "지프로2", "지프로2폰", "지 프로2", "지 프로2폰", "g 프로2", "g 프로 2", "쥐프로2",
          "쥐프로2폰", "g프로2폰", "g 프로2폰", "lg-f350s"
)

# 25 IM-100

# 26 iPhone 5

# 27. iPhone 5s

# 28. 아이폰6
product_name = "iphone6"
maker_name = "애플"
dic28 = c("아이폰 6s", "아이폰6s", "iphone 6s", "iphone_6s","iphone6s")

# 29. 아이폰6s+
product_name = "iphone6"
maker_name = "애플"
dic29 = c("아이폰 6s+", "아이폰6s+", "iphone 6s+", "iphone_6s+"
          ,"iphone6s+","아이폰6 플러스","아이폰 6플러스","아이폰 6 플러스",
          "iphone 6 플러스","iphone6 플러스")

# 30. iPhone 7
dic30 = c("아이폰7", "아이폰 7", "iphone7", "iphone 7", "i폰7", "i 폰7", "i 폰 7", "아이phone7", "아이phone 7",
          "i phone 7", "아이폰세븐", "아이폰 세븐")

# 31. iphone 7 plus
dic31 = c("아이폰7+", "아이폰 7+", "iphone7+", "iphone 7+", "i폰7+", "i 폰7+", "i 폰 7+", "아이phone7+", "아이phone 7+",
          "i phone 7+", "아이폰세븐+", "아이폰 세븐+", "아이폰 세븐 플러스", "아이폰7 플러스", "아이폰7플러스", "iphone7 플러스",
          "iphone 7 플러스", "iphone7플러스", "iphone 7플러스", "7+", "7 플러스", "7플러스", "세븐 플러스", "세븐플러스",
          "7 plus", "7plus", "iphone7plus", "세븐 plus", "세븐plus")

# 32. iphone SE 
dic1 = c("아이폰se", "아이폰 se", "iphone se", "i phone se", "AIPSE-16SG", "AIPSE-16RG" 
         ,"AIPSE-16SV", "AIPSE-16GD", "AIPSE-64GD", "AIPSE-64SV"
         ,"AIPSE-64RG", "AIPSE-64SG")

# 33. 헬로키티폰
dic4 = c("카뮤즈-헬로키티폰", "헬로키티폰", "키티폰", "카뮤즈 헬로키티폰", "헬로 키티 폰"
         , "카뮤즈 키티폰", "KM-K01S")

# 34. LG CLASS
dic5 = c("lg-class", "lg-class", "lg class", "lg 클래스", "lg-클래스", "엘지-클래스폰"
         , "엘지 클래스폰", "엘지 클래스", "엘지 클레스", "앨지 클래스", "앨지 클레스"
         , "엘지 클레스폰", "앨지 클래스폰", "앨지 클레스폰", "LG-F620K", "LG-F620S", "LG-F620L")

# 35. LG G2
dic8 = c("lg g2", "lg-g2", "엘지 g2", "앨지 g2", "g2폰", "lg g2폰", "지투"
         ,"엘지-g2", "앨지-g2", "LG-F320L")

# 36. LG G3 스크린
dic12 = c("g3-스크린", "g3 스크린", "스크린폰", "g3스크린", "LG-F490L")

# 37. G5
product_name = "g5"
maker_name = "lg"
g5 = c("g5", "g 5", "지5", "지 5", "g파이브", "g 파이브", "지파이브", "지 파이브", "lgg5", "lgg 5", "lg지5", "lg지 5", "lgg파이브", "lgg 파이브", "lg지파이브", "lg지 파이브",
       "g5폰", "g 5폰", "지5폰", "지 5폰", "g파이브폰", "g 파이브폰", "지파이브폰", "지 파이브폰", "lgg5폰", "lgg 5폰", "lg지5폰", "lg지 5폰", "lgg파이브폰", "lgg 파이브폰", "lg지파이브폰", "lg지 파이브폰",
       "lg-f700s"
)

# 38. LG G6
dic14 = c("lg-g6", "g6폰", "lg g6", "엘지 g6", "앨지 g6", "앨지-g6", "엘지-g6"
          , "엘쥐-g6", "앨쥐 g6", "엘쥐-g6", "LGM-G600S", "LGM-G600L"
          , "LGM-G600LR", "LGM-G600SR_32GG", "LGM-G600KR", "LGM-G600K")

# 39. LG G6 블랙에디션
dic15 = c("g6 블랙에디션", "g6 블랙애디션", "g6 블렉에디션", "g6 블렉애디션"
          , "g6 black edition", "g6-블랙에디션", "g6 블랙 에디션", "LGM-G600KFB")

# 40. LG G6+
dic16 = c("lg g6+", "lg-g6+", "g6+", "엘지 g6+", "앨지 g6+", "LGM-G600SP_128G", "LGM-G600KP")

# 41. LG GX
dic17 = c("lg gx", "lg-gx", "gx", "엘지 gx", "앨지 gx", "LG-F310LR", "LG-F310L")

# 42. LG K10
dic3 = c("lg k10", "k10", "k 10", "k-10", "lg k-10", "LG-F670S", "LG-F670L", "LG-F670K")

# 43. LG Stylus2
dic18 = c("lg stylus2",  "stylus2", "스타일러스", "스타일 러스", "stylus 2", "stylus-2", "LG-F720K")

# 44. LG V10
dic19 = c("lg v10", "엘지 v10", "앨지 v10", "앨지-v10", "엘지-v10", "LG-F600L", "LG-F600K")

# 45. LG V20
dic20 = c("lg v20", "엘지 v20", "앨지 v20", "앨지-v20", "엘지-v20", "LG-F800L", "LG-F800K")

# 46. LG X screen
dic21 = c("lg x-screen", "x-screen", "x screen", "엑스 스크린", "LG-F650K", "LG-F650L")

# 47. LG X skin
dic22 = c("lg x-skin", "x-skin", "x skin", "x-스킨", "x스킨", "LG-F740L")

# 48. LG X300
dic23 = c("lg x300", "lg-x300", "앨지 x300", "앨지-x300", "엘지-x300", "엘지 x300"
          , "LGM-K120L", "LGM-K120K", "LGM-K120S")

# 49. LG X400
dic24 = c("lg x400", "lg-x400", "앨지 x400", "앨지-x400", "엘지-x400", "엘지 x400"
          , "LGM-K121K", "LGM-K121S", "LGM-K121L")

# 50. LG X5
dic50 = c("lg x5", "lg-x5", "앨지 x5", "앨지-x5", "엘지-x5", "LG-F770S")

# 51. LG X500
dic51 = c("lg x500", "lg-x500", "앨지 x500", "앨지-x500", "엘지-x500", "엘지 x500"
          , "LGM-X320K", "LGM-X320S")

# 52. LG 아이스크림스마트
dic52 = c("아이스크림스마트", "아이스크림 스마트", "ice cream smart", "아이스 크림 스마트"
          ,"아이스크림 smart", "LG-F440L")

# 53. LG 젠틀
dic53 = c("lg 젠틀", "lg-gentle", "lg gentle", "lg-젠틀", "앨지-젠틀", "엘지-젠틀"
          , "앨지 잰틀", "엘지 잰틀", "엘지 젠틀", "LG-F580L")


# 54. LG-X-CAM

# 55. LG-U

# 56. LUNA

# 57. NEXUS 5X 

# 58. Nexus6p
dic59 = c("넥서스6p", "넥서스 6p", "nexus6p", "nexus 6p", "넥 6p", "넥6p", "h1512", "h-1512", "h 1512")

# 59. OMD SONY XZ
dic60 = c("sony xz", "sonyxz", "sonyxperiaxz", "xz", "엑스지", "엑스페리아 엑스지", "엑스페리아xz",
          "xperia xz", "sony xperia xz", "소니xz", "소니 xz","소니엑스지",
          "xz 소니", "xz소니", "소니엑스지", "소니 엑스페리아 엑스지", "엑스페리아 xz")

# 60. OMD SONY XZP(OMD SONY XZP)
dic61 = c("sony xzp", "sonyxzp", "sony xperia xzp", "sony xz premium", "sony xperia premium",
          "소니 xzp", "소니xzp", "소니 premium xz", "sony xzp", "xperia xzp",
          "소니 프리미엄 xz", "엑스페리아 XZ 프리미엄", "xperia xz premium",
          "xzp", "엑스지피", "엑스지 프리미엄", "xz 프리미엄", "xz프리미엄", "xz premium") 

# 61. q6
dic62 = c("q6", "큐6", "q식스", "qsix", "q six", "q 6", "큐식스", "큐 식스",
          "lgm-x600k", "lg x600k", "lg-x600k", "lgm x600k")

# 62. 키즈폰 준3 어벤져스 스페셜 에디션 - 추가 사전 필요
dic67 = c("sd-w530s", "sdw530s", "sd w530s")

# 63. # 20 갤럭시 on7 (2016)
dic20 = c("on7 2016", "on7(2016)", "on7 (2016)", "2016 on7", "2016년 on7", "on7 2016년")

# 64. 있음

# 65. 갤럭시S8
product_name = "galaxy8"
maker_name = "삼성전자"
dic70 = c("sm-g950nbk", "sm-g950ngr", "sm-g950nbe", "sm-g950nsr",
          "갤럭시 8", "갤8", "갤럭시8", "갤 8", "갤s8", "갤럭시s8", "겔럭시8",
          "겔럭시 s8", "겔8", "겔s8", "겔 s8", "갤 s8", "삼성 s8",
          "삼성 겔8", "삼성갤8", "삼성 갤8", "삼성갤 8", "삼성겔8", "삼성겔 8")


# 66. 갤럭시 wide2
dic72 = c("갤와이드2", "겔와이드2", "wide2", "wide 2", "와이드2", "와이드 2",
          "sm-j727s", "sm j727s", "smj727s")

# 67. Sol Prime
dic73 = c("sol prime", "solprime", "솔프라임", "솔 프라임", "쏠프라임", "쏠 프라임")

# 68. VU3
dic74 = c("뷰3", "뷰 3", "vu3", "vu 3", "lg-f300s", "lg f300s", "lgf300s")

# 69. X power
dic75 = c("엑스파워", "엑스 파워", "x-power", "x power", "xpower", "lg-f750k", "lg f750k", "lgf750k")

# 70.  Xperia X Performance
dic76 = c("sony xp", "sonyxp", "sonyxperiaxp","xperia xp", "sony xperia xp", "소니xp", "소니 xp","소니엑스피", "엑스페리아xp",
          "xp 소니", "xp소니","소니엑스피", "소니 엑스페리아 엑스피", "엑스페리아 xp", "소니 엑스페리아 xp",
          "xperia x performance", "엑스퍼포먼스", "x퍼포먼스", "X 퍼포먼스", "엑스 퍼포먼스",
          "엑스페리아 x 퍼포먼스", "소니 x 퍼포먼스", "x performance", "xperformance")

# 71. Xperia XP

# 72. Xperia XZ

# 73. Xperia Z2
dic79 = c("엑스페리아z2", "xperia z2", "소니 엑스페리아 z2", "엑스페리아 z2", "소니 z2", "소니z2")

# 74. Xperia Z3
dic80 = c("엑스페리아z3", "xperia z3", "소니 엑스페리아 z3", "엑스페리아 z3", "소니 z3", "소니z3")

# 75. XPR-C3

# 76. Y6
dic82 = c("y6", "y 6", "hw-scl-l32", "hw scl l32")

# 77. 갤럭시 A5 2015

# 78. 갤럭시 a5 (2017)
dic84 = c("a5 2017", "a5(2017)", "a5 (2017)", "2017 a5", "2017년 a5", "a5 2017년")

# 79. 갤럭시 A7 2015

# 80. 갤럭시 알파
dic86 = c("갤럭시 알파", "겔럭시 알파", "갤럭시알파", "galaxy alpha", "갤럭시 alpha", "갤럭시alpha")

# 81. 갤럭시 J5(센스)
product_name = "galaxy_j5"
maker_name = "삼성전자"
dic87 = c("sm-j500n00", "갤럭시센스", "갤럭시센스", "겔럭시센스", "겔럭시 센스", "갤럭시센스j5", "갤럭시센스 j5", "겔럭시센스j5", "겔럭시센스j5")

# 82. 갤럭시 j5 (2016)
dic88 = c("j5 2016", "j5(2016)", "j5 (2016)", "2016 j5", "2016년 j5", "j5 2016년")

# 83. 갤럭시 j7 (2016)
dic89 = c("j7 2016", "j7(2016)", "j7 (2016)", "2016 j7", "2016년 j7", "j7 2016년")


# 84. 갤럭시 그랜드맥스 & 맥스
product_name = "galaxy_grandmax"
maker_name = "삼성전자"
galaxy_grandmax = c("sm-g720n0", "갤그맥", "갤grandmax", "겔grandmax", "갤 grandmax", "겔 grandmax", 
                    "갤럭시그랜드맥스", "갤럭시 그랜드 맥스", "갤럭시 그랜드맥스",
                    "겔그맥", "겔그맥", "겔럭시그랜드맥스", "겔럭시 그랜드 맥스", "겔럭시 그랜드맥스",
                    "갤럭시grandmax", "갤럭시 grandmax", "galaxygrandmax","galaxy grandmax", "galaxy grand max",
                    "갤럭시 맥스", "겔럭시 맥스", "갤럭시맥스", "galaxy max", "갤럭시 max", "갤럭시max"
)

# 85. 갤럭시 라운드
dic91 = c("갤럭시 라운드", "겔럭시 라운드", "갤럭시라운드", "galaxy round", "갤럭시 round", "갤럭시round")

# 86. 갤럭시s4
dic92 = c("갤럭시 4", "갤4", "갤럭시4", "갤 4", "갤s4", "갤럭시s4", "겔럭시4", "겔럭시 4", "겔4", "겔s4", "겔 s4", "갤 s4", 
          "삼성 s4", "삼성 겔4", "삼성갤4", "삼성 갤4", "삼성갤 4", "삼성겔4", "삼성겔 4", "갤럭시 s4", "겔럭시 s4",
          "galaxy4", "galaxy 4")

# 87. 갤럭시 S4 LTE-A

# 88. 갤럭시 S5 광대역 LTE-A

# 89. 갤럭시 s6
ct_name = "galaxy6"
maker_name = "삼성전자"
dic95 = c("g920kw_64g", "sm-g920k", "sm-G920kw", "sm-g920l", "sm-g920l64",
          "갤럭시 6", "갤6", "갤럭시6", "갤 6", "갤s6", "갤럭시s6", "겔럭시6",
          "겔럭시 s6", "겔6", "겔s6", "겔 s6", "갤 s6", "삼성 s6",
          "삼성 겔6", "삼성갤6", "삼성 갤6", "삼성갤 6", "삼성겔6", "삼성겔 6")

# 90 갤럭시 s6 엣지
product_name = "galaxy6_edge"
maker_name = "삼성전자"
dic97 = c("sm-g925l", "sm-g925k", "sm-g925kw", "sm-g925l128", "sm-g925l64",
          "갤럭시 6 엣지", "갤럭시 6엣지", "갤럭시6 엣지", "갤럭시6엣지",
          "갤럭시6edge", "갤럭시 6edge", "갤럭시6 edge", "갤럭시 6 edge",
          "갤6엣지", "갤 6엣지", "갤6 엣지", "갤 6 엣지",  
          "갤6edge", "갤 6edge", "갤6 edge", "갤 6 edge",
          "갤s6엣지","갤 s6엣지", "갤 s6 엣지", "갤 s 6 엣지",
          "갤s6edge","갤 s6edge", "갤 s6 edge", "갤 s 6 edge", 
          "겔럭시6엣지", "겔럭시6 엣지", "겔럭시 6엣지", "겔럭시 6 엣지", 
          "겔럭시6edge", "겔럭시6 edge", "겔럭시 6edge", "겔럭시 6 edge",
          "겔6엣지", "겔 6엣지", "겔6 엣지", "겔 6 엣지", 
          "겔6edge", "겔 6edge", "겔6 edge", "겔 6 edge",
          "겔s6엣지", "겔 s6엣지", "겔s6 엣지", "겔 s6 엣지", "겔 s 6 엣지",
          "겔s6edge", "겔 s6edge", "겔s6 edge", "겔 s6 edge", "겔 s 6 edge",
          "갤s6엣지", "갤 s6엣지", "갤s6 엣지", "갤 s6 엣지", "갤 s 6 엣지", 
          "갤s6edge", "갤 s6edge", "갤s6 edge", "갤 s6 edge", "갤 s 6 edge",
          "삼성갤럭시 6 엣지", "삼성갤럭시 6엣지", "삼성갤럭시6 엣지", "삼성갤럭시6엣지",
          "삼성 갤럭시 6 엣지", "삼성 갤럭시 6엣지", "삼성 갤럭시6 엣지", "삼성 갤럭시6엣지",
          "삼성갤럭시6edge", "삼성갤럭시 6edge", "삼성갤럭시6 edge", "삼성갤럭시 6 edge",
          "삼성 갤럭시6edge", "삼성 갤럭시 6edge", "삼성 갤럭시6 edge", "삼성 갤럭시 6 edge",
          "삼성갤6엣지", "삼성갤 6엣지", "삼성갤6 엣지", "삼성갤 6 엣지",
          "삼성 갤6엣지", "삼성 갤 6엣지", "삼성 갤6 엣지", "삼성 갤 6 엣지",
          "갤럭시 6 앳지", "갤럭시 6앳지", "갤럭시6 앳지", "갤럭시6앳지",
          "갤6앳지", "갤 6앳지", "갤6 앳지", "갤 6 앳지",  
          "갤s6앳지","갤 s6앳지", "갤 s6 앳지", "갤 s 6 앳지", 
          "겔럭시6앳지", "겔럭시6 앳지", "겔럭시 6앳지", "겔럭시 6 앳지",
          "겔6앳지", "겔 6앳지", "겔6 앳지", "겔 6 앳지",
          "겔s6앳지", "겔 s6앳지", "겔s6 앳지", "겔 s6 앳지", "겔 s 6 앳지",
          "갤s6앳지", "갤 s6앳지", "갤s6 앳지", "갤 s6 앳지", "갤 s 6 앳지")

# 91. 갤럭시s7
# 갤럭시s7 (5정도 부터는 엣지/노트/+ 버전이 추가됨.. 1차 필터링 후 엣지/노트/+ 라는 단어 들어가면 제거해야 할듯.)
dic101 = c("갤럭시 7", "갤7", "갤럭시7", "갤 7", "갤s7", "갤럭시s7", "겔럭시7", "겔럭시 7", "겔7", "겔s7", "겔 s7", "갤 s7", 
           "삼성 s7", "삼성 겔7", "삼성갤7", "삼성 갤7", "삼성갤 7", "삼성겔7", "삼성겔 7", "갤럭시 s7", "겔럭시 s7",
           "galaxy7", "galaxy 7")

# 92. 갤럭시 S7 Edge
product_name = "galaxy7_edge"
maker_name = "삼성전자"
dic101 = c("sm-g935kpb_128g", "sm-g935kpk", "sm-g935ksr", "sm-g935kw", "g935kbe_64g", "g935kgd_64g",
           "갤럭시 7 엣지", "갤럭시 7엣지", "갤럭시7 엣지", "갤럭시7엣지",
           "갤럭시7edge", "갤럭시 7edge", "갤럭시7 edge", "갤럭시 7 edge",
           "갤7엣지", "갤 7엣지", "갤7 엣지", "갤 7 엣지",  
           "갤7edge", "갤 7edge", "갤7 edge", "갤 7 edge",
           "갤s7엣지","갤 s7엣지", "갤 s7 엣지", "갤 s 7 엣지",
           "갤s7edge","갤 s7edge", "갤 s7 edge", "갤 s 7 edge", 
           "겔럭시7엣지", "겔럭시7 엣지", "겔럭시 7엣지", "겔럭시 7 엣지", 
           "겔럭시7edge", "겔럭시7 edge", "겔럭시 7edge", "겔럭시 7 edge",
           "겔7엣지", "겔 7엣지", "겔7 엣지", "겔 7 엣지", 
           "겔7edge", "겔 7edge", "겔7 edge", "겔 7 edge",
           "겔s7엣지", "겔 s7엣지", "겔s7 엣지", "겔 s7 엣지", "겔 s 7 엣지",
           "겔s7edge", "겔 s7edge", "겔s7 edge", "겔 s7 edge", "겔 s 7 edge",
           "갤s7엣지", "갤 s7엣지", "갤s7 엣지", "갤 s7 엣지", "갤 s 7 엣지", 
           "갤s7edge", "갤 s7edge", "갤s7 edge", "갤 s7 edge", "갤 s 7 edge",
           "삼성갤럭시 7 엣지", "삼성갤럭시 7엣지", "삼성갤럭시7 엣지", "삼성갤럭시7엣지",
           "삼성 갤럭시 7 엣지", "삼성 갤럭시 7엣지", "삼성 갤럭시7 엣지", "삼성 갤럭시7엣지",
           "삼성갤럭시7edge", "삼성갤럭시 7edge", "삼성갤럭시7 edge", "삼성갤럭시 7 edge",
           "삼성 갤럭시7edge", "삼성 갤럭시 7edge", "삼성 갤럭시7 edge", "삼성 갤럭시 7 edge",
           "삼성갤7엣지", "삼성갤 7엣지", "삼성갤7 엣지", "삼성갤 7 엣지",
           "삼성 갤7엣지", "삼성 갤 7엣지", "삼성 갤7 엣지", "삼성 갤 7 엣지",
           "갤럭시 7 앳지", "갤럭시 7앳지", "갤럭시7 앳지", "갤럭시7앳지",
           "갤7앳지", "갤 7앳지", "갤7 앳지", "갤 7 앳지",  
           "갤s7앳지","갤 s7앳지", "갤 s7 앳지", "갤 s 7 앳지", 
           "겔럭시7앳지", "겔럭시7 앳지", "겔럭시 7앳지", "겔럭시 7 앳지",
           "겔7앳지", "겔 7앳지", "겔 7앳지", "겔 7 앳지",
           "겔s7앳지", "겔 s7앳지", "겔s7 앳지", "겔 s7 앳지", "겔 s 7 앳지",
           "갤s7앳지", "갤 s7앳지", "갤s7 앳지", "갤 s7 앳지", "갤 s 7 앳지")

# 93 갤럭시 WIN
product_name = "galaxy_win"
maker_name = "삼성전자"
dic103 = c("shv-e500s", "shv-e500l", "갤윈", "갤win", "겔win","갤럭시윈", "갤럭시 윈", "겔윈", "겔럭시윈", "겔럭시 윈",
           "galaxywin", "galaxy win", "갤럭시win", "갤럭시 win")

# 94. 갤럭시 그랜드2
product_name = "galaxy_grand2"
maker_name = "삼성전자"
dic104 = c("sm-g710l", "갤그2", "갤그 2", "갤럭시그랜드2", "갤럭시 그랜드2", "갤럭시 그랜드 2",
           "겔그2", "겔그 2", "겔럭시그랜드2", "겔럭시 그랜드2", "겔럭시 그랜드 2",
           "galaxygrand2","galaxy grand2", "galaxy grand 2")

# 95. 갤럭시 노트3
product_name = "galaxy_note3"
maker_name = "삼성전자"
dic105 = c("sm-n900l", "갤놋3", "겔놋3", "갤 놋3", "겔 놋3", "갤 노트3", "겔 노트3", "갤놋삼", "겔놋삼",
           "갤럭시노트3", "갤럭시 노트3", "갤럭시 노트 3", "갤럭시놋3", "갤럭시 놋3",
           "겔럭시노트3", "겔럭시 노트3", "겔럭시 노트 3", "겔럭시놋3", "겔럭시 놋3",
           "갤럭시note3", "갤럭시 note3", "갤럭시 note 3",
           "겔럭시note3", "겔럭시 note3", "겔럭시 note 3",
           "galaxynote3","galaxy note3","galaxy note 3")

# 96. 갤럭시 노트 3 네오
product_name = "galaxy_note3_neo"
maker_name = "삼성전자"
dic106 = c("갤럭시노트3 네오", "갤럭시노트3네오", "갤럭시 노트3네오", "갤럭시 노트3네오")

# 97. 갤럭시 노트4 S-LTE

# 98 갤럭시 노트 5
product_name = "galaxy_note5"
maker_name = "삼성전자"
dic109 = c("갤럭시노트5", "갤럭시 노트5","갤럭시노트 5", "갤럭시 노트 5", "겔럭시 노트5", "겔럭시 노트 5")

# 99. 갤럭시 노트7

# 100. 갤럭시 메가
product_name = "galaxy_mega"
maker_name = "삼성전자"
dic111 = c("shv-e310l", "갤메가", "갤mega", "겔 mega", "겔메가", "갤매가", "겔매가", "갤럭시메가", "갤럭시 메가", "겔럭시메가", "겔럭시 메가",
           "갤럭시mega", "갤럭시 mega", "겔럭시mega", "겔럭시 mega", "galaxymega", "galaxy mega")

# 101 갤럭시 wide
product_name = "galaxy_wide"
maker_name = "삼성전자"
dic112 = c("sm-g600s", "갤", "갤wide", "겔 wide", "갤와이드", "겔와이드", "갤럭시와이드", "갤럭시 와이드", "겔럭시와이드", "겔럭시 와이드",
           "갤럭시wide", "갤럭시 wide", "겔럭시wide", "겔럭시 wide", "galaxywide", "galaxy wide")

# 102. 갤럭시 줌2
product_name = "galaxy_joom2"
maker_name = "삼성전자"
dic114 = c("sm-c115l", "갤줌2", "갤 줌2", "겔줌2", "겔 줌2", "갤럭시 줌2", "겔럭시 줌2", "갤럭시줌2", "겔럭시줌2",
           "갤줌투", "갤럭시줌투", "갤럭시 줌투", "겔럭시줌투", "겔럭시 줌투",
           "갤럭시joom2", "갤럭시 joom2", "겔럭시joom2", "겔럭시 joom2")

# 103. 갤럭시 코어 어드밴스
product_name = "galaxy_core_advance"
maker_name = "삼성전자"
dic115 = c("shw-m570s", "갤럭시코어어드밴스", "갤럭시 코어어드밴스", "갤럭시 코어 어드밴스", 
           "갤럭시코어어드벤스", "갤럭시 코어어드벤스", "갤럭시 코어 어드벤스",
           "galaxy core advance", "galaxy coreadvance", "galaxycoreadvance")

# 104. 갤럭시 폴더
product_name = "galaxy_folder"
maker_name = "삼성전자"
dic116 = c("sm-g150nk", "sm-g150ns", "갤럭시폴더", "갤럭시 폴더", "갤폴더", "겔럭시폴더", "겔럭시 폴더", "겔폴더",
           "galaxyfolder", "galaxy folder")

# 105. 갤럭시 폴더2 (LTE)
product_name = "galaxy_folder2"
maker_name = "삼성전자"
dic117 = c("sm-g160n", "갤럭시폴더2", "갤럭시 폴더2", "갤폴더2", "겔럭시폴더2", "겔럭시 폴더2", "겔폴더2",
           "galaxyfolder2", "galaxy folder2")

# 106. 갤럭시 a5 (2016)
dic118 =  c("a5 2016", "a5(2016)", "a5 (2016)", "2016 a5", "2016년 a5", "a5 2016년")

# 107. 갤럭시 a7 (2016)
dic119 = c("a7 2016", "a7(2016)", "a7 (2016)", "2016 a7", "2016년 a7", "a7 2016년")

# 108. 갤럭시 a7 (2017)
dic120 = c("a7 2017", "a7(2017)", "a7 (2017)", "2017 a7", "2017년 a7", "a7 2017년")

# 109. 갤럭시A8 2015
product_name = "galaxy_a8_2015"
maker_name = "삼성전자"
dic121 = c("sm-a800s", "갤a8", "갤 a8", "겔a8", "겔 a8", "갤a82015", "갤a8 2015", "갤 a8 2015", "겔a82015", "겔a8 2015",  
           "a8 2015", "a8(2015)", "2015 a8", "갤럭시a8", "갤럭시 a8", "겔럭시a8", "겔럭시 a8",
           "갤럭시a82015", "갤럭시 a8 2015", "겔럭시a82015", "겔럭시 a8 2015",
           "galaxy a8", "galaxy a8 2015", "galaxya82015")

# 110.갤럭시A8 2016 
product_name = "galaxy_a8_2016"
maker_name = "삼성전자"
dic122 = c("sm-a810ss", "갤a8", "갤 a8", "겔a8", "겔 a8", "갤a82016", "갤a8 2016", "갤 a8 2016", "겔a82016", "겔a8 2016",  
           "a8 2016", "a8(2016)", "2016 a8", "갤럭시a8", "갤럭시 a8", "겔럭시a8", "겔럭시 a8",
           "갤럭시a82016", "갤럭시 a8 2016", "겔럭시a82016", "겔럭시 a8 2016",
           "galaxy a8", "galaxy a8 2016", "galaxya82016")

# 111. 갤럭시J7(센스 플러스)

# 112. 갤럭시S3 3G

# 113. 갤럭시S4 액티브

# 114 갤럭시S5
product_name = "galaxy5"
maker_name = "삼성전자"
dic126 = c("sm-g900s", "sm-g900kw", "sm-g900k",
           "갤럭시 5", "갤5", "갤럭시5", "갤 5", "갤s5", "갤럭시s5", "겔럭시5",
           "겔럭시 s5", "겔5", "겔s5", "겔 s5", "갤 s5", "삼성 s5",
           "삼성 겔5", "삼성갤5", "삼성 갤5", "삼성갤 5", "삼성겔5", "삼성겔 5")


# 115. 갤럭시S6 엣지플러스
product_name = "galaxy6_edge_plus"
maker_name = "삼성전자"
dic127 = c("sm-g928l", "sm-g928k", "sm-g928s_32g", "갤럭시 S6 엣지 플러스",
           "갤럭시 s6 엣지 +", "갤럭시s6엣지+", "갤럭시 s6 엣지+", "갤럭시 s6 edge+", "갤럭시 s6edge+", "갤럭시s6edge+",
           "갤럭시 6 엣지 플러스", "갤럭시 6엣지플러스", "갤럭시6 엣지플러스", "갤럭시6엣지플러스",
           "갤럭시6edgeplus", "갤럭시 6edge plus", "갤럭시6 edgeplus", "갤럭시 6 edge plus",
           "갤6엣지플러스", "갤 6엣지플러스", "갤6 엣지플러스", "갤6 엣지 플러스", "갤 6 엣지 플러스",  
           "갤6edgeplus", "갤 6edgeplus", "갤6 edgeplus", "갤 6 edge plus",
           "갤s6엣지플러스","갤 s6엣지플러스", "갤 s6 엣지플러스", "갤 s6 엣지 플러스", "갤 s 6 엣지 플러스",
           "갤s6edgeplus","갤 s6edgeplus", "갤 s6 edgeplus", "갤 s6 edge plus", "갤 s 6 edge plus", 
           "겔럭시6엣지플러스", "겔럭시6 엣지플러스", "겔럭시 6엣지플러스", "겔럭시 6 엣지 플러스", 
           "겔럭시6edgeplus", "겔럭시6 edgeplus", "겔럭시 6edgeplus", "겔럭시 6 edgeplus", "겔럭시 6edge plus", "겔럭시 6 edge plus",
           "겔6엣지플러스", "겔 6엣지플러스", "겔6 엣지 플러스", "겔 6 엣지 플러스", 
           "겔6edgeplus", "겔 6edgeplus", "겔6 edgeplus", "겔 6 edgeplus", "겔 6 edge plus", "겔6 edge plus",
           "겔s6엣지플러스", "겔 s6엣지플러스", "겔s6 엣지플러스", "겔 s6 엣지 플러스", "겔 s 6 엣지 플러스",
           "겔s6edgeplus", "겔 s6edgeplus", "겔s6 edge plus", "겔 s6 edgeplus", "겔 s 6 edgeplus",
           "갤s6엣지플러스", "갤 s6엣지플러스", "갤s6 엣지플러스", "갤 s6 엣지 플러스", "갤 s 6 엣지 플러스", 
           "갤s6edgeplus", "갤 s6edgeplus", "갤s6 edgeplus", "갤 s6 edge plus", "갤 s 6 edge plus",
           "삼성갤럭시s6edge+","삼성 갤럭시s6edge+", "삼성 갤럭시 s6edge+", "삼성 갤럭시 s6 edge+", "삼성 갤럭시s6 edge+",
           "삼성갤s6edge+","삼성 갤s6edge+", "삼성 갤s6 edge+", "삼성 갤s6 edge +",
           "삼성갤럭시s6엣지+","삼성 갤럭시s6엣지+", "삼성 갤럭시 s6엣지+", "삼성 갤럭시s6 엣지+", "삼성s6엣지+", "삼성 s6엣지+")


# 116. 갤럭시S8+
product_name = "galaxy8_plus"
maker_name = "삼성전자"
dic128 = c("sm-g955nbl", "sm-g955npk", "sm-g955ngr", "sm-g955n128", "갤럭시 S8 플러스",
           "갤럭시 s8 +", "갤럭시s8+", "갤럭시 s8 +", "갤럭시 s8 +", "갤럭시 s8+", "갤럭시s8+",
           "갤럭시 8 플러스", "갤럭시 8플러스", "갤럭시8 플러스", "갤럭시8플러스",
           "갤럭시8plus", "갤럭시 8 plus", "갤럭시8 plus", "갤럭시 8 plus",
           "갤8플러스", "갤 8플러스", "갤8 플러스", "갤8 플러스", "갤 8 플러스",  
           "갤8plus", "갤 8plus", "갤8 plus", "갤 8 plus",
           "갤s8플러스","갤 s8플러스", "갤 s8 플러스", "갤 s8플러스", "갤 s 8 플러스",
           "갤s8plus","갤 s8plus", "갤 s8 plus", "갤 s8 plus", "갤 s 8 plus", 
           "겔럭시8플러스", "겔럭시8 플러스", "겔럭시 8플러스", "겔럭시 8 플러스", 
           "겔럭시8plus", "겔럭시8 plus", "겔럭시 8plus", "겔럭시 8 plus", "겔럭시 8 plus", "겔럭시 8 plus",
           "겔8플러스", "겔 8플러스", "겔8 플러스", "겔 8 플러스", 
           "겔8plus", "겔 8plus", "겔8 plus", "겔 8 plus", "겔 8 plus", "겔8 plus",
           "겔8플러스", "겔 s8플러스", "겔s8 플러스", "겔 s8 플러스", "겔 s 8 플러스",
           "겔s8plus", "겔 s8plus", "겔s8 plus", "겔 s8 plus", "겔 s 8 plus",
           "갤s8플러스", "갤 s8플러스", "갤s8 플러스", "갤 s8 플러스", "갤 s 8 플러스", 
           "갤s8plus", "갤 s8plus", "갤s8 plus", "갤 s8 plus", "갤 s 8 plus",
           "삼성갤럭시s8+","삼성 갤럭시s8+", "삼성 갤럭시 s8+", "삼성 갤럭시 s8 +", 
           "삼성갤s8+","삼성 갤8+", "삼성 갤s8+", "삼성 갤 s8 +",
           "삼성갤럭시s8+","삼성 갤럭시s8+", "삼성 갤럭시 s8+", "삼성 갤럭시8 +", "삼성s8+", "삼성 8+")

# 117. 갤럭시 노트 엣지
product_name = "galaxy_note_edge"
maker_name = "삼성전자"
dic129 = c("갤럭시노트엣지", "갤럭시 노트 엣지", "갤럭시 노트엣지")


# 118. 갤럭시 노트 4
product_name = "galaxy_note4"
maker_name = "삼성전자"
dic130 = c("갤럭시노트4", "갤럭시 노트4","갤럭시노트 4", "갤럭시 노트 4", "겔럭시 노트4", "겔럭시 노트 4")

# 119. 라인프렌즈 스마트폰

# 120. 루나s
product_name = "luna_s"
maker_name = "TG&CO"
dic132 = c("루나")

# 121. 루나S 태권V 스페셜에디션

# 122. 리프레시 갤럭시 S7

# 123. 리프레시 갤럭시 S7 엣지

# 124. 베가 LTE-A
product_name = "vega_lte_a"
maker_name = "팬택"
dic136 = c("베가 lte")

# 125. 베가 넘버 6
product_name = "vega_number6"
maker_name = "팬택"
dic137 = c("베가 넘버")

# 126. 베가 시크릿 업
product_name = "vega_secretup"
maker_name = "팬택"
dic138 = c("베가 시크릿업","베가 시크릿 업" ,"베가시크릿업")

# 127. 베가 시크릿 노트
product_name = "vega_secret_note"
maker_name = "팬택"
dic139 = c("베가 시크릿 노트","베가 시크릿노트","베가시크릿노트","시크릿노트")

# 128. 베가 아이언 2
product_name = "vega_iron2"
maker_name = "팬택"
dic140 = c("베가 아이언2", "베가아이언2")

# 129. 볼트
product_name = "volt"
maker_name = "lg전자"
dic141 = c("볼트폰", "중고 볼트", "lg 볼트")

# 130. 뷰3 
product_name = "view3"
maker_name = "lg전자"
dic142 = c("뷰3", "뷰 3")

# 131. 블랙베리 프리뷰
product_name = "blackberry_priv"
maker_name = "블랙리스트"
dic143 = c("블랙베리 프리브")

# 132. 아이폰4

# 133. 아이폰4S

# 134. 아이폰5

# 135. 아이폰6
dic149 = c("아이폰6", "아이폰 6","아이폰-6", "iphone6", "i phone 6", "iphone 6", "IPHONE6_32G",
          "i폰6", "i 폰6", "i 폰 6", "아이phone6", "아이phone 6", "아이폰식스", "아이폰 식스")

# 136. 아이폰6 플러스
dic149 = c("아이폰6+", "아이폰 6+", "iphone6+", "iphone 6+", "i폰6+", "i 폰6+", "i 폰 6+", "아이phone6+", "아이phone 6+",
           "i phone 6+", "아이폰식스+", "아이폰 식스+", "아이폰 식스 플러스", "아이폰6 플러스", "아이폰6플러스", "iphone6 플러스",
           "iphone 6 플러스", "iphone6플러스", "iphone 6플러스", "6+", "6 플러스", "6플러스", "식스 플러스", "식스플러스",
           "6 plus", "6plus", "iphone6plus", "식스 plus", "식스plus")


# 137. 알카텔 아이돌 착

# 138. 옵티머스 G
product_name = "옵티머스 g"
maker_name = "lg"
dic153 = c("옵티머스 지", "옵티머스 g", "옵티머스g", "optimus g",
           "lgoptimus")

# 139. 옵티머스 G 프로
product_name = "옵티머스 지프로"
maker_name = "lg"
dic154 = c("옵티머스 지프로", "옵티머스 g프로", "옵티머스지프로", "optimus g pro",
           "optimusgpro","optimus_g_pro","옵티머스 지pro")

# 140. 옵티머스 뷰2

# 141. 와이즈II 2G

# 142. 와인 스마트 
dic157 = c("와인스마트", "와인 스마트", "와인 smart", "wine smart", "LG-F480L")

# 143. 와인스마트 Jazz
dic158 = c("와인 스마트 재즈", "wine smart jazz", "스마트 재즈폰", "와인 재즈폰", "스마트 와인 재즈", "재즈 스마트",
           "와인 재즈", "스마트 재즈 와인", "재즈", "재즈폰", "와인재즈", "와인스마트", "와인폰", "와인",
           "lg-f610s", "lg f610s", "lgf610s")

# 144. 화웨이 X3
product_name = "x3"
maker_name = "화웨이"
dic165 = c("화웨이 x3", "화웨이 엑스쓰리")













































index_list = list()
for (search_p in BandPlay){
  index = grep(search_p, tong$제목)
  index_list = append(index_list, index)
}
index_list_unique = unique(index_list)
tong[unlist(index_list_unique), ]$제품명 <- product_name
tong[unlist(index_list_unique), ]$제조사 <- maker_name

#








# 콘텐츠(제목+상세설명)에서 스펙(용량)검사 + 용량 달아주기 -> 예시 : 32기가 검색
GB_name = "32GB"
GB_32 = c("32gb", "32g", "32 gb", "32 g", "32기가", "32 기가", "32")

GB_index_list = list()
for (search_p in GB_32){
  GB_index = grep(search_p, tong$contents)
  GB_index_list = append(GB_index_list, GB_index)
}
GB_index_list_unique = unique(GB_index_list)
tong[unlist(GB_index_list_unique), ]$용량 <- GB_name


# 출고가 달아주기
tong[ which( tong$용량 == "32GB" & tong$제품명 == "galaxy6") , ]$출고가 = 350000