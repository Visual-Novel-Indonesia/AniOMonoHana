
;ＳＥ/夜の虫
[se file="se152"]

;背景　空　夜
[hide_char]
[haikei file="cmnbg9902" st="bg" fade="cross" time="2000"]

[wait time="2000"]

[stop_se fadeout="1500"]
[haikei file="black" st="bg" fade="cross" time="1500"]

;背景　事務所　夜
[hide_char]
[haikei file="cmnbg0782" st="bg" fade="cross" time="1500"]

[haikei file="cmnbg0782b" st="nv" fade="cross" time="500"]

[bgm file="bgm20"]

We're finally done with the day's work.
[tp]

;背景　事務所　夜
[hide_char]
[haikei file="cmnbg0782" st="ev" fade="cross" time="500"]

;湯香里/着物/P1/Ｍ/苦笑
[char_c file="ta107"]
[char_action time="500"]

[name text="Yukari"]
[voice id="ykr" file="vf70_050ykr0000"]
Ugh. I think I overdid it.
[tp]

;背景　事務所　夜
[hide_char]
[haikei file="cmnbg0782b" st="nv" fade="cross" time="500"]

Yukari looks more tired than usual.
[tp]

It must be both from fatigue and sore muscles.
[tp]

;背景　事務所　夜
[hide_char]
[haikei file="cmnbg0782" st="ev" fade="cross" time="500"]

[name text="Takeo"]
Shall I give you a massage?
[tp]

;湯香里/着物/P2/Ｍ/驚き・焦り
[char_c file="ta115"]
[char_action time="500"]

[name text="Yukari"]
[voice id="ykr" file="vf70_050ykr0001"]
A massage? Do you know how?
[tp]

[name text="Takeo"]
I've done it for my parents and my brother, so[r]I'm no amateur.
[tp]

;湯香里/着物/P1/Ｍ/微笑
[char_c file="ta100"]
[char_action time="200"]

[name text="Yukari"]
[voice id="ykr" file="vf70_050ykr0002"]
I'll take you up on it, then.
[tp]

[stopse buf="2"]
[stopse buf="3"]

[hide_char]
[hide_balloon_window]
[hide_textwindow]
[stop_bgm fadeout="1500"]
[stop_se]
[haikei file="black" st="bg" fade="cross" time="1500"]
[return]