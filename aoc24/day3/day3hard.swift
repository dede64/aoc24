import Foundation

class Day3Hard {
    func solve() {
        do {
            var text = input
            
            // Catches `don't()` and `do()` regex
            let dontRegex = try NSRegularExpression(pattern: "don't\\(\\)")
            let doRegex = try NSRegularExpression(pattern: "do\\(\\)")
            let dontMatches = dontRegex.matches(
                in: text,
                options: [],
                range: NSRange(location: 0, length: text.count)
            )
            let doMatches = doRegex.matches(
                in: text,
                options: [],
                range: NSRange(location: 0, length: text.count)
            )
            
            let dontRanges = dontMatches.compactMap { Range($0.range, in: text) }
            let doRanges = doMatches.compactMap { Range($0.range, in: text) }
            var rangesToRemove: [Range<String.Index>] = []
            
            var lastDontRangeEnd: String.Index = text.startIndex
            for dontRange in dontRanges {
                guard dontRange.lowerBound >= lastDontRangeEnd else { continue }
                
                if let doRange = doRanges.first(where: { $0.lowerBound >= dontRange.upperBound }) {
                    rangesToRemove.append(dontRange.upperBound..<doRange.lowerBound)
                    lastDontRangeEnd = doRange.lowerBound
                } else {
                    rangesToRemove.append(dontRange.upperBound..<text.endIndex)
                    lastDontRangeEnd = text.endIndex
                }
            }
            
            for range in rangesToRemove.reversed() {
                text.removeSubrange(range)
            }
            
            var result = 0
            let regex = try NSRegularExpression(pattern: "mul\\(([0-9]+),([0-9]+)\\)")
            let results = regex.matches(
                in: text,
                options: [],
                range: NSRange(location: 0, length: text.count)
            )
            
            for match in results {
                let firstNumber = Int(String(text[Range(match.range(at: 1), in: text)!]))!
                let secondNumber = Int(String(text[Range(match.range(at: 2), in: text)!]))!
                result += firstNumber * secondNumber
            }
            
            print(result)
            
            
        } catch { }
    }
    
    let easyInput: String = """
        xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
    """
    
    let input: String = """
        '*when(932,461)!:who()(*mul(662,950)mul(878,53){#+{&%}mul(675,225)^how(648,963)&)#how(924,189)[mul(14,114)!mul(528,270)]#from()mul(866,868) what())mul(253,100); )when()@{mul(827,104))% -,'mul(955,284)/'-(([!from(177,673)<mul(399,798)*{;mul(339,362)!when():: @,-#don't()$;(! )from()%mul(78,207):&from()}^when()mul(51,209)@&who(){(~}mul(570,607){/,-select()(when()mul(808,231)[*~<&;,%mul(503,986)&*@${+mul(826,344)%?'!mul(511,427)${&+%mul(961,419)don't()!where()+mul(771,396)^,$@mul(831,173)mul(929,874)how()]mul(244,480)*!mul(30,541)^]/@who()%why()where()select()mul(490,87)'^@:mul(981,513)~-select()?#@mul(465,651)/mul(341,750)}&;!&,[mul(638,946)@;!,from():mul(349,565)/mul(495,530)&{)who()/!-~#-mul(82,865)$mul(120,92)~(mul(765,981)mul(43,881)**from(557,138)[-:{{mul(280,726)mul(719,15)!mul(716,45)%?($]<%mul(995,514)#-'mul(770,591)&([when(340,34)mul(48,191)why()%)^}who()>*mul(343,826)@}where()mul(211,118)select()why()%who()()do()'where()'+[!--<where()mul(323,818)what()what()*(><:mul(734,544)@when()who(239,383)+!,^~mul(362,147))mul(448,470)}where(916,77);select()/mul(885,970)what()(mul(926,912)when(),,-;?'from()@mul(166,868):from()mul(481,818)[how()who()~!,when()why();mul(2,227)<when(312,998)#/@who(978,537)))mul(296,229)+@;# mul(269,866)when(){<#select()$where()[@mul(601,99)#()//)*>do()![-[ where() ;mul(352,331)-[:mul(724,613)&-~@mul(133,235);when(849,671))where()?~where()@%mul(504,704)why()]<&mul(150,546)^:why();where(793,121)~!')[mul(345,200))[%select()why()^:%where()mul(112,504)'(from(194,838) when()]'why(231,15))$mul(480,487)where(335,714)$(;@{mul(542,838)-(mul(111,392))select()>when()mul(416,295)select()why(){from()<:mul(190,460)$(?how()when()mul(597,500)mul(714,782);?%>!mul(303,578)from(481,153)*&;,mul(373,860)~who()how(){mul(871,673)#@why():/[who():}don't()$<+<?@mul(692,459):<^how()[[*how()mul(906,486)~!where()<?how()<?don't()?'how():'mul(192,522)mul(707,885)who()]what()?who()~;$mul(366,408)<[ ??when()&[-mul(223,308)}*/mul(32,308)#()/mul(55,242)':where()when(){!;*{mulfrom()+$[>#-(how()%-do()!when()!when()from(342,582)@mul(877,442)from()mul(874,842);[?how()when()who()from()?(mul(415,601)#+/]:mul(132,522)#where(222,639)]from()&[how()~mul(278,563)?,~-?,(why()>mul(740,126)]select()';>]*,where(),mul(853,590)where()'~+mul(284,920)from()/+};-+[?^mul(656,345)]why()mul(185,132)-mul(770,693)~[what()<@-from()mul(200,187)mul(624,299)}mul(811,930)}+$]${&#?mul(805,62){;?when()/,:what()('mul(602,308)#}&^select()<@@how()why()mul(572,706)mul(327,202){'^*who()@mul(965,541)why()?/{[&when()mul(298,736):@}} mul(667,224)why()(- $#mul(641,534)'^mul(981,964)?;}don't()from(208,511)]})from(823,301)why()select()mul(462,251)select(){from()<mul(985,619){who()-select()'~select()-?mul(599,184)select();~why()?-?^/mul(329,480*from()+-/ mul(956,136)^:#(where()+mul(531,941)*!{mul(67,457)+)#^where(330,832)@mul(853,759))/}where()mul(572,909)@'->why()$how()'}}mul(83,963)how()$}+~:!,)mul(317,238)*'{ do()mul(408,63)-,*where()who()*@mul(761,933)who()who()&]^mul(757,153) mul(761,877):@#*^where(790,345)$why()mul(464,363)mul(546,662)from()do()-when())'^mul(133,153)
        $when()*+:@{[who()do():#when(755,316)select()<){+@mul(228,645)$/who()[+$>from()mul(379,971)what()( )where()-mul(333,963)/(@$why()#when()why()!select()do()[!when()^why()#mul(254,172)!!mul(150-/:!%:who()select()what()?mul(511,672)]?'do();/how()when()&select()select()mul(602,681){where() }mul(52,967)mul(373,270)'&^from(767,468)#@who();-mul(965,683)how()#]#$(@mul(205,224)&*^*!why():&$mul(464,992)who()(&don't()&^mul(41,520)]mul(639,416)select(),who()$mul(322,578)&%%where()(how(580,932)what()&mul(529,241)[??#<mul(232,504)$[:%$from(){[mul(551,555)why():?don't()(/from()::#who()select(773,990)}>mul(758,621)*mul(771,275)>select()(why()]mul(87,225)how()how()~@what()how()where()mul(335,347),mul(585,232)$select()/&}^;( mul(594,43)who()~@mul(380,624)mul(678,429);what()what() -/mul(660-select()/mul(305,408);select()~mul(815,711)mul(757,285){how()/why()select()@@){^mul(902,868)from()/'when(){@;mul(295,421)-from()!}<:mul(308,315),when()%/>^$mul(542,950)do()@&^#?~!'how(525,85)mul(191,12)?%]+mul(787,915)-#{#[where(532,178):mul@-mul(941,234){where()?$how()^;%*<mul(896,559))where()mul(116,145)select()when(662,744){when()}];mul(252,242)~;who()#why()]-{!-mul(16,617)mul(637,233),[(+,mul(430,177)mul(398,224))select()~what())&mul(855,707),?mul(902,250)~select(101,564)*where():where()^ [do()>[$[@[mul(92,115)don't()how()mul(493,708)>:;)~when()&mul(710,155)('<^$+$mul(166,985)]{+mul(171,503)%{select(6,86)-'select()mul(825,487)when()/[:?<>mul(459,298)>]select()!don't()'{:;mul(96,934)}-*,%,don't(){+who()$who()!who()mul(517,278)~}@mul(574,84)^&%:what(),mul(723,445)?$mul(952,833))? @select()~who();*]mul(866,509)}who(174,511)]mul(369,695)-what()select(){~>{mul(191,238)&:!:>'what(),mul(381,727^*:where(670,586))-:mul(922,333)how()?how()&?,;when()]@mul(432,354)}<who()mul(270,613)-'[(+mul(640,237)(select();who()~who()(mul(200,694))'-,%:)^what()mul(360,861)<',mul(730,495){who(){:#who()from()mul(981,140)who()where()^[mul(221,257)who()%mul(74,34)select()&+when()$who(112,834)mul(316,217)+when()[,+^~@when(159,94)*mul(487,481)%:why()what()when()(>^mul(263,98);}]:,mul(661,118)%! [from())mul(276,921)^]]]^when();select()mul(895,325)why()+where()!from(294,522)^^^~)mul(153,481)mul(861,802)[]how()(*&mul(219,815)-:&%what()what()@mul(377,33)mul(156&<}how()^mul(654,99)/?>-~select()@)mul(20,758)mul(378,510)(^)*who()?#<+mul(652,169)%when():*+how()mul(860,302+don't()'!who()/) mul(376,810)<: !why()>{mul(431,544)+mul(860,291)when()from(),-why()#mul(367who() <]>){from() @,mul(194,2))$why()how()*when()mul(965,720)@]#){where()[,*+mul(461,205)^how();;(^)>mul(10,206)^,< who()%$%~mul(716,424)[mul(76,949)mul(605,201)-mul(84,478)%when()@+~what()~mul(562,278)mul(746,153)who(987,176)mul(70,785)mul(583,929)-why()/why()%! +mul(512,816)'who()mul(869,983)?mul(735;*why(521,585)$do()from()(how()select()mul(594,821++@!mul(602,847)mul(561,601)mul(351,649)~!why()+][?&mul(884,49)}!when()&#where()when()))+mul(853,585)~$$@mul(462,772):-)what()mul(871,925)$>*^mul(488,569)do()what():when()/(+<+<^mul(556,667)select()where()mul(308,658)@/when()]where()({do()%mul(281,279)<!<,}do()} ,@$@where()<-where()mul(444,348) why()how()(*>)'$]do()$#from()]::;*;mul(831,254)who(33,9)mul(593,778)/)$!{how() mul(716,94)where()#+where()~+~[select()?do()+<,mul(119,848)how()(what();'[,mul(205,435)mul(462,597)#(<:mul+mul(821,403)&**mul(309,390)
        from()*/)where()*@>mul(425,149)[/:,(,;:{#mul(442,406)>(;<$,&%*mul(954{why(467,228)select();{>)%how(604,161)what()from()mul(359,89),from()*];~when()]mul(403,60)?[];*+#,mul(528,565#>;*- mul(894,804) don't()-mul(736,961)mul(169,583)where()<where()what(321,911)^!who()how()?mul(608,480)(why()[mul(779,945)what()how()#* what()]mul(181,690)%['&/@from()mul(522,978){{who()mul(491,585)?mul(798,456)<>#%~@mul(943,85)$,mul(820,12)]mul(86,786)~mul(453,237how()]what()^when()!-mul(826,572)from()?*select())]from())mul(3,29)how()who()@/+when();%mul(285,796)when())mul(193 ^@,from()#what()>'$(mul(313,971)<#mul(871,501)@how();from()from()mul(648,120)$^}{how()&)(mul(170,653)^who()mul(284,948)*mul(338,643how()~who()!}@(>mul(822,278)when(990,725)+do(),what() mul(7,493)][when()why(530,953)mul(241,105)mul(280,649)when()'??~mul(995,913)&how()select()$~mul(461,746)[:;{]//-mul(419,572)mul(347,770)how()mul(566,424)mul(180,109);select()when()where(827,268)/<,+mul(629,648);'(~<where()select()$<;mul(910,768)$ *? :;mul(871,136)~where():who()who()(where()mul(194,857)who(){mul(843,900)&who()~%mul(600,482)(mul(389,287)do()#[$[$}(>mul(46,371)+*$what()mul(203,987)mul(686,836)(when()from()what()}];]mul(716,962)where()<select()%(**]mul(728,648)^mul(998,355)!/#select()][/%who()mul(675,826)''&,&how()mul(149,800);from()[!who()+/mul(484,370),why())why(){}/how(265,92)when()who()mul(246,872)select()&;}why()/mul(476,30)~{>mul(821,591):<what()~select()$when(125,738)from()mul(371,593)@!mul(406,666)<where()^{~(what()@<mul(894,829)where()what(330,779)how()#mul(682,353)+/-<)when()from()#@mul(83,309),!when()do()from()'who()<mul(288,195)}'/mul(149,220);from()mul(541,643))who()where()$@mul(744,941)- ~<]where(396,622)^how()mul(215,902),~*:(select()select();mul(768^^@*[from()do()@mul(793,999)^$*<who()*;from()mul(60,340)@who()/^why()^mul(454,814)who()->>^mul(902,217)$;>where()?~}select()mul(702,261)when(){~!!mul(181,296)?#mul(698,522)@mul(461,392)~who()(]<%!from()don't()>}),%where()mul(562,168)#;from() where()mul(237,53) mul(268,711)when()~]+{'~mul(36,808)#;[:)select()[when()(who()mul(763,177)from()select()why(){/(mul(701,861)>how()!,*what(753,574)@mul(238,46)mul(663,748)&mul(742,855)##/)-mul(818,603)>what()-,mul(835,282)select()>;#*mul(897,85)/<from();>where(){!mul(852,153)mul(633,603)-what():where()[[mul(776,51{&from()>%>^mul(64,533)mul(992,697)'<why()&mul(358,895)?why()where()!mul(399,247)#why()+why()-,;;when()mul(217,987)*mul(585(&{&})/mul(982,985)select()?mul(528,920){&:mul(387,157):,(((where(883,627)when()where()don't()(where()why())what()$]from()what()who()mul(96,592)'mul(326,927)mulfrom()-from(947,696)~,:select()?)select()from()mul(136,549) from(){where()!mul(797,998)[>when(),mul(331%#%$]*;who()mul(799,100))@[;%<%how()when():mul(781,214)}%!what()from()how()from()mul(609,497)-how()&who()mul>[when()#,[select()mul(848,464)mul(998,874)$]mul(933,654)#*>what()select():[;#when()mul(288,108)select()<mul(447,278)/'~%what()*:~-mul(700,198)mul(208,714)mul(317,38)^%'how()do():what(29,25)who()<what(915,933)why(445,270),/]mul(27,630)*!,@ ($-mul(281,434)? %+)mul(45,531),)select()where()mul(523~what(){(mul(141,965)/@)when()how()mul(980,810))^mul(945,433)@who(967,301)why()> mul(856,529))#&from()[do()where():who()*[%]?mul(236,606)$*)when());^}mul(458,967)from()who()from(){mul(379,719)<*mul&#!/usr/bin/perl>!who()#mul(357,342)?how():/[from();mul(419,654)
        ![/mul(665,722)mul(44,793)from() $when()[/from():?mul(910,529)!how()!@>where()mul(85,692)]-%/mul(884,81)who(521,804)what()what(){what()when()mul(990,766)mul(793,200)select()mul(755,282),[(where()+;(#mul(394,96)mul(351,116)-^(mul(641,709)$,mul(982,628!,,[when()^~(how(184,286)what() mul(750,635)}%{%<> ?&mul(931,9)$[mul(698,488)~how():why()^*mul(564,153)}-where()why() what()mul(714,569)<how()!#who()mul(457,762)when()who()#<what()&'mul(784,28)%,,)}why()@:, mul(97,297)@ /}select()select()[mul(421,144)>from()?[?mul(80,973):#'+don't()}{how()}mul(437,592)(where()?,when()how()%:#mul(295,199) +)}from()>what()}mul(877,282)'where() &~?what(){*mul(222,408)mul(827,819)why() # do();;,why();,[mul(321,402)}who()'mul(755,90)select()what())mul(977,344)#why()who()?+-mul(383,635)($;when()#mul(900,601)+do();mul(206,834)mul(383,432){what(360,811)mul(827,802),)?$where()who()?{do()when()?$why();{{mul(544,551)</@when()mul(133,828)[!}!from()mul(500,141)!select(),#what()]mul(235,136)>:mul(380,98)where()<mul(763,586) mul(456,651)mul(579,437{)/how()!who(190,953)select()mul(97,312)/who(296,290)$'~;#*>mul(231,896)mul(248,602)select()(who()mul(338,121),why()):>mul(95,711)?'{mul(638 -)@!mul(681,304)what()~^%(mul(116,692)}&select()why(664,706)why();}&mul(103,869), mul(205,12)}-[mul(979,353)when(){mul(303,476)-/<$!%%]mul(358,341)select()&}who()why(163,835);>+mul(34,734)mul(330,527)mul(428,357)who()[mul(680,857)>-/;when() what()/ select()mul(218,336)&-who()when()where()who()-from()+mul(84,105)when()&?select(477,434)($#'mul(128,545){+'why()+),?'$mul(745,121),what())mul(133,419)@$/$+;who(115,246)^/(mul(135,230)~:^mul(675,10)$(what()%do()+what()-why()mul(838,662)how()%mul(683,258<mul(127,142)mul(558,494)$+why()why()^!>+*mul(492,582)<! how()mul(299,150)~{,~ who())?*$mul(422,684))select()}from())+from()mul(53from()~{where()&from() when()where()>)mul(246,947){(mul(548,714)from()*~+[-why()select()mul(118,285)where(){<}/%mul(221,266)#mul(79,261)%why()mul(349,642)what(){<(mul(811,491)mul(852,262)what()where(752,95)<^)mul(133,969{select()mul(252,913)why(765,304);?what()mul(661,7):#%?!'mul(744,62)%)mul(532]select()}when()when()]'[%^mul(565,470)^why()mul(9,544),@ what()mul+&!where()*+mul(659,140)mul(982,671))*@% *''mul(508,215))from()-!]> ~mul(413,418)>[(^,,mul(512,738)!-@what(){!<&mul(545,683)mul(461,493)~'mul(255,513+}{~from()what()mul(10,277)*who()&why();!&+-mul(281,940)how()>/$mul(246,406)@{~how()/<>!don't()-:~(mul(741,150)}mul(271,458))when():!&?mul(645,221) why()))mul(943,83)(select()@'@mul(557,649)(select(93,936)when()~?what() mul(196,320);where()?>who()mul(208,759)+what()&%@why()$do()mul(931,359)#?<?})mul(332,926)what();?how()?;,<$mul(902,131)mul(153,818)from()}>who()# [*##mul(754,721)@]#from()>;,mul(924,810)~]mul(504,18)&when()+!'>(mul(420,227)<[{{why()do()$who(){','#what()mul(11,549)mul(275,839)+**&what()mul(960,111)~mul(863,559)mul(997,395)?(}>where(),mul(553,109)[^ 'mul(337,751)<<who()why()@),~[mul(645,994),])*),$select():mul(480,815)//from()$'&+don't();,'what();how()when(586,165)'who():mul(368,791)!when()when()(};mul(80,516)who(657,999)how())@'mul/>>@++;when()what(278,714)mul(50,770)
        when()@select()where() ([mul(747,2)~ do()]'[why()(><mul[mul(944,820)mul(610,636)!<when(316,187)#)mul(51,113)+& ?'#~mul(296,805)& /]$when()mul(397,118)! !from()$(@mul(780,422)mul(116,952)why()]why())$$mul(349,756when(),mul(846,50),who()what()~*mul(936,216)?select(490,265)~%*select()select()from() <mul(623,64)]}&&from(941,870)]#mul(49,969)&:'@who(619,626)why()who(){@'mul(514,694)-/?</where()!'why()mul(525;&:how(506,221)($)@*mul(307,952)where()how();<<<$]mul(939,978){'$<)who()'#when()mul(266?/ (mul(385,676)from()@what(){mul(798,68when()when()'{who()mul(338,137)!*mul(184,448)'mul(437,301),mul(76,268)'don't();# $<}mul(744,414)?!how()(/*%mul(207,542)~why()when()-)mul(815,793)?>why()mul(20,45)* ,^&!'~mul(769how()from()-/;mul(101,318)from()what():from()who()%mul(114,822)*why()[>select()where(832,207)from(214,70)from()mul(93,917),*$}:> ~what()mul(650,282){how()mul(556,140)where()what()mul(876,167)+&mul#who()~#}@mul(902,167)^!^%mul(137,823)>mul(550,698)how()'$mul(843,697){)'#-@ )/-mul(617,639)from()<mul(542,659)-?-#]mulwhy(279,476)mul(44,841)<!mul(986,94)how(){(how()'>select()mul(838,59)why():from()when()mul(512,68) when()from()from(); don't()mul(292,873)){+don't()<from()$^,)~}$mul(397/mul(134,953)!(from()when()-+mul(317,941)++from()]:'{-mul(665,289):why()>{]mul(663,183)+select();/- how()+ *mul(638,19)]<}:!<from()mul(372,476) [<what()( where()}mul(834,850who()(mul(534,698)who()'mul)#)@{who();); 'mul(979,467)when()when()what()what()mul(590,44)don't()mulwhere()%how()~]who()what()~mul(587,776)?mul(388,23)~?}>&where()%mul(321${mul(145,779)what()[~/>:don't()*##why()*+'mul(268(]$*+how()-'when()mul(845,280)what()^}@mul(989,77)'<why()&>select()*$?$mul(368,599)@@:'@where())mul(348,748) }$;%+select()?%mul(70,929),,^[]^select()#mul(830,51,?&!mul(858,374),select()when()}why()%what()]select()?mul(180,625)!mul(73,99)mul(445,334)/,!@@mul(464,542)!,from()$?[mul(516,277)]mul(617,538)mul(292,731)-*$*what(289,332):why()>mul(994!select(),>$)mul(289,272){why()/:^/mul(983,85)when()mul(18,611)}mul(466,826)who()--mul(470,873)!+*&mul(101,733)'where()mul(983,778)mul(974,217)/-+/]@from(),>mul(483,292)'?$<}<mul(77,441)]mul(810,991)mul(479,727)-@select()from())>,*what()mul(599,699)}/from()[*where(){mul(466,649)#'*:!where()mul(434,181)-</}# }mul(359,147)]$@mul(751,107)^-{ /$select()mul(115,665)]^who(900,677)what(32,870);when()~/from()]mul(351,263) <select():mul(895,90)-what()from()@*:where()mul*,{!mul(765,352)mul(831,730)?mul(69,805)+why()&/what(130,94)why()what():^mul(277!{*%do()^>/what()$/select()}mul(135,403)+'mul(988,367)mul(699,753)^,':<mul(599,94)what()~>+}})do()mul(876,320)why(){~/mul(550,960)$(*:-?$what()mul(259,261)mul(140,435)mul(981,455)#&}+'mul(434,245))!{mul(905,337)@select(716,497)(#}how(880,682)*from()mul(408,109)!}%don't()%<)how()%/mul(485,635)&from(), :;%/mul(421,957)#mul(138,916)mul(779,979)who();mul(694,921)/[/$!&@select()mul(599,341),}/}#'where()what()who()>mul(990;@ !-why()don't(){*:!what(): ^mul(734,796)-:/<from()do()mul(978,96)%[how()*:)what()don't()where()why()'when()$(#where(),from()mul-from()<##[mul(206,798)>where() mul(940,41)what(609,666)'how()what(522,700)mul(602,249)^where()(!~)mul(880,415)select())>(%}mulwhen()why()?<+?mul(744,997)</<]/'*what():[mul(167,167)>from()#when()+{~where()mul(37,232)#mul(996,205)mul(993,863)why()mul(144,204),,what()mul(169,251)
        %who()^why() mul(410,625)from();what(){[+who(67,306)]$mul{how()mul(456,501);&from()]%<&don't()(!where()}@>}!,mul(566,94)> )when()<-mul(725who(77,893),@>who()-!when()mul(197,527)what()+?+, mul(170,190)@*when(){@why()don't():when()^how()>{}]mul(660,36)when()],]how()@~who(14,397)]mul(260,88)who()~select()when()<{,-do():>why() mul(276,661)?)~how()/'&why()mul(199,824)&,$*'(#) mul(919,245)&who()<from()who(33,18)mul(439,323)?!who()$mul(959,344),;from(){#how()[?mul(406,283)what()@$,why()mul(243,50)*mul(27,713)how()/mul(173,440)mul(752,139);!how()mul(694^}!?^~mul(86,112)where();from()what()how(),-[don't()-who(975,701)mul(809,676)%%*[>/mul(469,339)[[>why() do()mul(388,947)who()#~mul(145,154>,~{ mul(752,410){,!~why()why()#mul(498,700))!; mul(290,290):@from(176,870)[%@mul(340,622)(when(821,843)+when()%why()+<do()how()when()mul(620,296);+*!why()(]#mul(463,780)*select()%;{:what()who()mul(640,731)!}from()!->mul(663,681)@^/(? '{select()%don't()where(51,291)&]:mul(253,129)why(){where()select(),^mul(795,485);!why():@mul(799,33)/<mul(255,590)mul(504,55):mul(582,645)how(){*>/mul(97,531)from();?@%%mul(833,760)!&!/^#&mul(867,677))@mul(483,613))how()@;)^%;?mul(518,57)!$)-why()what()}how(){*mul(919when()$-),mul(206,121)}+']){mul(46,767)-mul(32,66)where()mul(986,477)why()}:;select()@ {{mul(93,728)%;(%where()select()mul(955,534)($~;mul(743,671)[+<%,+$$$mul(154,834)'who()*select()}#when()!mul(129,508)why()who()++when()mul(343,945)^what()^) >do():<mul(827,853)who()[$when()where()@/[{mul(827,288)%~mul(984,937):mul(877,573)-when()&when()/+}?mul(178,519){&;^mul(769,791)what()!how())who()*>mul(586,351):%##who()>#?mul(498,937)],mul(326,512)from()!%#>}from()mul(610,769)how()/mul(955,551)#%,]mul(376,333)<-;when(435,299)#why(){>*%mul(609,536)!>{> :+%&mul(304,490)<[mul(690,195) //where()#&;~mul(499,478)! what()why()why()<select()>^mul(923,423)&when()mul(96,306)^why()who()%from()]/how()]mul(731,186)///mul(516,127)$-<where(974,904);~,where()mul(273,335)]/)where()what():-$-'mul(713,713)~why()! ]'mul(478,925)?who()(mul(459,54)<where()$*;$:#how()don't()/what(726,552)>{ why()!]'mul(280,921)::@(]<from()mul(516,624)*from()when()'^*@who(338,490)/from()mul(121,947)$;};-!when() mul(305,411)mul(106,589)when(870,95)~}@>{how() what()mul(198,835)[-!from()*%mul(149,825) where()where()mul(660,669)(]&@mul(803,556)how(677,591)mul(609,507))?/>@'mul(176,185)[when()from()$}when()where()mul(496,706)why()^<&~?{/%)mul(349,473)how()>?{]!mul(242,815)@%-?<what()mul(282,877)what()$//what()?+mul(766,443)-who()-what()+)select()~@what()mul(595,833)[,$[:;?mul(638,646)mul(480,581)[do()$ who():mul(790,401)mul(208,354)@[[%mul(314,923)$%select()#from()(?/+mul(49,189)@why(519,674)what()$/select()when()@?mul(913,628)?;%where(){select(),!^mul(196,458)mul(206,858)don't()mul(306,305)<from())select()<mul(446,77)how()when():mul(824,384);[:what()-%how(426,897) when()from()mul(239,84)^:mul(598,689)what()<>;[{~mul(56,909) mul(638,125)#>^select()>^-?-'mul(517,633)why()]%mul(480,954)?'-'<mul(938,326)[<-)'mul(859,206)}&mul(667,726)/why()who()!,[how()who(703,56)'$mul(472,810)from()->>}mul(5,623)what()}from(904,521)](who()<mul(476,844)!$ [mul(627,570)(}select() 
    """
}
