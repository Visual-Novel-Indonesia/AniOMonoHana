
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

Kami akhirnya selesai dengan pekerjaan hari ini.
[tp]

;背景　事務所　夜
[hide_char]
[haikei file="cmnbg0782" st="ev" fade="cross" time="500"]

;湯香里/着物/P1/Ｍ/苦笑
[char_c file="ta107"]
[char_action time="500"]

[name text="Yukari"]
[voice id="ykr" file="vf70_050ykr0000"]
Aduh. Saya pikir saya berlebihan.
[tp]

;背景　事務所　夜
[hide_char]
[haikei file="cmnbg0782b" st="nv" fade="cross" time="500"]

Yukari terlihat lebih lelah dari biasanya.
[tp]

Itu pasti karena kelelahan dan otot yang sakit.
[tp]

;背景　事務所　夜
[hide_char]
[haikei file="cmnbg0782" st="ev" fade="cross" time="500"]

[name text="Takeo"]
Haruskah saya memberi Anda pijatan?
[tp]

;湯香里/着物/P2/Ｍ/驚き・焦り
[char_c file="ta115"]
[char_action time="500"]

[name text="Yukari"]
[voice id="ykr" file="vf70_050ykr0001"]
Pijat? Apa kamu tau bagaimana caranya?
[tp]

[name text="Takeo"]
Saya telah melakukannya untuk orang tua dan saudara laki-laki saya, jadi[r]
Saya bukan amatir.
[tp]

;湯香里/着物/P1/Ｍ/微笑
[char_c file="ta100"]
[char_action time="200"]

[name text="Yukari"]
[voice id="ykr" file="vf70_050ykr0002"]
Aku akan membawa Anda di atasnya, lalu.
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