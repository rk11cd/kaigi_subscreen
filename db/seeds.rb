# -*- coding: utf-8 -*-
tweet        = Channel.create(:group => :tweet, :name => "rubykaigi")
irc_rk1      = Channel.create(:group => :irc,   :name => "rubykaigi1")
irc_rk1_m17n = Channel.create(:group => :irc,   :name => "rubykaigi1-m17n")
irc_rk2      = Channel.create(:group => :irc,   :name => "rubykaigi2")
irc_rk2_m17n = Channel.create(:group => :irc,   :name => "rubykaigi2-m17n")

main_left    = Screen.create(:name => "main-left",  :description => "大ホール左スクリーン")
main_right   = Screen.create(:name => "main-right", :description => "大ホール右スクリーン")
sub_left     = Screen.create(:name => "sub-left",   :description => "小ホール左スクリーン")
sub_right    = Screen.create(:name => "sub-right",  :description => "小ホール右スクリーン")
foyer        = Screen.create(:name => "foyer",      :description => "ホワイエ")

main_left.channels  = [tweet, irc_rk1]
main_right.channels = [irc_rk1_m17n]
sub_left.channels   = [tweet, irc_rk2]
sub_right.channels  = [irc_rk2_m17n]
foyer.channels      = [tweet]

Notice.create({ :message => "これはお知らせのサンプルです",     :requested_by => "june29" })
Notice.create({ :message => "日本Ruby会議2011がはじまりました", :requested_by => "kei_s" })
Notice.create({ :message => "今日はとても暑いですね",           :requested_by => "darashi" })
