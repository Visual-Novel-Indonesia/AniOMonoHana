
;ＳＥ/夕暮れのカラス
[se file="se154"]

;背景　空　夕
[hide_char]
[haikei file="cmnbg9901" st="bg" fade="cross" time="2000"]

[wait time="2000"]

[stop_se fadeout="1500"]
[haikei file="black" st="bg" fade="cross" time="1500"]

;背景　旅館個室2　夕
[hide_char]
[haikei file="cmnbg0701" st="bg" fade="cross" time="1500"]

[haikei file="cmnbg0701b" st="nv" fade="cross" time="500"]

[bgm file="bgm27"]

Keheningan yang sedikit canggung menyebar di antara kami[r]
kami membersihkan setelah berhubungan seks.
[tp]

Setelah kami selesai, Yukari berbicara.
[tp]

;背景　旅館個室2　夕
[hide_char]
[haikei file="cmnbg0701" st="ev" fade="cross" time="500"]

;湯香里/着物/P2/Ｍ/苦笑
[char_c file="ta117"]
[char_action time="500"]

[name text="Yukari"]
[voice id="ykr" file="vf50_040ykr0000"]
Saya senang tentang perasaan Anda untuk saya ... tapi saya[r]
tidak bisa meninggalkan penginapan.
[tp]

;湯香里/着物/P1/Ｍ/微笑
[char_c file="ta100"]
[char_action time="200"]

[name text="Yukari"]
[voice id="ykr" file="vf50_040ykr0001"]
Saya ingin mempertahankan tempat yang dikhususkan suami saya[r]
dirinya untuk.
[tp]

;湯香里/着物/P1/Ｍ/哀しい
[char_c file="ta103"]
[char_action time="200"]

[name text="Yukari"]
[voice id="ykr" file="vf50_040ykr0002"]
Takeo, kau akan pergi, kan?
[tp]

;背景　旅館個室2　夕
[hide_char]
[haikei file="cmnbg0701b" st="nv" fade="cross" time="500"]

Saya tidak bisa menjawab.
[tp]

Yang bisa saya lakukan hanyalah berdiri di sana.
[tp]

Yukari meninggalkan ruangan dengan senyum sedih.
[tp]

;背景　旅館個室2　夕
[hide_char]
[haikei file="cmnbg0701" st="bg" fade="cross" time="1000"]

[stopse buf="2"]
[stopse buf="3"]

[hide_char]
[hide_balloon_window]
[hide_textwindow]
[stop_bgm fadeout="1500"]
[stop_se]
[haikei file="black" st="bg" fade="cross" time="1500"]
[return]