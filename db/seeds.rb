# -*- coding: utf-8 -*-
tw_rubykaigi = Channel.create(:group => :tweet, :name => "rubykaigi")
tw_kaigi1    = Channel.create(:group => :tweet, :name => "kaigi1")
tw_kaigi2    = Channel.create(:group => :tweet, :name => "kaigi2")

irc_rk       = Channel.create(:group => :irc,   :name => "rubykaigi")
irc_rk1      = Channel.create(:group => :irc,   :name => "kaigi1")
irc_rk1_m17n = Channel.create(:group => :irc,   :name => "kaigi1-m17n")
irc_rk2      = Channel.create(:group => :irc,   :name => "kaigi2")
irc_rk2_m17n = Channel.create(:group => :irc,   :name => "kaigi2-m17n")

main_left    = Screen.create(:name => "main-left",  :description => "大ホール左スクリーン")
main_right   = Screen.create(:name => "main-right", :description => "大ホール右スクリーン")
sub_left     = Screen.create(:name => "sub-left",   :description => "小ホール左スクリーン")
sub_right    = Screen.create(:name => "sub-right",  :description => "小ホール右スクリーン")
foyer        = Screen.create(:name => "foyer",      :description => "ホワイエ")

main_left.channels  = [tw_rubykaigi, tw_kaigi1, irc_rk1]
main_right.channels = [irc_rk1_m17n]
sub_left.channels   = [tw_rubykaigi, tw_kaigi2, irc_rk2]
sub_right.channels  = [irc_rk2_m17n]
foyer.channels      = [tw_rubykaigi, tw_kaigi1, tw_kaigi2]

Notice.create({ :message => "日本Ruby会議2011がはじまりました。最後のRuby会議を大いに楽しみましょう。",
                :requested_by => "june29" })
Notice.create({ :message => "会場内の数ヶ所に、給電所を用意しています。譲り合ってご利用ください。",
                :requested_by => "june29" })
Notice.create({ :message => "「喫茶自由」には、参加者向けの飲み物があります。どうぞご利用ください。",
                :requested_by => "june29" })
