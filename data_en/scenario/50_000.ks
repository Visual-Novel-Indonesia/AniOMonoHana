
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

The next morning… 
[tp]

I get dressed and head for the office. 
[tp]

Yukari greets me with her usual smile.
[tp]

;背景　事務所　昼
[hide_char]
[haikei file="cmnbg0780" st="ev" fade="cross" time="500"]

[name text="Takeo"]
(Did she really think nothing of what happened[r]yesterday?)
[tp]

;背景　事務所　昼
[hide_char]
[haikei file="cmnbg0780b" st="nv" fade="cross" time="500"]

With her proprietress mask on, Yukari checks the[r]workers' schedules.
[tp]

;背景　事務所　昼
[hide_char]
[haikei file="cmnbg0780" st="ev" fade="cross" time="500"]

;湯香里/着物/P2/Ｍ/微笑
[char_c file="ta110"]
[char_action time="500"]

[name text="Yukari"]
[voice id="ykr" file="vf50_000ykr0000"]
Today a group of customers is coming, so it will[r]get busy.
[tp]

;湯香里/着物/P1/Ｍ/微笑
[char_c file="ta100"]
[char_action time="200"]

[name text="Yukari"]
[voice id="ykr" file="vf50_000ykr0001"]
Let's make sure the customers feel right at[r]home.
[tp]

;背景　事務所　昼
[hide_char]
[haikei file="cmnbg0780b" st="nv" fade="cross" time="500"]

Actually, we've been swamped since morning.
[tp]

We've got a lot to prepare for the group coming.
[tp]

Yukari has a huge workload as a proprietress. 
[tp]

I work my hardest to ease her burden, even if[r]just a little.
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