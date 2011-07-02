# -*- coding: utf-8 -*-

Screen.create({ :name => "main-left",  :description => "大ホール左スクリーン", :tweet => true, :chat => true, :translation => true })
Screen.create({ :name => "main-right", :description => "大ホール右スクリーン", :tweet => true, :chat => true, :translation => false })
Screen.create({ :name => "sub-left",   :description => "小ホール左スクリーン", :tweet => true, :chat => true, :translation => true })
Screen.create({ :name => "sub-right",  :description => "小ホール右スクリーン", :tweet => true, :chat => true, :translation => false })
Screen.create({ :name => "foyer",      :description => "ホワイエ",             :tweet => true, :chat => true, :translation => false })

Notice.create({ :message => "これはお知らせのサンプルです",     :requested_by => "june29" })
Notice.create({ :message => "日本Ruby会議2011がはじまりました", :requested_by => "kei_s" })
Notice.create({ :message => "今日はとても暑いですね",           :requested_by => "darashi" })
