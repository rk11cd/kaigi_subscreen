# -*- coding: utf-8 -*-
tw_sprk2012 = Channel.create(:group => :tweet, :name => "sprk2012")

irc_kaigi       = Channel.create(:group => :irc,   :name => "kaigi")
irc_kaigi1      = Channel.create(:group => :irc,   :name => "kaigi1")
irc_kaigi1_m17n = Channel.create(:group => :irc,   :name => "kaigi1-m17n")
irc_kaigi2      = Channel.create(:group => :irc,   :name => "kaigi2")
irc_kaigi2_m17n = Channel.create(:group => :irc,   :name => "kaigi2-m17n")

screen1 = Screen.create(:name => "screen1", :description => "スクリーン1")
screen2 = Screen.create(:name => "screen2", :description => "スクリーン2")
screen3 = Screen.create(:name => "screen0", :description => "スクリーン3")

screen1.channels = [irc_kaigi1_m17n]
screen2.channels = [irc_kaigi2_m17n]
screen3.channels = [irc_kaigi, tw_sprk2012]

Notice.create({ :message => "Welcome to SPRK2012!", :requested_by => "darashi" })
Notice.create({ :message => "ようこそ札幌Ruby会議2012へ", :requested_by => "darashi" })
