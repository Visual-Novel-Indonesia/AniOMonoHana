
;アイキャッチ

[haikei file="ec01a" st="bg" fade="cross" time="1500"]

[se file="ec"]

[haikei file="ec01b" st="bg" fade="20" time="1500"]

[wait time="2000"]

[stop_se fadeout="1500"]
[haikei file="black" st="bg" fade="cross" time="1500"]

;ＳＥ/小鳥の囀り
[se file="se070"]

;背景　空　昼
[hide_char]
[haikei file="cmnbg9900" st="bg" fade="cross" time="2000"]

[wait time="2000"]

[stop_se fadeout="1500"]
[haikei file="black" st="bg" fade="cross" time="1500"]

;背景　事務所　昼
[hide_char]
[haikei file="cmnbg0780" st="bg" fade="cross" time="1500"]

[haikei file="cmnbg0780b" st="nv" fade="cross" time="500"]

[bgm file="bgm15"]

Pagi selanjutnya…
[tp]

Saya berpakaian dan pergi ke kantor.
[tp]

Yukari menyapaku dengan senyumnya yang biasa.
[tp]

;背景　事務所　昼
[hide_char]
[haikei file="cmnbg0780" st="ev" fade="cross" time="500"]

[name text="Takeo"]
(Apakah dia benar-benar tidak memikirkan apa yang terjadi[r]
Kemarin?)
[tp]

;背景　事務所　昼
[hide_char]
[haikei file="cmnbg0780b" st="nv" fade="cross" time="500"]

Dengan topeng pemiliknya, Yukari memeriksa[r]
jadwal pekerja.
[tp]

;背景　事務所　昼
[hide_char]
[haikei file="cmnbg0780" st="ev" fade="cross" time="500"]

;湯香里/着物/P2/Ｍ/微笑
[char_c file="ta110"]
[char_action time="500"]

[name text="Yukari"]
[voice id="ykr" file="vf50_000ykr0000"]
Hari ini sekelompok pelanggan akan datang, jadi itu akan terjadi[r]
sibuk.
[tp]

;湯香里/着物/P1/Ｍ/微笑
[char_c file="ta100"]
[char_action time="200"]

[name text="Yukari"]
[voice id="ykr" file="vf50_000ykr0001"]
Mari kita pastikan pelanggan merasa benar[r]
rumah.
[tp]

;背景　事務所　昼
[hide_char]
[haikei file="cmnbg0780b" st="nv" fade="cross" time="500"]

Sebenarnya, kami sudah kebanjiran sejak pagi.
[tp]

Kami punya banyak hal untuk dipersiapkan untuk kedatangan grup.
[tp]

Yukari memiliki beban kerja yang sangat besar sebagai pemilik.
[tp]

Saya bekerja sekuat tenaga untuk meringankan bebannya, bahkan jika[r]
hanya sedikit.
[tp]

;背景　事務所　昼
[hide_char]
[haikei file="cmnbg0780" st="bg" fade="cross" time="1000"]

[stopse buf="2"]
[stopse buf="3"]

[hide_char]
[hide_balloon_window]
[hide_textwindow]
[stop_bgm fadeout="1500"]
[stop_se]
[haikei file="black" st="bg" fade="cross" time="1500"]
[return]