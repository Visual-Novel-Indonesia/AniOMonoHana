
;ＳＥ/夜の虫
[se file="se152"]

;背景　旅館外観　夜
[hide_char]
[haikei file="cmnbg0722" st="bg" fade="cross" time="2000"]

[wait time="2000"]

[stop_se fadeout="1500"]
[haikei file="black" st="bg" fade="cross" time="1500"]

;背景　主人公部屋　夜　消灯
[hide_char]
[haikei file="cmnbg0223" st="bg" fade="cross" time="1500"]

[haikei file="cmnbg0223b" st="nv" fade="cross" time="500"]

[bgm file="bgm27"]

Yang bisa kupikirkan hanyalah Yukari.
[tp]

Tubuhku lelah, tapi aku tidak bisa tidur.
[tp]

;背景　主人公部屋　夜　消灯
[hide_char]
[haikei file="cmnbg0223" st="ev" fade="cross" time="500"]

[name text="Takeo"]
(Mungkin saya harus berjalan-jalan sebentar.)
[tp]

[hide_textwindow]
[haikei file="black" st="bg" fade="03" time="1200"]

;背景　旅館廊下　夜
[hide_char]
[haikei file="cmnbg0952" st="bg" fade="03" time="1200"]

[haikei file="cmnbg0952b" st="nv" fade="cross" time="500"]

Saat aku keluar, aku melihat seorang wanita yang kukenal masuk[r]
kimono.
[tp]

;背景　旅館廊下　夜
[hide_char]
[haikei file="cmnbg0952" st="ev" fade="cross" time="500"]

[name text="Takeo"]
Yukari, apa yang kamu lakukan di sini?
[tp]

;湯香里/着物/P2/Ｍ/きょとん
[char_c file="ta116"]
[char_action time="500"]

[name text="Yukari"]
[voice id="ykr" file="vf60_010ykr0000"]
Saya harus menanyakan pertanyaan yang sama.
[tp]

;背景　旅館廊下　夜
[hide_char]
[haikei file="cmnbg0952b" st="nv" fade="cross" time="500"]

Yukari bergabung denganku dalam perjalanan tengah malamku.
[tp]

;背景　旅館廊下　夜
[hide_char]
[haikei file="cmnbg0952" st="bg" fade="cross" time="1000"]

[stopse buf="2"]
[stopse buf="3"]

[hide_char]
[hide_balloon_window]
[hide_textwindow]
[stop_bgm fadeout="1500"]
[stop_se]
[haikei file="black" st="bg" fade="cross" time="1500"]
[return]