
;アイキャッチ

[se file="ec"]

[haikei file="ec03" st="bg" fade="20" time="1500"]

[wait time="2000"]

[stop_se fadeout="1500"]
[haikei file="black" st="bg" fade="cross" time="1500"]

;背景　空　昼
[hide_char]
[haikei file="cmnbg9900" st="bg" fade="cross" time="2000"]

[wait time="2000"]

;背景　空　夕
[hide_char]
[haikei file="cmnbg9901" st="bg" fade="cross" time="2000"]

[haikei file="black" st="bg" fade="cross" time="1000"]

;背景　旅館廊下　夕
[hide_char]
[haikei file="cmnbg0951" st="bg" fade="cross" time="1500"]

[haikei file="cmnbg0951b" st="nv" fade="cross" time="500"]

[bgm file="bgm26"]

Kami menyapa sekelompok pelanggan dan membelanjakan[r]
hari dalam hiruk pikuk.
[tp]

Mengirim grup pada hari berikutnya tidak berarti[r]
pekerjaan kami selesai, meskipun.
[tp]

Semua staf ditekan untuk membersihkan semua[r]
kamar juga.
[tp]

;背景　旅館廊下　夕
[hide_char]
[haikei file="cmnbg0951" st="ev" fade="cross" time="500"]

[name text="Takeo"]
(Saya adalah manusia yang mengerikan.)
[tp]

;背景　旅館廊下　夕
[hide_char]
[haikei file="cmnbg0951b" st="nv" fade="cross" time="500"]

Saya ingat apa yang saya lakukan kemarin, dan tangan saya[r]
berhenti pada tugas saya.
[tp]

Aku tidak bisa melupakan apa yang dikatakan Yukari kepadaku.
[tp]

;背景　旅館廊下　夕
[hide_char]
[haikei file="cmnbg0951" st="ev" fade="cross" time="500"]

[name text="Takeo"]
(Apa yang harus saya katakan padanya?)
[tp]

[name text="Takeo"]
(Tidak, apa yang sebenarnya ingin saya lakukan?)
[tp]

;背景　旅館廊下　夕
[hide_char]
[haikei file="cmnbg0951b" st="nv" fade="cross" time="500"]

Saya belum memutuskan apapun.
[tp]

Saya belum mempersiapkan apapun.
[tp]

Aku terjebak di persimpangan jalan.
[tp]

Saya menempatkan diri saya untuk bekerja untuk mengalihkan perhatian dari saya[r]
masalah.
[tp]

Tidak, saya harus mengatakan saya melakukan pekerjaan saya untuk mencoba lari[r]
masalah saya.
[tp]

Akhirnya, hari itu berakhir.
[tp]

;背景　旅館廊下　夕
[hide_char]
[haikei file="cmnbg0951" st="bg" fade="cross" time="1000"]

[stopse buf="2"]
[stopse buf="3"]

[hide_char]
[hide_balloon_window]
[hide_textwindow]
[stop_bgm fadeout="1500"]
[stop_se]
[haikei file="black" st="bg" fade="cross" time="1500"]
[return]