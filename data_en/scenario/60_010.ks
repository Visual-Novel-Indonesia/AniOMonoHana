
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

All I can think about is Yukari. 
[tp]

My body is tired, but I can't go to sleep.
[tp]

;背景　主人公部屋　夜　消灯
[hide_char]
[haikei file="cmnbg0223" st="ev" fade="cross" time="500"]

[name text="Takeo"]
(Maybe I should take a short walk.)
[tp]

[hide_textwindow]
[haikei file="black" st="bg" fade="03" time="1200"]

;背景　旅館廊下　夜
[hide_char]
[haikei file="cmnbg0952" st="bg" fade="03" time="1200"]

[haikei file="cmnbg0952b" st="nv" fade="cross" time="500"]

Just as I meander out, I see a familiar woman in[r]kimono.
[tp]

;背景　旅館廊下　夜
[hide_char]
[haikei file="cmnbg0952" st="ev" fade="cross" time="500"]

[name text="Takeo"]
Yukari, what are you doing out here?
[tp]

;湯香里/着物/P2/Ｍ/きょとん
[char_c file="ta116"]
[char_action time="500"]

[name text="Yukari"]
[voice id="ykr" file="vf60_010ykr0000"]
I should ask you the same question. 
[tp]

;背景　旅館廊下　夜
[hide_char]
[haikei file="cmnbg0952b" st="nv" fade="cross" time="500"]

Yukari joins me on my midnight walk.
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