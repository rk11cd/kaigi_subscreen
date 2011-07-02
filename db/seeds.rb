# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Screen.create({ :name => "main-left",  :tweet => true, :chat => true, :translation => true })
Screen.create({ :name => "main-right", :tweet => true, :chat => true, :translation => false })
Screen.create({ :name => "sub-left",   :tweet => true, :chat => true, :translation => true })
Screen.create({ :name => "sub-right",  :tweet => true, :chat => true, :translation => false })
Screen.create({ :name => "foyer",      :tweet => true, :chat => true, :translation => false })
