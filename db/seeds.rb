# -*- coding: utf-8 -*-

Screen.create({ :name => "main-left",  :tweet => true, :chat => true, :translation => true })
Screen.create({ :name => "main-right", :tweet => true, :chat => true, :translation => false })
Screen.create({ :name => "sub-left",   :tweet => true, :chat => true, :translation => true })
Screen.create({ :name => "sub-right",  :tweet => true, :chat => true, :translation => false })
Screen.create({ :name => "foyer",      :tweet => true, :chat => true, :translation => false })

Notice.create({ :message => "これはお知らせのサンプルです",     :requested_by => "june29" })
Notice.create({ :message => "日本Ruby会議2011がはじまりました", :requested_by => "kei_s" })
Notice.create({ :message => "今日はとても暑いですね",           :requested_by => "darashi" })
