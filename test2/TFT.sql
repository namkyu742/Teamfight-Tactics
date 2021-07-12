drop database TFT;
create database TFT;
use TFT;

/*  -------------------------- CREATE -------------------------- */
create table Basic_Item (
    id int(10) not null AUTO_INCREMENT,
    name varchar(64) DEFAULT null,
    value varchar(128) DEFAULT null,
    season int(10) DEFAULT null,
    image varchar(128) null,
    PRIMARY KEY(id)
) engine = InnoDB;

create table Combi_Item (
    id int(10) not null AUTO_INCREMENT,
    name varchar(64) DEFAULT null,
    value1 varchar(128) DEFAULT null,
    value2 varchar(128) DEFAULT null,
    value3 varchar(128) DEFAULT null,
    season int(10) DEFAULT null,
    Material1 varchar(64) DEFAULT null,
    Material2 varchar(64) DEFAULT null,
    image varchar(128) null,
    mimage1 varchar(128) null,
    mimage2 varchar(128) null,
    PRIMARY KEY(id)
) engine = InnoDB;

create table Player_Character (
    id int(10) not null AUTO_INCREMENT,
    series int(10) DEFAULT null,
    super_name varchar(64) DEFAULT null,
    name varchar(64) DEFAULT null,
    image1 varchar(128) null,
    image2 varchar(128) null,
    image3 varchar(128) null,
    PRIMARY KEY(id)
) engine = InnoDB;


/*  -------------------------- INSERT -------------------------- */
INSERT INTO `basic_item` (`id`, `name`, `value`, `season`, `image`) VALUES
(null, "BF 대검", "공격력+15", 4, "icon3_1_1.png"),
(null, "쇠사슬 조끼", "방어력+25", 4, "icon3_1_2.png"),
(null, "거인의 허리띠", "체력+400", 4, "icon3_1_3.png"),
(null, "쓸데없이 큰 지팡이", "주문력+15", 4, "icon3_1_4.png"),
(null, "곡궁", "공격 속도+15%", 4, "icon3_1_5.png"),
(null, "여신의 눈물", "마나+15", 4, "icon3_1_6.png"),
(null, "음전자 망토", "마법 저항력+25", 4, "icon3_1_7.png"),
(null, "연습용 장갑", "치명타 확률+10%, 회피 확률+10%", 4, "icon3_1_8.png"),
(null, "뒤집개", "분명 무슨 효과가 있을 겁니다...", 4, "icon3_1_9.png");

INSERT INTO `combi_item` (`id`, `name`, `value1`,`value2`,`value3`, `season`,`Material1`,`Material2`, `image`, `mimage1`, `mimage2`) VALUES
(null, "죽음의 검", "공격력+30", "적 처치 관여 시 전투가 끝날 때까지 공격력+20증가 무제한 중첩 가능(1중첩부터 시작)", "", 4, "BF 대검", "BF 대검", "icon3_2_1.png", "icon3_1_1.png", "icon3_1_1.png"),
(null, "수호 천사", "공격력+15, 방어력+25", "처음 사망 시 2초 동안 경직된 후 해로운 효과가 사라지고 400의 체력을 지닌 채 부활","", 4, "BF 대검", "쇠사슬 조끼", "icon3_2_2.png", "icon3_1_1.png", "icon3_1_2.png"),
(null, "지크의 전령", "공격력+15, 체력+200", "전투 시작 시 장착 유닛과 가로로 1칸 내에 있는 모든 아군의 공격 속도가 남은 전투 시간 동안 +35% 증가", "",4, "BF 대검", "거인의 허리띠", "icon3_2_3.png", "icon3_1_1.png", "icon3_1_3.png"),
(null, "마법공학 총검", "공격력+15, 주문력+15%", "스킬 사용 시 피해량 33%만큼 체력 회복. 체력 회복 초과분은 최대 400의 피해를 흡수하는 보호막으로 전환", "",4, "BF 대검", "쓸데없이 큰 지팡이", "icon3_2_4.png", "icon3_1_1.png", "icon3_1_4.png"),
(null, "거인 학살자", "공격력+15, 공격 속도+15%", "기본 공격 및 스킬 사용 시 10%의 추가 피해. 대상 최대 체력이 1750 초과 시 추가 고정 피해 90%로 증가", "",4, "BF 대검", "곡궁", "icon3_2_5.png", "icon3_1_1.png", "icon3_1_5.png"),
(null, "쇼진의 창", "공격력+15, 마나+15", "기본 공격 적중 시 5의 마나 회복","", 4, "BF 대검", "여신의 눈물", "icon3_2_6.png", "icon3_1_1.png", "icon3_1_6.png"),
(null, "피바라기", "공격력+15, 마법 저항력+25", "기본 공격 시 피해량의 40%만큼 체력 회복", "", 4, "BF 대검", "음전자 망토", "icon3_2_7.png", "icon3_1_1.png", "icon3_1_7.png"),
(null, "무한의 대검", "공격력+15, 치명타 확률+75%", "치명타 확률 75%증가. (조합 아이템에도 적용) 치명타 확률이 100%가 되면 1% 증가할 때마다 치명타 피해량이 +1% 증가", "[고유 - 중복 적용 불가]", 4, "BF 대검", "연습용 장갑", "icon3_2_8.png", "icon3_1_1.png", "icon3_1_8.png"),
(null, "신성의 검", "공격력+15", "장착 시 신성 특성 획득", "[고유 - 중복 적용 불가]", 4, "BF 대검", "뒤집개", "icon3_2_9.png", "icon3_1_1.png", "icon3_1_9.png"),
(null, "덤불 조끼", "방어력+50", "받는 치명타 공격의 추가 피해 무효화. 기본 공격에 맞을 경우 주변 모든 적에게 80/100/150★의 마법 피해 (2.5초마다 한 번씩)", "", 4, "쇠사슬 조끼", "쇠사슬 조끼", "icon3_2_10.png", "icon3_1_2.png", "icon3_1_2.png"),
(null, "태양불꽃 망토", "방어력+25, 체력+200", "전투 시작 시 및 2초마다 2칸 내에 있는 적 하나가 불타 10초 동안 최대 체력의 25%에 해당하는 고정 피해를 입고 체력 회복 효과 50% 감소", "[고유 - 중복 적용 불가]", 4, "쇠사슬 조끼", "거인의 허리띠", "icon3_2_11.png", "icon3_1_2.png", "icon3_1_3.png"),
(null, "강철의 솔라리 펜던트", "방어력+25, 주문력+15%", "전투 시작 시 장착한 유닛과 가로로 2칸 내에 있는 모든 아군이 8초 동안 300/375/500★의 피해를 흡수하는 보호막 획득","",  4, "쇠사슬 조끼", "쓸데없이 큰 지팡이", "icon3_2_12.png", "icon3_1_2.png", "icon3_1_4.png"),
(null, "거인의 결의", "방어력 +25, 공격 속도 +15%", "피해를 입거나 치명타 피해를 가할 경우 2% 추가 피해 효과 획득. 효과는 최대 25회까지 중첩 가능하며, 최대 중첩 시 착용자의 크기가 커지고 25의 방어력 및 마법 저항력 획득.", "", 4, "쇠사슬 조끼", "곡궁", "icon3_2_13.png", "icon3_1_2.png", "icon3_1_5.png"),
(null, "얼어붙은 심장", "방어력 +25, 공격 속도 +15%", "피해를 입거나 치명타 피해를 가할 경우 2% 추가 피해 효과 획득. 효과는 최대 25회까지 중첩 가능하며, 최대 중첩 시 착용자의 크기가 커지고 25의 방어력 및 마법 저항력 획득.", "", 4, "쇠사슬 조끼", "여신의 눈물", "icon3_2_14.png", "icon3_1_2.png", "icon3_1_6.png"),
(null, "가고일 돌갑옷", "방어력 +25, 마나 +15", "주변 적의 공격 속도 50% 감소. 보유한 두 번째 얼어붙은 심장 1개마다 효과 반경 증가.", "", 4, "쇠사슬 조끼", "음전자 망토", "icon3_2_15.png", "icon3_1_2.png", "icon3_1_7.png"),
(null, "침묵의 장막", "방어력 +25, 마법 저항력 +25", "적의 공격 대상이 되면 방어력이 15, 마법 저항력이 15 증가. 공격하는 적이 늘어나면 중첩되어 적용.", "", 4, "쇠사슬 조끼", "연습용 장갑", "icon3_2_16.png", "icon3_1_2.png", "icon3_1_8.png"),
(null, "수호자의 흉갑", "방어력 +25", "장착 시 선봉대 특성 획득", "[고유 - 중복 적용 불가]", 4, "쇠사슬 조끼", "뒤집개", "icon3_2_17.png", "icon3_1_2.png", "icon3_1_9.png"),
(null, "위모그의 갑옷", "체력 +400", "추가 체력 1000 획득 (조합 아이템 포함)", "", 4, "거인의 허리띠", "거인의 허리띠", "icon3_2_18.png", "icon3_1_3.png", "icon3_1_3.png"),
(null, "모렐로노미콘", "체력 +200, 주문력 +15%", "스킬로 마법 피해를 입히면 대상을 불태워 10초 동안 대상 최대 체력의 25%만큼 고정 피해를 입히고 그동안 모든 체력 회복 효과 50% 감소", "[고유 - 중복 적용 불가]", 4, "거인의 허리띠", "쓸데없이 큰 지팡이", "icon3_2_19.png", "icon3_1_3.png", "icon3_1_4.png"),
(null, "즈릇 차원문", "체력 +200, 공격 속도 +15%", "전투 시작 시 장착한 유닛이 근처의 모든 적을 1초 동안 도발", "장착한 유닛 사망 시 1,500/2,250/3,000★의 체력을 지닌 인공체가 깨어나 근처의 모든 적을 다시 도발", 4, "거인의 허리띠", "곡궁", "icon3_2_20.png", "icon3_1_3.png", "icon3_1_5.png"),
(null, "구원", "체력 +200, 마나 +15", "사망 시 아군의 체력 800 회복", "", 4, "거인의 허리띠", "여신의 눈물", "icon3_2_21.png", "icon3_1_3.png", "icon3_1_6.png"),
(null, "서풍", "체력 +200, 마법 저항력 +25", "전투 시작 시 결투장 반대편에 회오리바람을 소환해 회오리바람과 가장 가까운 적을 6초 동안 전투에서 제외", "[고유 - 중복 적용 불가]", 4, "거인의 허리띠", "음전자 망토", "icon3_2_22.png", "icon3_1_3.png", "icon3_1_7.png"),
(null, "덫 발톱", "체력 +200, 회피율 +20%", "처음 적중한 적 스킬을 막고 해당 스킬을 사용한 적을 4초 동안 기절", "", 4, "거인의 허리띠", "연습용 장갑", "icon3_2_23.png", "icon3_1_3.png", "icon3_1_8.png"),
(null, "대장군의 깃발", "체력 +200", "장착 시 대장군 특성 획득", "[고유 - 중복 적용 불가]", 4, "거인의 허리띠", "뒤집개", "icon3_2_24.png", "icon3_1_3.png", "icon3_1_9.png"),
(null, "라바돈의 죽음모자", "주문력 +30", "주문력이 추가로 50 증가", "", 4, "쓸데없이 큰 지팡이", "쓸데없이 큰 지팡이", "icon3_2_25.png", "icon3_1_4.png", "icon3_1_4.png"),
(null, "구인수의 격노검", "주문력 +15, 공격 속도 +15%", "기본 공격 시 전투가 끝날 때까지 공격 속도 6% 증가. 무제한 중첩 가능", "", 4, "쓸데없이 큰 지팡이", "곡궁", "icon3_2_26.png", "icon3_1_4.png", "icon3_1_5.png"),
(null, "루덴의 메아리", "주문력+15%", "스킬 사용 시 처음 마법 피해를 입은 적과 주변에 있는 최대 3명의 적에게 180의 추가 마법 피해를 입히고 대상이 군중 제어 효과를 받는 경우 180의 추가 피해", "", 4, "쓸데없이 큰 지팡이", "여신의 눈물", "icon3_2_27.png", "icon3_1_4.png", "icon3_1_6.png"),
(null, "이온 충격기", "주문력 +15, 마법 저항력 +25", "2칸 내에 있는 모든 적의 마법 저항력 40% 감소 (중첩 불가). 해당 적이 스킬 사용 시 대상 최대 마나의 225%에 해당하는 마법 피해", "", 4, "쓸데없이 큰 지팡이", "음전자 망토", "icon3_2_28.png", "icon3_1_4.png", "icon3_1_7.png"),
(null, "보석 건틀릿", "주문력+15%, 치명타 확률+20%", "스킬에 치명타 적용 가능. 추가 치명타 피해량+40%증가", "", 4, "쓸데없이 큰 지팡이", "연습용 장갑", "icon3_2_29.png", "icon3_1_4.png", "icon3_1_8.png"),
(null, "황혼의 성위", "주문력+15%", "장착 시 황혼 특성 획득", "[고유 - 중복 적용 불가]", 4, "쓸데없이 큰 지팡이", "뒤집개", "icon3_2_30.png", "icon3_1_4.png", "icon3_1_9.png"),
(null, "고속 연사포", "공격 속도+30%", "공격 사거리가 200% 증가하고 기본 공격이 무조건 적중", "", 4, "곡궁", "곡궁", "icon3_2_31.png", "icon3_1_5.png", "icon3_1_5.png"),
(null, "스태틱의 단검", "공격 속도+15%, 마나+15", "세 번째 기본 공격마다 3/4/5★명의 적에게 80의 마법 피해를 입히고 대상이 보호막 효과를 받는 경우 추가로 240의 고정피해", "", 4, "곡궁", "여신의 눈물", "icon3_2_32.png", "icon3_1_5.png", "icon3_1_6.png"),
(null, "루난의 허리케인", "공격 속도+15%, 마법 저항력+25", "기본 공격 시 주변 다른 적 하나에게 탄환을 발사하여 공격력의 100%만큼 피해를 입히고 적중 시 효과 적용. 추가 탄환에는 치명타가 적용될 수 있음", "", 4, "곡궁", "음전자 망토", "icon3_2_33.png", "icon3_1_5.png", "icon3_1_7.png"),
(null, "최후의 속삭임", "공격 속도+20%", "치명타 공격을 가할 경우 3초 동안 대상 방어력 75% 감소 (중첩 불가)", "[고유 - 중복 적용 불가]", 4, "곡궁", "연습용 장갑", "icon3_2_34.png", "icon3_1_5.png", "icon3_1_8.png"),
(null, "결투가의 열정", "공격 속도+15%", "장착 시 결투가 특성 획득", "[고유 - 중복 적용 불가]", 4, "곡궁", "뒤집개", "icon3_2_35.png", "icon3_1_5.png", "icon3_1_9.png"),
(null, "푸른 파수꾼", "마나+30", "스킬 사용 후 20의 마나 회복", "[고유 - 중복 적용 불가]", 4, "여신의 눈물", "여신의 눈물", "icon3_2_36.png", "icon3_1_6.png", "icon3_1_6.png"),
(null, "힘의 성배", "마나+15, 마법 저항력+25", "전투 시작 시 장착 유닛과 가로로 1칸 내에 있는 모든 아군의 주문력이 전투가 끝날 때까지 35 증가", "", 4, "여신의 눈물", "음전자 망토", "icon3_2_37.png", "icon3_1_6.png", "icon3_1_7.png"),
(null, "정의의 손길", "마나+15, 회피율+10%, 치명타 확률+10%", "준비 단계마다 다음 효과 중 하나 획득:", " -기본 준비단계마다 스킬 피해량+45% 증가 -기본 공격과 스킬 사용 시 피해량의 45%만큼 체력 회복", 4, "여신의 눈물", "연습용 장갑", "icon3_2_38.png", "icon3_1_6.png", "icon3_1_8.png"),
(null, "요술사의 모자", "마나+15", "장착 시 요술사 특성 획득", "[고유 - 중복 적용 불가]", 4, "여신의 눈물", "뒤집개", "icon3_2_39.png", "icon3_1_6.png", "icon3_1_9.png"),
(null, "용의 발톱", "마법 저항력+50", "받는 마법 피해 60% 감소", "", 4, "음전자 망토", "음전자 망토", "icon3_2_40.png", "icon3_1_7.png", "icon3_1_7.png"),
(null, "수은", "마법 저항력+25, 회피율+20%", "전투 시작 후 처음 10초 동안 군중 제어 효과에 면역", "[고유 - 중복 적용 불가]", 4, "음전자 망토", "연습용 장갑", "icon3_2_41.png", "icon3_1_7.png", "icon3_1_8.png"),
(null, "나무정령 새싹", "마법 저항력+25", "장착 시 나무정령 특성 획득", "[고유 - 중복 적용 불가]", 4, "음전자 망토", "뒤집개", "icon3_2_42.png", "icon3_1_7.png", "icon3_1_9.png"),
(null, "도적의 장갑", "치명타 확률+20%, 회피율+20%", "매 준비 단계마다 임시 아이템 2개 획득. 플레이어 레벨에 따라 아이템 성능 강화. 아이템 슬롯 3칸 소모", "", 4, "연습용 장갑", "연습용 장갑", "icon3_2_43.png", "icon3_1_8.png", "icon3_1_8.png"),
(null, "요우무의 유령검", "치명타 확률+10%, 회피율+10%", "장착 시 암살자 특성 획득", "[고유 - 중복 적용 불가]", 4, "연습용 장갑", "뒤집개", "icon3_2_44.png", "icon3_1_8.png", "icon3_1_9.png"),
(null, "대자연의 힘", "", "아군의 최대 팀 규모 +1 증가", "", 4, "뒤집개", "뒤집개", "icon3_2_45.png", "icon3_1_9.png", "icon3_1_9.png");

INSERT INTO `player_character` (`id`, `series`, `super_name`, `name`, `image1`, `image2`, `image3`) VALUES
(null, 1, "유령이", "그림자 군도 유령이", "tooltip_ghosty_spooky_tier1.png", "tooltip_ghosty_spooky_tier2.png", "tooltip_ghosty_spooky_tier3.png"),
(null, 1, "유령이", "암흑 물질 유령이", "tooltip_ghosty_purple_tier1.png", "tooltip_ghosty_purple_tier2.png", "tooltip_ghosty_purple_tier3.png"),
(null, 1, "유령이", "맹독 유령이", "tooltip_ghosty_green_tier1.png", "tooltip_ghosty_green_tier2.png", "tooltip_ghosty_green_tier3.png"),
(null, 1, "유령이", "불꽃 유령이", "tooltip_ghosty_fire_tier1.png", "tooltip_ghosty_fire_tier2.png", "tooltip_ghosty_fire_tier3.png"),
(null, 1, "유령이", "달빛 발톱 유령이", "tooltip_ghosty_blue_tier1.png", "tooltip_ghosty_blue_tier2.png", "tooltip_ghosty_blue_tier3.png"),
(null, 1, "유령이", "그림자 가면 유령이", "tooltip_ghosty_black_tier1.png", "tooltip_ghosty_black_tier2.png", "tooltip_ghosty_black_tier3.png"),
(null, 1, "유령이", "승리의 유령이", "tooltip_ghosty_victorious_tier1.png", "tooltip_ghosty_victorious_tier1.png", "tooltip_ghosty_victorious_tier1.png"),
(null, 1, "유령이", "환호의 유령이", "tooltip_ghosty_galaxiesvictorious_tier1.png", "tooltip_ghosty_galaxiesvictorious_tier1.png", "tooltip_ghosty_galaxiesvictorious_tier1.png");

INSERT INTO `player_character` (`id`, `series`, `super_name`, `name`, `image1`, `image2`, `image3`) VALUES
(null, 1, "뿔보", "이글이글 뿔보", "tooltip_grumpylion_red_tier1.png", "tooltip_grumpylion_red_tier2.png", "tooltip_grumpylion_red_tier.3png"),
(null, 1, "뿔보", "공허에 물든 뿔보", "tooltip_grumpylion_void_tier1.png", "tooltip_grumpylion_void_tier2.png", "tooltip_grumpylion_void_tier3.png"),
(null, 1, "뿔보", "나무껍질 뿔보", "tooltip_grumpylion_green_tier1.png", "tooltip_grumpylion_green_tier2.png", "tooltip_grumpylion_green_tier3.png"),
(null, 1, "뿔보", "사자 기운 뿔보", "tooltip_grumpylion_orange_tier1.png", "tooltip_grumpylion_orange_tier2.png", "tooltip_grumpylion_orange_tier3.png"),
(null, 1, "뿔보", "아이스크림 콘 뿔보", "tooltip_grumpylion_icecream_tier1.png", "tooltip_grumpylion_icecream_tier2.png", "tooltip_grumpylion_icecream_tier3.png"),
(null, 1, "뿔보", "툰드라 뿔보", "tooltip_grumpylion_dark_tier1.png", "tooltip_grumpylion_dark_tier2.png", "tooltip_grumpylion_dark_tier3.png"),
(null, 1, "뿔보", "승리의 뿔보", "tooltip_grumpylion_victorious.png", "tooltip_grumpylion_victorious.png", "tooltip_grumpylion_victorious.png"),
(null, 1, "뿔보", "K/DA ALL OUT 뿔보", "tooltip_grumpylion_kdakaisa_kda1_tier1.png", "tooltip_grumpylion_kdakaisa_kda1_tier2.png", "tooltip_grumpylion_kdakaisa_kda1_tier3.png"),
(null, 1, "뿔보", "K/DA POP/STAR 뿔보", "tooltip_grumpylion_kdakaisa_kda2_tier1.png", "tooltip_grumpylion_kdakaisa_kda2_tier2.png", "tooltip_grumpylion_kdakaisa_kda2_tier3.png");

/*  --------------------------- DESC --------------------------- */
show tables;
desc basic_item;
desc combi_item;
desc player_character;


/*  -------------------------- SELECT -------------------------- */
select * from basic_item;
-- select * from combi_item;
select id, name, value1, season, Material1, Material2, image from combi_item;
select * from player_character;