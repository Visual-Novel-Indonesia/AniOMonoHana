
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

We greet the group of customers and spend the[r]day in a flurry of commotion.
[tp]

Sending the group off the next day didn't mean[r]our work was finished, though.
[tp]

All the staff was pressed to clean all the[r]rooms, too.
[tp]

;背景　旅館廊下　夕
[hide_char]
[haikei file="cmnbg0951" st="ev" fade="cross" time="500"]

[name text="Takeo"]
(I am a horrible human being.)
[tp]

;背景　旅館廊下　夕
[hide_char]
[haikei file="cmnbg0951b" st="nv" fade="cross" time="500"]

I remember what I did yesterday, and my hand[r]stops at my task. 
[tp]

I can't forget what Yukari said to me.
[tp]

;背景　旅館廊下　夕
[hide_char]
[haikei file="cmnbg0951" st="ev" fade="cross" time="500"]

[name text="Takeo"]
(What should I have told her then?)
[tp]

[name text="Takeo"]
(No, what do I actually want to do?)
[tp]

;背景　旅館廊下　夕
[hide_char]
[haikei file="cmnbg0951b" st="nv" fade="cross" time="500"]

I haven't decided anything. 
[tp]

I haven't prepared for anything. 
[tp]

I'm stuck at a crossroads. 
[tp]

I put myself to work to distract myself from my[r]problems.
[tp]

No, I should say I do my work to try to run from[r]my problems.
[tp]

Finally, the day ends.
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