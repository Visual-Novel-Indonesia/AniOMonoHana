
;ＳＥ/夜の虫
[se file="se152"]

;背景　旅館中庭　夜
[hide_char]
[haikei file="cmnbg1322" st="bg" fade="cross" time="2000"]

[wait time="2000"]

[stop_se fadeout="1500"]
[haikei file="black" st="bg" fade="cross" time="1500"]

;ＳＥ/バケツがひっくり返るバシャー
[se file="se028"]

;背景　大浴場　夜
[hide_char]
[haikei file="cmnbg1262" st="ev" fade="cross" time="1500"]

[bgm file="bgm27"]

[name text="Takeo"]
(I want to become closer to my sister-in-law…)
[tp]

;背景　大浴場　夜
[hide_char]
[haikei file="cmnbg1262b" st="nv" fade="cross" time="500"]

I lose myself in thought.
[tp]

I've always liked her, but I've suppressed my[r]feelings toward her until now.
[tp]

She's my brother's wife, so I tried to limit[r]contact with her as much as possible.
[tp]

But my brother isn't here anymore.
[tp]

My sister-in-law is available.
[tp]

;背景　大浴場　夜
[hide_char]
[haikei file="cmnbg1262" st="ev" fade="cross" time="500"]

[name text="Takeo"]
(So it should be okay for me to make a move.)
[tp]

;背景　大浴場　夜
[hide_char]
[haikei file="cmnbg1262b" st="nv" fade="cross" time="500"]

I dismiss the thought as soon as it comes.
[tp]

;背景　大浴場　夜
[hide_char]
[haikei file="cmnbg1262" st="ev" fade="cross" time="500"]

[name text="Takeo"]
(My brother isn't here anymore, but she was my[r]brother's wife.)
[tp]

;背景　大浴場　夜
[hide_char]
[haikei file="cmnbg1262b" st="nv" fade="cross" time="500"]

I admonish myself again. 
[tp]

;背景　大浴場　夜
[hide_char]
[haikei file="cmnbg1262" st="bg" fade="cross" time="1000"]

[stopse buf="2"]
[stopse buf="3"]

[hide_char]
[hide_balloon_window]
[hide_textwindow]
[stop_bgm fadeout="1500"]
[stop_se]
[haikei file="black" st="bg" fade="cross" time="1500"]
[return]