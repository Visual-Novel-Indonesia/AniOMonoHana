
;アイキャッチ

[haikei file="ec01a" st="bg" fade="cross" time="1500"]

[se file="ec"]

[haikei file="ec01b" st="bg" fade="20" time="1500"]

[wait time="2000"]

[stop_se fadeout="1500"]
[haikei file="black" st="bg" fade="cross" time="1500"]

;ＳＥ/夜の虫
[se file="se152"]

;背景　旅館外観　夜
[hide_char]
[haikei file="cmnbg0722" st="bg" fade="cross" time="2000"]

[wait time="2000"]

[stop_se fadeout="1500"]
[haikei file="black" st="bg" fade="cross" time="1500"]

;背景　旅館個室2　夜
[hide_char]
[haikei file="cmnbg0702" st="bg" fade="cross" time="1500"]

[haikei file="cmnbg0702b" st="nv" fade="cross" time="500"]

[bgm file="bgm15"]

Tomorrow is the last day of my summer job at the[r]inn.
[tp]

The day after that, I'll be returning to Tokyo.
[tp]

Despite how busy we are, my coworkers throw me a[r]small going-away party.
[tp]

;背景　旅館個室2　夜
[hide_char]
[haikei file="cmnbg0702" st="ev" fade="cross" time="500"]

;湯香里/着物/P2/Ｍ/喜ぶ
[char_c file="ta111"]
[char_action time="500"]

[name text="Yukari"]
[voice id="ykr" file="vf90_000ykr0000"]
Thanks, Takeo. You've been a big help.
[tp]

;背景　旅館個室2　夜
[hide_char]
[haikei file="cmnbg0702b" st="nv" fade="cross" time="500"]

To go along with those words of appreciation,[r]she offers me a drink.
[tp]

;背景　旅館個室2　夜
[hide_char]
[haikei file="cmnbg0702" st="bg" fade="cross" time="1000"]

[stop_bgm fadeout="1500"]
[haikei file="black" st="bg" fade="22" time="1200"]

;背景　主人公部屋　夜　消灯
[hide_char]
[haikei file="cmnbg0223" st="bg" fade="22" time="1200"]

[haikei file="cmnbg0223b" st="nv" fade="cross" time="500"]

[bgm file="bgm27"]

I return to my room after the party.
[tp]

I was planning on going to sleep, but… I can't.
[tp]

When I think of Yukari, all I feel is restless.
[tp]

;背景　主人公部屋　夜　消灯
[hide_char]
[haikei file="cmnbg0223" st="ev" fade="cross" time="500"]

[name text="Takeo"]
(I know I'll regret it if I left without having[r]said something.)
[tp]

;背景　主人公部屋　夜　消灯
[hide_char]
[haikei file="cmnbg0223b" st="nv" fade="cross" time="500"]

I get up and leave my room.
[tp]

;背景　主人公部屋　夜　消灯
[hide_char]
[haikei file="cmnbg0223" st="bg" fade="cross" time="1000"]

[haikei file="black" st="bg" fade="03" time="1200"]

;背景　旅館廊下　夜
[hide_char]
[haikei file="cmnbg0952" st="ev" fade="03" time="1200"]

[name text="Takeo"]
(I don't have much time left to spend with[r]Yukari.)
[tp]

;背景　旅館廊下　夜
[hide_char]
[haikei file="cmnbg0952b" st="nv" fade="cross" time="500"]

That's why I head for Yukari's room.
[tp]

;背景　旅館廊下　夜
[hide_char]
[haikei file="cmnbg0952" st="bg" fade="cross" time="1000"]

[haikei file="black" st="bg" fade="03" time="1200"]

;背景　ヒロインの部屋4　夜
[hide_char]
[haikei file="cmnbg1993" st="bg" fade="03" time="1200"]

;背景　ヒロインの部屋4　夜
[hide_char]
[haikei file="cmnbg1993b" st="nv" fade="cross" time="500"]

She isn't asleep yet.
[tp]

It seems she couldn't get to sleep either.
[tp]

;背景　ヒロインの部屋4　夜
[hide_char]
[haikei file="cmnbg1993" st="ev" fade="cross" time="500"]

;湯香里/着物/P1/Ｍ/きょとん
[char_c file="ta106"]
[char_action time="500"]

[name text="Yukari"]
[voice id="ykr" file="vf90_000ykr0001"]
What's wrong, Takeo? Couldn't sleep?
[tp]

;背景　ヒロインの部屋4　夜
[hide_char]
[haikei file="cmnbg1993b" st="nv" fade="cross" time="500"]

I nod.
[tp]

;背景　ヒロインの部屋4　夜
[hide_char]
[haikei file="cmnbg1993" st="ev" fade="cross" time="500"]

[name text="Takeo"]
I wanted to drink with you just a little longer.
[tp]

;湯香里/着物/P1/Ｍ/微笑
[char_c file="ta100"]
[char_action time="200"]

[name text="Yukari"]
[voice id="ykr" file="vf90_000ykr0002"]
Sure. Let's have a drink.
[tp]

;背景　ヒロインの部屋4　夜
[hide_char]
[haikei file="cmnbg1993b" st="nv" fade="cross" time="500"]

We sit on the veranda together.
[tp]

;背景　ヒロインの部屋4　夜
[hide_char]
[haikei file="cmnbg1993" st="bg" fade="cross" time="1000"]

[stopse buf="2"]
[stopse buf="3"]

[hide_char]
[hide_balloon_window]
[hide_textwindow]
[stop_bgm fadeout="1500"]
[stop_se]
[haikei file="black" st="bg" fade="cross" time="1500"]
[return]